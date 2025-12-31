# Replace original images with compressed versions
# Creates backup before replacing

$imagesDir = "g:\My Drive\Vibe\Raleigh Roof Pro\images"
$compressedDir = "g:\My Drive\Vibe\Raleigh Roof Pro\images_compressed"
$backupDir = "g:\My Drive\Vibe\Raleigh Roof Pro\images_backup_original"

# Create backup directory
if (!(Test-Path $backupDir)) {
    New-Item -ItemType Directory -Path $backupDir -Force | Out-Null
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  REPLACING ORIGINAL IMAGES" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

# First, backup all original images
Write-Host "Step 1: Backing up original images..." -ForegroundColor Yellow
$originalImages = Get-ChildItem -Path $imagesDir -File
$backupCount = 0
foreach ($img in $originalImages) {
    $destPath = Join-Path $backupDir $img.Name
    Copy-Item -Path $img.FullName -Destination $destPath -Force
    $backupCount++
}
Write-Host "Backed up $backupCount images to: $backupDir" -ForegroundColor Green
Write-Host ""

# Now replace originals with compressed versions
Write-Host "Step 2: Replacing with compressed images..." -ForegroundColor Yellow
$compressedImages = Get-ChildItem -Path $compressedDir -File
$replacedCount = 0
$skippedCount = 0

foreach ($compImg in $compressedImages) {
    $targetPath = Join-Path $imagesDir $compImg.Name
    
    # Check if original exists (exact name match)
    if (Test-Path $targetPath) {
        Copy-Item -Path $compImg.FullName -Destination $targetPath -Force
        $replacedCount++
        Write-Host "[REPLACED] $($compImg.Name)" -ForegroundColor Green
    }
    else {
        # For PNG->JPG conversions, we need to handle differently
        # The HTML files reference the original names, so we keep both
        Copy-Item -Path $compImg.FullName -Destination $targetPath -Force
        $replacedCount++
        Write-Host "[ADDED] $($compImg.Name)" -ForegroundColor Cyan
    }
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  COMPLETE" -ForegroundColor Cyan  
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Replaced: $replacedCount images" -ForegroundColor White
Write-Host "Original images backed up to: $backupDir" -ForegroundColor Yellow
Write-Host ""
Write-Host "If you need to revert, copy images from backup folder back to images folder." -ForegroundColor Gray
Write-Host ""
