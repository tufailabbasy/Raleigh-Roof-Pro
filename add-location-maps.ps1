# Add Google Maps embed to each location page

$rootPath = "C:\Users\PC\Documents\R Roofing\locations"

# City coordinates for maps
$cities = @{
    "raleigh"       = @{ name = "Raleigh"; lat = "35.7796"; lng = "-78.6382" }
    "cary"          = @{ name = "Cary"; lat = "35.7915"; lng = "-78.7811" }
    "durham"        = @{ name = "Durham"; lat = "35.9940"; lng = "-78.8986" }
    "apex"          = @{ name = "Apex"; lat = "35.7327"; lng = "-78.8503" }
    "wake-forest"   = @{ name = "Wake Forest"; lat = "35.9799"; lng = "-78.5097" }
    "garner"        = @{ name = "Garner"; lat = "35.7113"; lng = "-78.6142" }
    "chapel-hill"   = @{ name = "Chapel Hill"; lat = "35.9132"; lng = "-79.0558" }
    "morrisville"   = @{ name = "Morrisville"; lat = "35.8235"; lng = "-78.8256" }
    "holly-springs" = @{ name = "Holly Springs"; lat = "35.6513"; lng = "-78.8336" }
    "fuquay-varina" = @{ name = "Fuquay-Varina"; lat = "35.5843"; lng = "-78.8000" }
    "clayton"       = @{ name = "Clayton"; lat = "35.6507"; lng = "-78.4564" }
    "knightdale"    = @{ name = "Knightdale"; lat = "35.7879"; lng = "-78.4806" }
    "wendell"       = @{ name = "Wendell"; lat = "35.7810"; lng = "-78.3697" }
    "rolesville"    = @{ name = "Rolesville"; lat = "35.9232"; lng = "-78.4575" }
}

foreach ($cityKey in $cities.Keys) {
    $city = $cities[$cityKey]
    $filePath = Join-Path $rootPath "$cityKey.html"
    
    if (Test-Path $filePath) {
        $content = Get-Content $filePath -Raw
        
        # Check if map already exists
        if ($content -match 'google\.com/maps/embed') {
            Write-Host "Map already exists in $cityKey.html"
            continue
        }
        
        # Create map HTML
        $mapSection = @"

    <!-- Map Section -->
    <section class="section section-gray">
        <div class="container">
            <div class="section-header">
                <h2 class="section-title">$($city.name) Service Area</h2>
                <p class="section-subtitle">Serving $($city.name) and surrounding neighborhoods</p>
            </div>
            <div style="border-radius: 1rem; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.1);">
                <iframe 
                    src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d50000!2d$($city.lng)!3d$($city.lat)!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x0!2z$($city.name)%2C%20NC!5e0!3m2!1sen!2sus!4v1703357400000!5m2!1sen!2sus"
                    width="100%" 
                    height="450" 
                    style="border:0;" 
                    allowfullscreen="" 
                    loading="lazy" 
                    referrerpolicy="no-referrer-when-downgrade">
                </iframe>
            </div>
        </div>
    </section>
"@
        
        # Insert before the final CTA section
        $pattern = '(?s)(<section class="final-cta)'
        if ($content -match $pattern) {
            $content = $content -replace $pattern, ($mapSection + "`r`n`r`n    `$1")
            Set-Content $filePath -Value $content -NoNewline
            Write-Host "Added map to $cityKey.html"
        }
        else {
            Write-Host "Could not find insertion point in $cityKey.html"
        }
    }
    else {
        Write-Host "File not found: $filePath"
    }
}

Write-Host "Done!"
