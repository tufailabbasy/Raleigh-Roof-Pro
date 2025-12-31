# Copy homepage header to all pages - improved pattern matching
# This script replaces the entire header section from <body> to </header>

$rootPath = "C:\Users\PC\Documents\R Roofing"

# Header template for ROOT pages (no ../ prefix)
$headerRoot = @'
    <!-- Mobile Menu Overlay -->
    <div class="mobile-menu-overlay" id="mobileMenuOverlay"></div>

    <!-- Sticky Header -->
    <header class="header" id="header">
        <div class="container header-content">
            <div class="logo">
                <a href="index.html">
                    <span class="logo-text">Raleigh Roof Pro</span>
                </a>
            </div>

            <nav class="nav" id="nav">
                <ul class="nav-list">
                    <li><a href="index.html">Home</a></li>
                    <li class="mega-menu-container">
                        <a href="services/residential-roofing.html">Services <span class="dropdown-arrow">▾</span></a>
                        <div class="mega-menu">
                            <div class="mega-menu-grid">
                                <div class="mega-menu-column">
                                    <h4>Roofing Services</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="services/residential-roofing.html">Residential Roofing</a></li>
                                        <li><a href="services/commercial-roofing.html">Commercial Roofing</a></li>
                                        <li><a href="services/roof-replacement.html">Roof Replacement</a></li>
                                        <li><a href="services/metal-roofing.html">Metal Roofing</a></li>
                                    </ul>
                                </div>
                                <div class="mega-menu-column">
                                    <h4>Repairs &amp; Additional</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="services/roof-repair.html">Roof Repair</a></li>
                                        <li><a href="services/storm-damage.html">Storm Damage</a></li>
                                        <li><a href="services/emergency-repairs.html">Emergency Repairs</a></li>
                                        <li><a href="services/roof-inspection.html">Free Inspection</a></li>
                                    </ul>
                                </div>
                                <div class="mega-menu-column">
                                    <h4>Exterior Services</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="services/gutter-installation.html">Gutter Installation</a></li>
                                        <li><a href="services/siding.html">Siding</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="mega-menu-container">
                        <a href="locations/raleigh.html">Locations <span class="dropdown-arrow">▾</span></a>
                        <div class="mega-menu">
                            <div class="mega-menu-grid">
                                <div class="mega-menu-column">
                                    <h4>Primary Areas</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="locations/raleigh.html">Raleigh</a></li>
                                        <li><a href="locations/cary.html">Cary</a></li>
                                        <li><a href="locations/durham.html">Durham</a></li>
                                        <li><a href="locations/apex.html">Apex</a></li>
                                        <li><a href="locations/wake-forest.html">Wake Forest</a></li>
                                    </ul>
                                </div>
                                <div class="mega-menu-column">
                                    <h4>More Areas</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="locations/garner.html">Garner</a></li>
                                        <li><a href="locations/chapel-hill.html">Chapel Hill</a></li>
                                        <li><a href="locations/morrisville.html">Morrisville</a></li>
                                        <li><a href="locations/holly-springs.html">Holly Springs</a></li>
                                        <li><a href="locations/fuquay-varina.html">Fuquay-Varina</a></li>
                                    </ul>
                                </div>
                                <div class="mega-menu-column">
                                    <h4>Eastern Wake</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="locations/clayton.html">Clayton</a></li>
                                        <li><a href="locations/knightdale.html">Knightdale</a></li>
                                        <li><a href="locations/wendell.html">Wendell</a></li>
                                        <li><a href="locations/rolesville.html">Rolesville</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="mega-menu-container">
                        <a href="about.html">Resources <span class="dropdown-arrow">▾</span></a>
                        <div class="mega-menu">
                            <div class="mega-menu-grid">
                                <div class="mega-menu-column">
                                    <h4>Company</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="about.html">About Us</a></li>
                                        <li><a href="gallery.html">Project Gallery</a></li>
                                        <li><a href="blog.html">Blog</a></li>
                                        <li><a href="contact.html">Contact</a></li>
                                    </ul>
                                </div>
                                <div class="mega-menu-column">
                                    <h4>Helpful Info</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="roofing-materials.html">Roofing Materials Guide</a></li>
                                        <li><a href="financing.html">Financing Options</a></li>
                                        <li><a href="services/roof-inspection.html">Free Roof Inspection</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li><a href="contact.html">Contact</a></li>
                </ul>
            </nav>

            <div class="header-cta">
                <a href="tel:9195551234" class="phone-link">
                    <svg class="phone-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M20.01 15.38c-1.23 0-2.42-.2-3.53-.56-.35-.12-.74-.03-1.01.24l-1.57 1.97c-2.83-1.35-5.48-3.9-6.89-6.83l1.95-1.66c.27-.28.35-.67.24-1.02-.37-1.11-.56-2.3-.56-3.53 0-.54-.45-.99-.99-.99H4.19C3.65 3 3 3.24 3 3.99 3 13.28 10.73 21 20.01 21c.71 0 .99-.63.99-1.18v-3.45c0-.54-.45-.99-.99-.99z" />
                    </svg>
                    (919) 555-1234
                </a>
                <a href="tel:9195551234" class="btn btn-primary">Call Now</a>
            </div>

            <button class="mobile-menu-toggle" id="mobileMenuToggle" aria-label="Toggle menu">
                <span></span>
                <span></span>
                <span></span>
            </button>
        </div>
    </header>
'@

# Header template for SUBDIRECTORY pages (with ../ prefix)
$headerSubdir = @'
    <!-- Mobile Menu Overlay -->
    <div class="mobile-menu-overlay" id="mobileMenuOverlay"></div>

    <!-- Sticky Header -->
    <header class="header" id="header">
        <div class="container header-content">
            <div class="logo">
                <a href="../index.html">
                    <span class="logo-text">Raleigh Roof Pro</span>
                </a>
            </div>

            <nav class="nav" id="nav">
                <ul class="nav-list">
                    <li><a href="../index.html">Home</a></li>
                    <li class="mega-menu-container">
                        <a href="../services/residential-roofing.html">Services <span class="dropdown-arrow">▾</span></a>
                        <div class="mega-menu">
                            <div class="mega-menu-grid">
                                <div class="mega-menu-column">
                                    <h4>Roofing Services</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="../services/residential-roofing.html">Residential Roofing</a></li>
                                        <li><a href="../services/commercial-roofing.html">Commercial Roofing</a></li>
                                        <li><a href="../services/roof-replacement.html">Roof Replacement</a></li>
                                        <li><a href="../services/metal-roofing.html">Metal Roofing</a></li>
                                    </ul>
                                </div>
                                <div class="mega-menu-column">
                                    <h4>Repairs &amp; Additional</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="../services/roof-repair.html">Roof Repair</a></li>
                                        <li><a href="../services/storm-damage.html">Storm Damage</a></li>
                                        <li><a href="../services/emergency-repairs.html">Emergency Repairs</a></li>
                                        <li><a href="../services/roof-inspection.html">Free Inspection</a></li>
                                    </ul>
                                </div>
                                <div class="mega-menu-column">
                                    <h4>Exterior Services</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="../services/gutter-installation.html">Gutter Installation</a></li>
                                        <li><a href="../services/siding.html">Siding</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="mega-menu-container">
                        <a href="../locations/raleigh.html">Locations <span class="dropdown-arrow">▾</span></a>
                        <div class="mega-menu">
                            <div class="mega-menu-grid">
                                <div class="mega-menu-column">
                                    <h4>Primary Areas</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="../locations/raleigh.html">Raleigh</a></li>
                                        <li><a href="../locations/cary.html">Cary</a></li>
                                        <li><a href="../locations/durham.html">Durham</a></li>
                                        <li><a href="../locations/apex.html">Apex</a></li>
                                        <li><a href="../locations/wake-forest.html">Wake Forest</a></li>
                                    </ul>
                                </div>
                                <div class="mega-menu-column">
                                    <h4>More Areas</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="../locations/garner.html">Garner</a></li>
                                        <li><a href="../locations/chapel-hill.html">Chapel Hill</a></li>
                                        <li><a href="../locations/morrisville.html">Morrisville</a></li>
                                        <li><a href="../locations/holly-springs.html">Holly Springs</a></li>
                                        <li><a href="../locations/fuquay-varina.html">Fuquay-Varina</a></li>
                                    </ul>
                                </div>
                                <div class="mega-menu-column">
                                    <h4>Eastern Wake</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="../locations/clayton.html">Clayton</a></li>
                                        <li><a href="../locations/knightdale.html">Knightdale</a></li>
                                        <li><a href="../locations/wendell.html">Wendell</a></li>
                                        <li><a href="../locations/rolesville.html">Rolesville</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="mega-menu-container">
                        <a href="../about.html">Resources <span class="dropdown-arrow">▾</span></a>
                        <div class="mega-menu">
                            <div class="mega-menu-grid">
                                <div class="mega-menu-column">
                                    <h4>Company</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="../about.html">About Us</a></li>
                                        <li><a href="../gallery.html">Project Gallery</a></li>
                                        <li><a href="../blog.html">Blog</a></li>
                                        <li><a href="../contact.html">Contact</a></li>
                                    </ul>
                                </div>
                                <div class="mega-menu-column">
                                    <h4>Helpful Info</h4>
                                    <ul class="mega-menu-links">
                                        <li><a href="../roofing-materials.html">Roofing Materials Guide</a></li>
                                        <li><a href="../financing.html">Financing Options</a></li>
                                        <li><a href="../services/roof-inspection.html">Free Roof Inspection</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li><a href="../contact.html">Contact</a></li>
                </ul>
            </nav>

            <div class="header-cta">
                <a href="tel:9195551234" class="phone-link">
                    <svg class="phone-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor">
                        <path d="M20.01 15.38c-1.23 0-2.42-.2-3.53-.56-.35-.12-.74-.03-1.01.24l-1.57 1.97c-2.83-1.35-5.48-3.9-6.89-6.83l1.95-1.66c.27-.28.35-.67.24-1.02-.37-1.11-.56-2.3-.56-3.53 0-.54-.45-.99-.99-.99H4.19C3.65 3 3 3.24 3 3.99 3 13.28 10.73 21 20.01 21c.71 0 .99-.63.99-1.18v-3.45c0-.54-.45-.99-.99-.99z" />
                    </svg>
                    (919) 555-1234
                </a>
                <a href="tel:9195551234" class="btn btn-primary">Call Now</a>
            </div>

            <button class="mobile-menu-toggle" id="mobileMenuToggle" aria-label="Toggle menu">
                <span></span>
                <span></span>
                <span></span>
            </button>
        </div>
    </header>
'@

# Get all HTML files except index.html and templates
$htmlFiles = Get-ChildItem -Path $rootPath -Filter "*.html" -Recurse | Where-Object { 
    $_.Name -ne 'index.html' -and 
    $_.Name -ne 'page-template.html' -and 
    $_.Name -ne 'header.html' -and 
    $_.Name -ne 'footer.html' 
}

foreach ($file in $htmlFiles) {
    $content = Get-Content $file.FullName -Raw
    
    # Determine if file is in subdirectory
    $relativePath = $file.DirectoryName.Replace($rootPath, '').TrimStart('\')
    $isSubdir = $relativePath.Length -gt 0
    
    # Choose appropriate header
    $newHeader = if ($isSubdir) { $headerSubdir } else { $headerRoot }
    
    # More flexible pattern: match from <body> through </header>
    # This catches: <div class="mobile-menu-overlay"... OR <!-- Mobile Menu... through </header>
    $pattern = '(?s)(<body>\s*)([\s\S]*?)(</header>)'
    
    if ($content -match $pattern) {
        $beforeBody = $Matches[1]
        $afterHeader = $Matches[3]
        $content = $content -replace $pattern, ($beforeBody + "`r`n" + $newHeader + "`r`n")
        Set-Content $file.FullName -Value $content -NoNewline
        Write-Host "Updated header in $($file.Name)"
    }
    else {
        Write-Host "Could not find header pattern in $($file.Name)"
    }
}

Write-Host "Done!"
