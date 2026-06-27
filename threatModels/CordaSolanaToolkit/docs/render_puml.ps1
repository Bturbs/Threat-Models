$pumlPath = Join-Path $PSScriptRoot "Multisig-playbook.puml"
$svgPath = Join-Path $PSScriptRoot "Multisig-playbook.svg"

Write-Host "Reading PlantUML file from: $pumlPath"
$pumlContent = Get-Content -Path $pumlPath -Raw

if (-not $pumlContent) {
    Write-Error "Could not read content from $pumlPath"
    exit 1
}

$url = "https://kroki.io/plantuml/svg"
Write-Host "Sending request to Kroki.io ($url)..."

try {
    $response = Invoke-RestMethod -Uri $url -Method Post -Body $pumlContent -ContentType "text/plain"
    
    # Kroki returns the SVG content directly as string or xml depending on PS version content negotiation
    # Verify if it looks like SVG
    if ($response -is [xml] -or ($response -is [string] -and $response.Trim().StartsWith("<svg"))) {
         if ($response -is [xml]) {
            $response.OuterXml | Set-Content -Path $svgPath -Encoding UTF8
         } else {
            $response | Set-Content -Path $svgPath -Encoding UTF8
         }
         Write-Host "Successfully generated SVG at: $svgPath"
         Write-Host "You can now open $svgPath in VS Code or a browser."
    } else {
        # Sometimes Invoke-RestMethod parses XML automatically. 
        # If it's an object, we might need to handle it. 
        # But usually SVG is returned as string with text/plain or image/svg+xml
        
        # Let's try to be safer by using Invoke-WebRequest to get raw content
        $webRequest = Invoke-WebRequest -Uri $url -Method Post -Body $pumlContent -ContentType "text/plain"
        $webRequest.Content | Set-Content -Path $svgPath -Encoding UTF8
        Write-Host "Successfully generated SVG at: $svgPath"
    }
}
catch {
    Write-Error "Failed to render diagram: $_"
    exit 1
}
