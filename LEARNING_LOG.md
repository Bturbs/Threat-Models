# Learning Log

- 2026-10-18: The threat-model generator exits before creating a site when the model directory is empty. Build the empty state through MkDocs in the Pages workflow and local preview so both use the same layout and stylesheet as published model pages.
- 2026-10-18: Keep publishing hosts opt-in through repository variables. GitHub Pages requires a public repository on GitHub Free; Azure Static Web Apps Free can publish the generated MkDocs site while the source repository remains private.
