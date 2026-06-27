$pumlPath = Join-Path $PSScriptRoot "Multisig-playbook.puml"
$svgPath = Join-Path $PSScriptRoot "Multisig-playbook.svg"

Write-Host "Reading from: $pumlPath"
$pumlContent = Get-Content -Path $pumlPath -Raw

# The public PlantUML server accepts raw POST explicitly to /svg or /png
# This bypasses any local Java or extension issues.
$serverUrl = "https://www.plantuml.com/plantuml/svg"

Write-Host "Sending request to PlantUML Server ($serverUrl)..."

try {
    # -ContentType "text/plain" is often required for the raw body to be interpreted correctly
    Invoke-RestMethod -Uri $serverUrl `
        -Method Post `
        -Body $pumlContent `
        -ContentType "text/plain" `
        -OutFile $svgPath

    Write-Host "Success! Preview generated at: $svgPath"
    Write-Host "You can now open $svgPath in VS Code to view the diagram."
}
catch {
    Write-Host "Error generating preview:" -ForegroundColor Red
    Write-Host $_.Exception.Message
    if ($_.Exception.Response) {
        $reader = New-Object System.IO.StreamReader $_.Exception.Response.GetResponseStream()
        $responseBody = $reader.ReadToEnd()
        Write-Host "Server Response: $responseBody"
    }
}
