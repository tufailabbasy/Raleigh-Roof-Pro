# Update Alt Text and Internal Links Script
# This script updates all logo alt texts and fixes internal linking issues

$rootDir = "g:\My Drive\Vibe\Raleigh Roof Pro"

# Get all HTML files
$htmlFiles = Get-ChildItem -Path $rootDir -Filter "*.html" -Recurse

$improvedAltText = "Raleigh Roof Pro Logo - Professional Roofing Contractor in Raleigh NC"

foreach ($file in $htmlFiles) {
    $content = Get-Content -Path $file.FullName -Raw
    $originalContent = $content
    $madeChanges = $false
    
    # Update logo alt texts (multiple patterns)
    $content = $content -replace 'alt="Raleigh Roof Pro"(\s+class="(?:logo-img|footer-logo-img))', "alt=`"$improvedAltText`"`$1"
    
    # Also update standalone logo alt texts
    $content = $content -replace '(logo-(?:light|dark)\.jpg"\s+)alt="Raleigh Roof Pro"', "`$1alt=`"$improvedAltText`""
    
    if ($content -ne $originalContent) {
        Set-Content -Path $file.FullName -Value $content -NoNewline
        Write-Host "Updated: $($file.Name)" -ForegroundColor Green
        $madeChanges = $true
    }
    
    if (-not $madeChanges) {
        Write-Host "No changes: $($file.Name)" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "Alt text updates complete!" -ForegroundColor Cyan
