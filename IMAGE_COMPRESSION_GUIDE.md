# Image Compression Guide for Raleigh Roof Pro Website

## Current Issue
Your images in the `/images` folder are very large (2-4MB each). This significantly impacts website loading speed and SEO.

## Recommended Solutions

### Option 1: Use Online Image Compression Tools (Free)

1. **TinyPNG/TinyJPG** (https://tinypng.com)
   - Upload up to 20 images at once
   - Supports PNG, JPEG, and WebP
   - Typically achieves 50-80% file size reduction

2. **Squoosh** (https://squoosh.app)
   - Google's free image compression tool
   - More control over quality settings
   - Preview before/after quality

3. **Compressor.io** (https://compressor.io)
   - Supports lossy and lossless compression
   - Good for bulk processing

### Option 2: Install Python and Use the compress-images.py Script

1. Install Python from https://python.org/downloads
2. Open Command Prompt/PowerShell in the project folder
3. Run: `python -m pip install Pillow`
4. Run: `python compress-images.py`

### Option 3: Use Sharp CLI (Node.js)

1. Install Node.js from https://nodejs.org
2. Run: `npm install -g sharp-cli`
3. Compress images with commands like:
   ```
   sharp -i images/*.jpg -o images_compressed/ --quality 82
   ```

## Recommended Settings

For web images:
- **Maximum dimension**: 2000px (width or height)
- **Quality**: 82-85 (good balance between quality and size)
- **Format**: WebP (best) or JPEG (most compatible)

## Target File Sizes

| Image Type | Current Size | Target Size |
|------------|-------------|-------------|
| Hero images | 3-4 MB | 200-400 KB |
| Gallery images | 2-3 MB | 150-300 KB |
| Logos | 50 KB | 20-30 KB |
| Location images | 500KB-2MB | 100-200 KB |

## After Compression

1. Replace original images with compressed versions
2. Keep originals as backup in a separate folder
3. Clear browser cache to test
4. Test website loading speed at https://pagespeed.web.dev
