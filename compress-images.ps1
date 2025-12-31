# PowerShell Image Compression Script for Raleigh Roof Pro
# Uses .NET System.Drawing to compress images without external dependencies

Add-Type -AssemblyName System.Drawing

$imagesDir = "g:\My Drive\Vibe\Raleigh Roof Pro\images"
$outputDir = "g:\My Drive\Vibe\Raleigh Roof Pro\images_compressed"

# Create output directory if it doesn't exist
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

# Quality settings (0-100, 80-85 is good balance)
$quality = 82
$maxDimension = 1800

function Format-FileSize {
    param([long]$size)
    if ($size -gt 1MB) { return ("{0:N1} MB" -f ($size / 1MB)) }
    if ($size -gt 1KB) { return ("{0:N1} KB" -f ($size / 1KB)) }
    return "$size B"
}

function Compress-Image {
    param(
        [string]$inputPath,
        [string]$outputPath,
        [int]$qualityValue = 82,
        [int]$maxDim = 1800
    )
    
    try {
        $originalSize = (Get-Item $inputPath).Length
        
        # Load the image
        $image = [System.Drawing.Image]::FromFile($inputPath)
        
        # Calculate new dimensions if needed (maintain aspect ratio)
        $width = $image.Width
        $height = $image.Height
        
        if ($width -gt $maxDim -or $height -gt $maxDim) {
            if ($width -gt $height) {
                $newWidth = $maxDim
                $newHeight = [int]($height * ($maxDim / $width))
            }
            else {
                $newHeight = $maxDim
                $newWidth = [int]($width * ($maxDim / $height))
            }
            
            # Create resized image
            $newImage = New-Object System.Drawing.Bitmap($newWidth, $newHeight)
            $graphics = [System.Drawing.Graphics]::FromImage($newImage)
            $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
            $graphics.DrawImage($image, 0, 0, $newWidth, $newHeight)
            $graphics.Dispose()
            $image.Dispose()
            $image = $newImage
        }
        
        # Set up encoder parameters for quality
        $encoder = [System.Drawing.Imaging.Encoder]::Quality
        $encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
        $encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter($encoder, [long]$qualityValue)
        
        # Get the JPEG codec
        $jpegCodec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq "image/jpeg" }
        
        # Determine output format (convert PNG to JPEG for better compression)
        $ext = [System.IO.Path]::GetExtension($inputPath).ToLower()
        if ($ext -eq ".png" -or $ext -eq ".webp") {
            $outputPath = [System.IO.Path]::ChangeExtension($outputPath, ".jpg")
        }
        
        # Save with compression
        $image.Save($outputPath, $jpegCodec, $encoderParams)
        $image.Dispose()
        
        $compressedSize = (Get-Item $outputPath).Length
        $savings = [math]::Round((($originalSize - $compressedSize) / $originalSize) * 100, 1)
        
        return @{
            Success        = $true
            OriginalSize   = $originalSize
            CompressedSize = $compressedSize
            Savings        = $savings
            OutputPath     = $outputPath
        }
    }
    catch {
        Write-Host "Error processing $inputPath : $_" -ForegroundColor Red
        return @{ Success = $false }
    }
}

# Get all image files using multiple filter patterns
$images = @()
$images += Get-ChildItem -Path $imagesDir -Filter "*.jpg" -File -ErrorAction SilentlyContinue
$images += Get-ChildItem -Path $imagesDir -Filter "*.jpeg" -File -ErrorAction SilentlyContinue
$images += Get-ChildItem -Path $imagesDir -Filter "*.png" -File -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Raleigh Roof Pro - Image Compression" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""
Write-Host "Source folder: $imagesDir" -ForegroundColor Gray
Write-Host "Found $($images.Count) images to process..." -ForegroundColor Yellow
Write-Host ""

$totalOriginal = 0
$totalCompressed = 0
$processedCount = 0

foreach ($imageFile in $images) {
    $inputPath = $imageFile.FullName
    $outputPath = Join-Path $outputDir $imageFile.Name
    
    # Use higher quality for logos
    $imageQuality = 82
    if ($imageFile.Name -match "logo") { $imageQuality = 90 }
    
    $result = Compress-Image -inputPath $inputPath -outputPath $outputPath -qualityValue $imageQuality -maxDim $maxDimension
    
    if ($result.Success) {
        $totalOriginal += $result.OriginalSize
        $totalCompressed += $result.CompressedSize
        $processedCount++
        
        $originalFormatted = Format-FileSize $result.OriginalSize
        $compressedFormatted = Format-FileSize $result.CompressedSize
        
        Write-Host "[OK] $($imageFile.Name)" -ForegroundColor Green
        Write-Host "     $originalFormatted -> $compressedFormatted ($($result.Savings)% smaller)" -ForegroundColor Gray
    }
    else {
        Write-Host "[FAIL] $($imageFile.Name) - Failed" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  SUMMARY" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Images processed: $processedCount" -ForegroundColor White
Write-Host "Original total: $(Format-FileSize $totalOriginal)" -ForegroundColor White
Write-Host "Compressed total: $(Format-FileSize $totalCompressed)" -ForegroundColor White

if ($totalOriginal -gt 0) {
    $totalSavings = [math]::Round((($totalOriginal - $totalCompressed) / $totalOriginal) * 100, 1)
    Write-Host "Total savings: $(Format-FileSize ($totalOriginal - $totalCompressed)) ($totalSavings%)" -ForegroundColor Green
}
Write-Host ""
Write-Host "Compressed images saved to: $outputDir" -ForegroundColor Yellow
Write-Host ""
