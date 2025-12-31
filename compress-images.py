"""
Image Compression Script for Raleigh Roof Pro Website
This script compresses all images in the /images folder without significant quality loss.
Uses Pillow library - install with: pip install Pillow
"""

import os
from PIL import Image
import sys

def compress_image(input_path, output_path, quality=85, max_dimension=2000):
    """
    Compress an image with minimal quality loss.
    
    Args:
        input_path: Path to original image
        output_path: Path to save compressed image
        quality: JPEG quality (0-100), 85 is good balance of quality and size
        max_dimension: Maximum width or height in pixels
    """
    try:
        with Image.open(input_path) as img:
            # Get original size
            original_size = os.path.getsize(input_path)
            
            # Convert RGBA to RGB if necessary (for JPEG)
            if img.mode in ('RGBA', 'P'):
                img = img.convert('RGB')
            
            # Resize if image is too large (maintains aspect ratio)
            if max(img.size) > max_dimension:
                img.thumbnail((max_dimension, max_dimension), Image.Resampling.LANCZOS)
            
            # Determine output format
            ext = os.path.splitext(output_path)[1].lower()
            
            if ext in ['.jpg', '.jpeg']:
                # Save with optimized JPEG settings
                img.save(output_path, 'JPEG', quality=quality, optimize=True)
            elif ext == '.png':
                # Save with optimized PNG settings
                img.save(output_path, 'PNG', optimize=True)
            elif ext == '.webp':
                # Save as WebP with good quality
                img.save(output_path, 'WEBP', quality=quality, method=6)
            else:
                # Default: save as JPEG
                jpeg_path = os.path.splitext(output_path)[0] + '.jpg'
                img.save(jpeg_path, 'JPEG', quality=quality, optimize=True)
                output_path = jpeg_path
            
            # Get compressed size
            compressed_size = os.path.getsize(output_path)
            
            # Calculate savings
            savings = ((original_size - compressed_size) / original_size) * 100
            
            return {
                'original': original_size,
                'compressed': compressed_size,
                'savings': savings,
                'output_path': output_path
            }
            
    except Exception as e:
        print(f"Error processing {input_path}: {e}")
        return None

def format_size(size_bytes):
    """Format bytes to human-readable size"""
    for unit in ['B', 'KB', 'MB', 'GB']:
        if size_bytes < 1024:
            return f"{size_bytes:.1f} {unit}"
        size_bytes /= 1024
    return f"{size_bytes:.1f} TB"

def main():
    # Image folder path
    script_dir = os.path.dirname(os.path.abspath(__file__))
    images_dir = os.path.join(script_dir, 'images')
    output_dir = os.path.join(script_dir, 'images_compressed')
    
    # Create output directory if it doesn't exist
    os.makedirs(output_dir, exist_ok=True)
    
    # Valid image extensions
    valid_extensions = {'.jpg', '.jpeg', '.png', '.webp'}
    
    # Track statistics
    total_original = 0
    total_compressed = 0
    processed_count = 0
    
    print("=" * 60)
    print("Raleigh Roof Pro - Image Compression Tool")
    print("=" * 60)
    print()
    
    # Get list of images
    images = [f for f in os.listdir(images_dir) 
              if os.path.splitext(f)[1].lower() in valid_extensions]
    
    print(f"Found {len(images)} images to process...")
    print()
    
    for filename in images:
        input_path = os.path.join(images_dir, filename)
        
        # Convert to JPEG for maximum compression (except WebP)
        base_name = os.path.splitext(filename)[0]
        ext = os.path.splitext(filename)[1].lower()
        
        if ext == '.webp':
            output_filename = filename
        else:
            # Convert PNG to JPEG for better compression
            output_filename = base_name + '.jpg'
        
        output_path = os.path.join(output_dir, output_filename)
        
        # Skip logo files - keep them smaller
        quality = 90 if 'logo' in filename.lower() else 82
        
        result = compress_image(input_path, output_path, quality=quality)
        
        if result:
            total_original += result['original']
            total_compressed += result['compressed']
            processed_count += 1
            
            print(f"✓ {filename}")
            print(f"  {format_size(result['original'])} → {format_size(result['compressed'])} ({result['savings']:.1f}% smaller)")
        else:
            print(f"✗ {filename} - Failed to process")
    
    print()
    print("=" * 60)
    print("SUMMARY")
    print("=" * 60)
    print(f"Images processed: {processed_count}")
    print(f"Original total: {format_size(total_original)}")
    print(f"Compressed total: {format_size(total_compressed)}")
    print(f"Total savings: {format_size(total_original - total_compressed)} ({((total_original - total_compressed) / total_original * 100):.1f}%)")
    print()
    print(f"Compressed images saved to: {output_dir}")
    print()
    print("NEXT STEPS:")
    print("1. Review the compressed images in the 'images_compressed' folder")
    print("2. If quality is acceptable, replace the originals with the compressed versions")
    print("3. Or manually copy specific images you want to use")

if __name__ == "__main__":
    main()
