$template = Get-Content "g:\My Drive\Vibe\Raleigh Roof Pro\blog\template.html" -Raw

$posts = @(
    @{ title = "Wind Creased Shingles: The Hidden Damage"; slug = "wind-creased-shingles"; cat = "Storm Damage" },
    @{ title = "Does Insurance Cover Leaks from Pine Needles?"; slug = "pine-needles-insurance"; cat = "Maintenance" },
    @{ title = "The 'Raleigh Rot': Why Soffits Rot Faster Here"; slug = "raleigh-rot-soffits"; cat = "Local Issues" },
    @{ title = "Replacing Roofs in Raleigh's Historic Districts"; slug = "historic-district-roofing"; cat = "Local Guides" },
    @{ title = "Why Your North-Facing Roof Has Moss"; slug = "north-facing-roof-moss"; cat = "Maintenance" },
    @{ title = "Pine Needles Are Killing Your Roof: Acidity"; slug = "pine-needles-acidity"; cat = "Maintenance" },
    @{ title = "Ice Dams in North Carolina? Yes, They Happen"; slug = "ice-dams-nc"; cat = "Winter Tips" },
    @{ title = "Should You Replace Your Roof Before Selling?"; slug = "replace-roof-before-selling"; cat = "Cost & Value" },
    @{ title = "3-Tab vs. Architectural: Is the Upgrade Worth It?"; slug = "architectural-shingles-worth-it"; cat = "Materials" },
    @{ title = "Why Your Upstairs Is 10 Degrees Hotter in Summer"; slug = "roof-ventilation-cooling"; cat = "Energy" },
    @{ title = "The Truth About 'Lifetime' Warranties"; slug = "lifetime-warranty-truth"; cat = "Buying Tips" },
    @{ title = "Can I Lay New Shingles Over Old Ones? (NO)"; slug = "roof-overlay-problems"; cat = "Installation" },
    @{ title = "It's 2 AM and Water is Dripping: Emergency Tarping"; slug = "emergency-roof-tarping"; cat = "Emergency" },
    @{ title = "The 'Pop-Up' Roofer Scam: Spotting Storm Chasers"; slug = "avoid-roofer-scams"; cat = "Consumer Protection" },
    @{ title = "Why Is My Skylight Leaking Only When It Snows?"; slug = "skylight-leaks-winter"; cat = "Repairs" },
    @{ title = "Chimney Flashing: The #1 Leak We Fix in Apex"; slug = "chimney-flashing-leaks"; cat = "Repairs" },
    @{ title = "Pipe Boot Failure: The $30 Part That Ruins Ceilings"; slug = "pipe-boot-leak-repair"; cat = "Repairs" },
    @{ title = "The Real Cost of a Roof Replacement in 2025"; slug = "roof-replacement-cost-2025"; cat = "Cost & Value" },
    @{ title = "Financing a Roof: Cash vs. HELOC vs. Financing"; slug = "financing-roof-options"; cat = "Cost & Value" },
    @{ title = "Metal Roofing in Raleigh: Noisy? Hot? Expensive?"; slug = "metal-roofing-myths"; cat = "Materials" },
    @{ title = "Solar Panels on an Old Roof? Read This First"; slug = "solar-panels-roof-age"; cat = "Value Upgrade" },
    @{ title = "Gutters vs. Guards: Handling NC Pine Straw"; slug = "gutters-vs-guards-pine-straw"; cat = "Exterior" },
    @{ title = "Why Your Porch Transition is Leaking"; slug = "flat-roof-porch-leaks"; cat = "Niche Issues" },
    @{ title = "Critter Control: Squirrels & Lead Pipe Boots"; slug = "squirrel-damage-roof-vents"; cat = "Damage" },
    @{ title = "Condensation vs. Leaks: Why Your Attic is Wet"; slug = "attic-condensation-vs-leak"; cat = "Winter Tips" },
    @{ title = "The 'Black Streaks' on Your Roof Aren't Dirt"; slug = "black-streaks-roof-algae"; cat = "Maintenance" },
    @{ title = "Why We Don't Use Ridge Vents on Hip Roofs"; slug = "hip-roof-ventilation"; cat = "Technical" }
)

foreach ($post in $posts) {
    $content = $template.Replace("Blog Post Title Goes Here", $post.title)
    $content = $content.Replace("Category Name", $post.cat)
    $content = $content.Replace("Blog Post Title", $post.title)
    
    # Customize the content slightly so it's not identical
    $dummyContent = "<p>Detailed guide about $($post.title) coming soon. This topic is critical for Raleigh homeowners.</p>"
    $content = $content.Replace("Introduction paragraph goes here. Hook the reader with the problem they are facing and briefly mention how this article will solve it.", $dummyContent)
    
    $path = "g:\My Drive\Vibe\Raleigh Roof Pro\blog\$($post.slug).html"
    Set-Content -Path $path -Value $content
    Write-Host "Created $path"
}
