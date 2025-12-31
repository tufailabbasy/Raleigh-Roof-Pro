# Add internal links to neighborhoods and service areas
# This script adds clickable links to location pages

$rootDir = "g:\My Drive\Vibe\Raleigh Roof Pro"

# Location to Location page mapping
$locationLinks = @{
    "Raleigh"       = "raleigh.html"
    "Cary"          = "cary.html"
    "Durham"        = "durham.html"
    "Apex"          = "apex.html"
    "Wake Forest"   = "wake-forest.html"
    "Garner"        = "garner.html"
    "Chapel Hill"   = "chapel-hill.html"
    "Morrisville"   = "morrisville.html"
    "Holly Springs" = "holly-springs.html"
    "Fuquay-Varina" = "fuquay-varina.html"
    "Clayton"       = "clayton.html"
    "Knightdale"    = "knightdale.html"
    "Wendell"       = "wendell.html"
    "Rolesville"    = "rolesville.html"
}

$filesFixed = 0

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Adding Internal Links to Locations" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# Process location pages - add links to "Other Locations" or similar sections
$locationFiles = Get-ChildItem -Path "$rootDir\locations" -Filter "*.html" -File

foreach ($file in $locationFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    
    # Determine the base path (for relative links within locations folder)
    $basePath = ""
    
    # Replace plain div neighborhoods with linked versions
    # Pattern: <div style="..."><strong>Location Name</strong></div>
    foreach ($location in $locationLinks.Keys) {
        $linkFile = $locationLinks[$location]
        
        # Skip linking to self (if current file matches)
        $currentFileName = $file.Name
        if ($currentFileName -eq $linkFile) {
            continue
        }
        
        # Pattern for neighborhood divs
        $pattern = '<div style="padding: 1rem; background: #f3f4f6; border-radius: 0.5rem;"><strong>' + [regex]::Escape($location) + '</strong></div>'
        $replacement = '<a href="' + $basePath + $linkFile + '" style="display: block; padding: 1rem; background: #f3f4f6; border-radius: 0.5rem; text-decoration: none; color: inherit; transition: all 0.3s;" onmouseover="this.style.background=''#e5e7eb''" onmouseout="this.style.background=''#f3f4f6''"><strong>' + $location + '</strong></a>'
        
        $content = $content -replace $pattern, $replacement
        
        # Also handle the multi-line version
        $pattern2 = '<div style="padding: 1rem; background: #f3f4f6; border-radius: 0.5rem;"><strong>' + [regex]::Escape($location) + '</strong>\s*</div>'
        $content = $content -replace $pattern2, $replacement
    }
    
    if ($content -ne $originalContent) {
        $utf8NoBom = New-Object System.Text.UTF8Encoding $false
        [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
        $filesFixed++
        Write-Host "[FIXED] $($file.Name)" -ForegroundColor Green
    }
    else {
        Write-Host "[OK] $($file.Name)" -ForegroundColor Gray
    }
}

# Process service pages - add links to service area sections
$serviceFiles = Get-ChildItem -Path "$rootDir\services" -Filter "*.html" -File

foreach ($file in $serviceFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    
    # For service pages, links need to go up one directory
    $basePath = "../locations/"
    
    foreach ($location in $locationLinks.Keys) {
        $linkFile = $locationLinks[$location]
        
        # Pattern for service area divs
        $pattern = '<div style="padding: 1.5rem; background: #f3f4f6; border-radius: 0.75rem;">\s*<strong>' + [regex]::Escape($location) + '</strong>\s*</div>'
        $replacement = '<a href="' + $basePath + $linkFile + '" style="display: block; padding: 1.5rem; background: #f3f4f6; border-radius: 0.75rem; text-decoration: none; color: inherit; transition: all 0.3s;" onmouseover="this.style.background=''#e5e7eb''" onmouseout="this.style.background=''#f3f4f6''"><strong>' + $location + '</strong></a>'
        
        $content = $content -replace $pattern, $replacement
    }
    
    if ($content -ne $originalContent) {
        $utf8NoBom = New-Object System.Text.UTF8Encoding $false
        [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
        $filesFixed++
        Write-Host "[FIXED] $($file.Name)" -ForegroundColor Green
    }
    else {
        Write-Host "[OK] $($file.Name)" -ForegroundColor Gray
    }
}

# Also process main pages (index.html, etc.)
$mainFiles = Get-ChildItem -Path $rootDir -Filter "*.html" -File

foreach ($file in $mainFiles) {
    $content = Get-Content -Path $file.FullName -Raw -Encoding UTF8
    $originalContent = $content
    
    # For main pages, links go to locations/
    $basePath = "locations/"
    
    foreach ($location in $locationLinks.Keys) {
        $linkFile = $locationLinks[$location]
        
        # Pattern for service area divs on main pages
        $pattern = '<div style="padding: 1.5rem; background: #f3f4f6; border-radius: 0.75rem;">\s*<strong>' + [regex]::Escape($location) + '</strong>\s*</div>'
        $replacement = '<a href="' + $basePath + $linkFile + '" style="display: block; padding: 1.5rem; background: #f3f4f6; border-radius: 0.75rem; text-decoration: none; color: inherit; transition: all 0.3s;" onmouseover="this.style.background=''#e5e7eb''" onmouseout="this.style.background=''#f3f4f6''"><strong>' + $location + '</strong></a>'
        
        $content = $content -replace $pattern, $replacement
    }
    
    if ($content -ne $originalContent) {
        $utf8NoBom = New-Object System.Text.UTF8Encoding $false
        [System.IO.File]::WriteAllText($file.FullName, $content, $utf8NoBom)
        $filesFixed++
        Write-Host "[FIXED] $($file.Name)" -ForegroundColor Green
    }
    else {
        Write-Host "[OK] $($file.Name)" -ForegroundColor Gray
    }
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  COMPLETE" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Files with links added: $filesFixed" -ForegroundColor White
Write-Host ""
