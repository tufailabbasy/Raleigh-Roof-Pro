# Add components.js to all HTML files

$rootPath = "C:\Users\PC\Documents\R Roofing"

# Get all HTML files
$htmlFiles = Get-ChildItem -Path $rootPath -Filter "*.html" -Recurse | Where-Object { $_.Name -ne 'page-template.html' -and $_.Name -ne 'header.html' -and $_.Name -ne 'footer.html' }

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    
    # Skip if already has components.js
    if ($content -match 'components\.js') {
        Write-Host "Skipping $($file.Name) - already has components.js"
        continue
    }
    
    # Determine if file is in a subdirectory
    $relativePath = $file.DirectoryName.Replace($rootPath, '').TrimStart('\')
    $isSubdir = $relativePath.Length -gt 0
    
    if ($isSubdir) {
        # For subdirectory files, use ../js/components.js
        $replacement = '    <script src="../js/components.js"></script>' + "`r`n" + '    <script src="../js/main.js"></script>'
        $content = $content -replace '<script src="\.\./js/main\.js"></script>', $replacement
    } else {
        # For root files, use js/components.js
        $replacement = '    <script src="js/components.js"></script>' + "`r`n" + '    <script src="js/main.js"></script>'
        $content = $content -replace '<script src="js/main\.js"></script>', $replacement
    }
    
    Set-Content $file.FullName -Value $content -NoNewline
    Write-Host "Updated $($file.Name)"
}

Write-Host "Done!"
