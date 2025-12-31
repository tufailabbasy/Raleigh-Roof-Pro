# Script to update sidebar styling classes on service and location pages
$files = Get-ChildItem -Path "C:\Users\PC\Documents\R Roofing\locations", "C:\Users\PC\Documents\R Roofing\services" -Filter "*.html" -Recurse

foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw -Encoding UTF8
    
    # Update the CTA card with sidebar-cta class
    $content = $content -replace 'style="background-color: #1e3a8a; color: white; border-radius: 1rem; padding: 2rem; margin-bottom: 1.5rem;"', 'class="sidebar-cta"'
    
    # Update the heading in CTA card
    $content = $content -replace '<h3 style="color: white; margin-bottom: 1rem;">', '<h3>'
    
    # Update paragraph in CTA card
    $content = $content -replace '<p style="color: rgba\(255,255,255,0\.9\); margin-bottom: 1\.5rem;">', '<p>'
    
    # Update the services list card with sidebar-services class
    $content = $content -replace 'style="background-color: #f3f4f6; border-radius: 1rem; padding: 2rem;"', 'class="sidebar-services"'
    
    # Update the service list heading
    $content = $content -replace '<h4 style="margin-bottom: 1rem;">', '<h4>'
    
    # Update the list styling
    $content = $content -replace '<ul style="list-style: none; padding: 0;">', '<ul>'
    
    # Update list items - remove checkmarks as CSS will add them
    $content = $content -replace '<li style="padding: 0\.75rem 0; border-bottom: 1px solid #e5e7eb;">✓ ', '<li>'
    $content = $content -replace '<li style="padding: 0\.75rem 0;">✓ ', '<li>'
    $content = $content -replace '<li style="padding: 0\.75rem 0; border-bottom: 1px solid #e5e7eb;">', '<li>'
    $content = $content -replace '<li style="padding: 0\.75rem 0;">', '<li>'
    
    # Update FAQ styling
    $content = $content -replace '<div style="max-width: 800px; margin: 0 auto;">', '<div class="faq-container">'
    $content = $content -replace '<div style="background: white; border-radius: 1rem; padding: 2rem; margin-bottom: 1rem;">', '<div class="faq-item">'
    $content = $content -replace '<div style="background: white; border-radius: 1rem; padding: 2rem;">', '<div class="faq-item">'
    $content = $content -replace '<h3 style="font-size: 1\.25rem; margin-bottom: 1rem;">', '<h3>'
    $content = $content -replace '<p style="color: #374151; line-height: 1\.7;">', '<p>'
    
    # Save the updated file
    Set-Content -Path $file.FullName -Value $content -Encoding UTF8
    Write-Host "Updated: $($file.Name)"
}

Write-Host "`nAll pages updated with new sidebar classes!"
