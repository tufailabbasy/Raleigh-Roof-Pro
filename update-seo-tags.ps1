# SEO Update Script
# Updates Title and Meta Description for all site pages

$seoData = @{
    # Core Pages
    "index.html"                        = @{
        Title = "Raleigh's Trusted Roofing Contractor | Raleigh Roof Pro"
        Desc  = "Top-rated roofing company in Raleigh, NC. Expert roof replacement, repair, and storm damage services. GAF Master Elite Certified. Call (919) 739-4051 today!"
    }
    "about.html"                        = @{
        Title = "About Raleigh Roof Pro | Top Roofing Team in NC"
        Desc  = "Learn about Raleigh Roof Pro, a locally owned, GAF Master Elite certified roofing company serving Raleigh and the Triangle area with excellence and integrity."
    }
    "contact.html"                      = @{
        Title = "Contact Raleigh Roof Pro | Free Roof Inspections"
        Desc  = "Contact Raleigh Roof Pro for a free roof inspection or estimate. Emergency roofing services available 24/7 in Raleigh, Durham, and Cary. Call (919) 739-4051."
    }
    "gallery.html"                      = @{
        Title = "Roofing Project Gallery | Raleigh Roof Pro Work"
        Desc  = "View our gallery of recent roofing projects in Raleigh, NC. See examples of shingle, metal, and flat roof installations and repairs expertly completed."
    }
    "services.html"                     = @{
        Title = "Professional Roofing Services Raleigh NC | Raleigh Roof Pro"
        Desc  = "Comprehensive roofing services including repair, replacement, siding, and gutters. Serving residential and commercial clients in the Triangle area."
    }
    "locations.html"                    = @{
        Title = "Service Areas | Roofing Services Across the Triangle"
        Desc  = "Raleigh Roof Pro serves the entire Triangle area including Raleigh, Cary, Durham, Apex, and surrounding communities. Find your local roofing expert."
    }
    "financing.html"                    = @{
        Title = "Roof Financing Options Raleigh | Raleigh Roof Pro"
        Desc  = "Flexible financing options for your new roof. Low monthly payments and competitive rates available. Get the roof you need today with Raleigh Roof Pro."
    }
    "roofing-materials.html"            = @{
        Title = "Roofing Materials Guide | Raleigh Roof Pro"
        Desc  = "Explore our roofing material options: architectural shingles, metal, and flat roofing. Find the perfect, durable match for your Raleigh home's style."
    }
    "blog.html"                         = @{
        Title = "Roofing Tips & News | Raleigh Roof Pro Blog"
        Desc  = "Stay updated with the latest roofing tips, maintenance advice, and company news from Raleigh Roof Pro. Expert advice for homeowners."
    }

    # Service Pages
    "services\residential-roofing.html" = @{
        Title = "Residential Roofing Raleigh NC | Raleigh Roof Pro"
        Desc  = "Expert residential roofing services in Raleigh. From repair to full replacement, we protect your home with top-quality materials. Free estimates available."
    }
    "services\commercial-roofing.html"  = @{
        Title = "Commercial Roofing Contractors Raleigh NC | Raleigh Roof Pro"
        Desc  = "Trusted commercial roofing contractors in Raleigh. TPO, EPDM, and metal roofing solutions for businesses. Reliable service & quality workmanship guaranteed."
    }
    "services\roof-replacement.html"    = @{
        Title = "Roof Replacement Raleigh NC | New Roof Installation"
        Desc  = "Professional roof replacement services. Licensed, insured, and GAF Master Elite certified. Upgrade your home's protection with Raleigh Roof Pro."
    }
    "services\roof-repair.html"         = @{
        Title = "Roof Repair Services Raleigh NC | Fix Leaks Fast"
        Desc  = "Fast and reliable roof repair in Raleigh, NC. We fix leaks, missing shingles, and storm damage quickly. Call (919) 739-4051 for a free inspection!"
    }
    "services\storm-damage.html"        = @{
        Title = "Storm Damage Roof Repair Raleigh | Insurance Claims"
        Desc  = "Emergency storm damage repair in Raleigh. We handle hail, wind, and tree damage and assist with insurance claims. 24/7 service available."
    }
    "services\metal-roofing.html"       = @{
        Title = "Metal Roofing Raleigh NC | Durable Metal Roofs"
        Desc  = "Premium metal roofing installation in Raleigh. Long-lasting, energy-efficient, and stylish metal roof solutions for your home. Call for a quote."
    }
    "services\emergency-repairs.html"   = @{
        Title = "24/7 Emergency Roof Repair Raleigh | Raleigh Roof Pro"
        Desc  = "Immediate 24/7 emergency roof repair in Raleigh and surrounding areas. We stop leaks and prevent further damage fast. Call us anytime at (919) 739-4051."
    }
    "services\roof-inspection.html"     = @{
        Title = "Free Roof Inspection Raleigh NC | Raleigh Roof Pro"
        Desc  = "Schedule a comprehensive free roof inspection in Raleigh today. Detailed reports and honest assessments from certified professionals. No obligation."
    }
    "services\gutter-installation.html" = @{
        Title = "Gutter Installation Raleigh NC | Gutters & Guards"
        Desc  = "Professional seamless gutter installation and gutter guards in Raleigh. Protect your home from water damage with our expert gutter services."
    }
    "services\siding.html"              = @{
        Title = "Siding Contractors Raleigh NC | Repair & Installation"
        Desc  = "Expert siding installation and repair in Raleigh. Vinyl, fiber cement, and wood siding options to enhance your home's curb appeal and manufacturing."
    }

    # Location Pages
    "locations\raleigh.html"            = @{
        Title = "Roofing Contractor Raleigh NC | Raleigh Roof Pro"
        Desc  = "Your local Raleigh roofing experts. Specialized in roof replacement, repair, and storm damage. GAF Master Elite certified. Free estimates!"
    }
    "locations\cary.html"               = @{
        Title = "Roofing Contractor Cary NC | Raleigh Roof Pro"
        Desc  = "Trusted roofing services in Cary, NC. Expert workmanship for roof repairs and replacements. Local, licensed, and insured. Call (919) 739-4051 today."
    }
    "locations\durham.html"             = @{
        Title = "Roofing Contractor Durham NC | Raleigh Roof Pro"
        Desc  = "Premier roofing contractor serving Durham, NC. Reliability and quality you can trust for all your residential and commercial roofing needs."
    }
    "locations\apex.html"               = @{
        Title = "Roofing Contractor Apex NC | Raleigh Roof Pro"
        Desc  = "Top-rated roofers in Apex, NC. We provide superior roof replacement and repair services. Contact us for a free inspection and honest estimate."
    }
    "locations\wake-forest.html"        = @{
        Title = "Roofing Contractor Wake Forest NC | Raleigh Roof Pro"
        Desc  = "Expert roofing services in Wake Forest. From minor repairs to new roof installations, we deliver quality results. Licensed & insured professionals."
    }
    "locations\chapel-hill.html"        = @{
        Title = "Roofing Contractor Chapel Hill NC | Raleigh Roof Pro"
        Desc  = "Professional roofing in Chapel Hill. Preserving the beauty and integrity of your home with expert roofing solutions. Call for a competitive quote."
    }
    "locations\garner.html"             = @{
        Title = "Roofing Contractor Garner NC | Raleigh Roof Pro"
        Desc  = "Reliable roofing company in Garner, NC. Specializing in asphalt shingles, metal roofing, and storm damage repair. Satisfaction guaranteed."
    }
    "locations\holly-springs.html"      = @{
        Title = "Roofing Contractor Holly Springs NC | Raleigh Roof Pro"
        Desc  = "Holly Springs' trusted choice for roofing. Comprehensive services including inspections, repairs, and full replacements. Call (919) 739-4051."
    }
    "locations\fuquay-varina.html"      = @{
        Title = "Roofing Contractor Fuquay-Varina NC | Raleigh Roof Pro"
        Desc  = "Quality roofing in Fuquay-Varina. We offer honest assessments and expert installation. GAF Master Elite certified contractors you can trust."
    }
    "locations\clayton.html"            = @{
        Title = "Roofing Contractor Clayton NC | Raleigh Roof Pro"
        Desc  = "Expert roofers serving Clayton, NC. Protect your investment with our durable roofing solutions. Free inspections and estimates available."
    }
    "locations\knightdale.html"         = @{
        Title = "Roofing Contractor Knightdale NC | Raleigh Roof Pro"
        Desc  = "Professional roofing services in Knightdale. Fast, reliable, and affordable roof repair and replacement. Call us today for a free quote."
    }
    "locations\wendell.html"            = @{
        Title = "Roofing Contractor Wendell NC | Raleigh Roof Pro"
        Desc  = "Wendell's premier roofing experts. We handle everything from leaks to full roof replacements with care and precision. Call (919) 739-4051."
    }
    "locations\rolesville.html"         = @{
        Title = "Roofing Contractor Rolesville NC | Raleigh Roof Pro"
        Desc  = "Trusted roofing contractor in Rolesville. Dedicated to quality craftsmanship and customer satisfaction. Get your free estimate today."
    }
    "locations\morrisville.html"        = @{
        Title = "Roofing Contractor Morrisville NC | Raleigh Roof Pro"
        Desc  = "Leading roofing company in Morrisville. Commercial and residential roofing services you can rely on. Licensed and insured professionals."
    }
}

$rootDir = "g:\My Drive\Vibe\Raleigh Roof Pro"

Write-Host "Starting SEO Updates..." -ForegroundColor Cyan

foreach ($fileKey in $seoData.Keys) {
    $filePath = Join-Path $rootDir $fileKey
    if (Test-Path $filePath) {
        $data = $seoData[$fileKey]
        $content = Get-Content -Path $filePath -Raw -Encoding UTF8
        
        $originalContent = $content
        
        # 1. Update Title
        # Regex to find <title>...</title> safely across lines
        $titlePattern = '(?s)<title>.*?</title>'
        $newTitleTag = "<title>$($data.Title)</title>"
        
        if ($content -match $titlePattern) {
            $content = $content -replace $titlePattern, $newTitleTag
        }
        else {
            Write-Host "Warning: No title tag found in $fileKey" -ForegroundColor Yellow
        }

        # 2. Update Meta Description
        # Standardize strictly to <meta name="description" content="...">
        # We need to handle variations where attributes might be swapped or multiline
        
        # This regex looks for meta name="description" and replaces the whole tag
        $descPattern = '(?s)<meta\s+name="description"\s+content=".*?">'
        $newDescTag = "<meta name=`"description`" content=`"$($data.Desc)`">"
        
        # Also handle content first
        $descPatternAlt = '(?s)<meta\s+content=".*?"\s+name="description">'
        
        $replacedDesc = $false
        if ($content -match $descPattern) {
            $content = $content -replace $descPattern, $newDescTag
            $replacedDesc = $true
        }
        elseif ($content -match $descPatternAlt) {
            $content = $content -replace $descPatternAlt, $newDescTag
            $replacedDesc = $true
        }
        
        if (-not $replacedDesc) {
            # If no description exists, try to add it after <meta charset> or <head>
            if ($content -match '<meta charset="UTF-8">') {
                $content = $content -replace '<meta charset="UTF-8">', "<meta charset=`"UTF-8`">`n    $newDescTag"
                Write-Host "Added new meta description to $fileKey" -ForegroundColor Magenta
            }
            else {
                Write-Host "Warning: Could not find or place meta description in $fileKey" -ForegroundColor Yellow
            }
        }
        
        # Save if changed
        if ($content -ne $originalContent) {
            $utf8NoBom = New-Object System.Text.UTF8Encoding $false
            [System.IO.File]::WriteAllText($filePath, $content, $utf8NoBom)
            Write-Host "Updated: $fileKey" -ForegroundColor Green
        }
        else {
            Write-Host "No Changes: $fileKey" -ForegroundColor Gray
        }
        
    }
    else {
        Write-Host "Missing File: $fileKey" -ForegroundColor Red
    }
}

Write-Host "SEO Update Complete!" -ForegroundColor Cyan
