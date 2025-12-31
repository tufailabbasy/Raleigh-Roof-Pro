# Add Nearby Cities sections to all location pages
# Inserts content before the Map Section comment

$rootDir = "g:\My Drive\Vibe\Raleigh Roof Pro\locations"

# Define nearby cities HTML for each location
$nearbyCitiesHTML = @{
    "cary"          = @"

            <!-- Nearby Cities -->
            <div class="section-header" style="margin-top: 3rem;">
                <h3 style="font-size: 1.5rem; color: #1f2937;">We Also Serve Nearby Cities</h3>
            </div>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem; text-align: center;">
                <a href="raleigh.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Raleigh</strong></a>
                <a href="apex.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Apex</strong></a>
                <a href="morrisville.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Morrisville</strong></a>
                <a href="durham.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Durham</strong></a>
                <a href="holly-springs.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Holly Springs</strong></a>
                <a href="chapel-hill.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Chapel Hill</strong></a>
            </div>
        </div>
    </section>

    
"@
    "durham"        = @"

            <!-- Nearby Cities -->
            <div class="section-header" style="margin-top: 3rem;">
                <h3 style="font-size: 1.5rem; color: #1f2937;">We Also Serve Nearby Cities</h3>
            </div>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem; text-align: center;">
                <a href="raleigh.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Raleigh</strong></a>
                <a href="chapel-hill.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Chapel Hill</strong></a>
                <a href="morrisville.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Morrisville</strong></a>
                <a href="cary.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Cary</strong></a>
                <a href="apex.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Apex</strong></a>
                <a href="wake-forest.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Wake Forest</strong></a>
            </div>
        </div>
    </section>

    
"@
    "apex"          = @"

            <!-- Nearby Cities -->
            <div class="section-header" style="margin-top: 3rem;">
                <h3 style="font-size: 1.5rem; color: #1f2937;">We Also Serve Nearby Cities</h3>
            </div>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem; text-align: center;">
                <a href="cary.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Cary</strong></a>
                <a href="raleigh.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Raleigh</strong></a>
                <a href="holly-springs.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Holly Springs</strong></a>
                <a href="fuquay-varina.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Fuquay-Varina</strong></a>
                <a href="morrisville.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Morrisville</strong></a>
                <a href="durham.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Durham</strong></a>
            </div>
        </div>
    </section>

    
"@
    "wake-forest"   = @"

            <!-- Nearby Cities -->
            <div class="section-header" style="margin-top: 3rem;">
                <h3 style="font-size: 1.5rem; color: #1f2937;">We Also Serve Nearby Cities</h3>
            </div>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem; text-align: center;">
                <a href="raleigh.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Raleigh</strong></a>
                <a href="rolesville.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Rolesville</strong></a>
                <a href="knightdale.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Knightdale</strong></a>
                <a href="durham.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Durham</strong></a>
                <a href="cary.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Cary</strong></a>
                <a href="garner.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Garner</strong></a>
            </div>
        </div>
    </section>

    
"@
    "garner"        = @"

            <!-- Nearby Cities -->
            <div class="section-header" style="margin-top: 3rem;">
                <h3 style="font-size: 1.5rem; color: #1f2937;">We Also Serve Nearby Cities</h3>
            </div>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem; text-align: center;">
                <a href="raleigh.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Raleigh</strong></a>
                <a href="clayton.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Clayton</strong></a>
                <a href="fuquay-varina.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Fuquay-Varina</strong></a>
                <a href="cary.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Cary</strong></a>
                <a href="apex.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Apex</strong></a>
                <a href="knightdale.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Knightdale</strong></a>
            </div>
        </div>
    </section>

    
"@
    "chapel-hill"   = @"

            <!-- Nearby Cities -->
            <div class="section-header" style="margin-top: 3rem;">
                <h3 style="font-size: 1.5rem; color: #1f2937;">We Also Serve Nearby Cities</h3>
            </div>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem; text-align: center;">
                <a href="durham.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Durham</strong></a>
                <a href="cary.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Cary</strong></a>
                <a href="morrisville.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Morrisville</strong></a>
                <a href="raleigh.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Raleigh</strong></a>
                <a href="apex.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Apex</strong></a>
                <a href="holly-springs.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Holly Springs</strong></a>
            </div>
        </div>
    </section>

    
"@
    "morrisville"   = @"

            <!-- Nearby Cities -->
            <div class="section-header" style="margin-top: 3rem;">
                <h3 style="font-size: 1.5rem; color: #1f2937;">We Also Serve Nearby Cities</h3>
            </div>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem; text-align: center;">
                <a href="cary.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Cary</strong></a>
                <a href="raleigh.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Raleigh</strong></a>
                <a href="durham.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Durham</strong></a>
                <a href="apex.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Apex</strong></a>
                <a href="chapel-hill.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Chapel Hill</strong></a>
                <a href="wake-forest.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Wake Forest</strong></a>
            </div>
        </div>
    </section>

    
"@
    "holly-springs" = @"

            <!-- Nearby Cities -->
            <div class="section-header" style="margin-top: 3rem;">
                <h3 style="font-size: 1.5rem; color: #1f2937;">We Also Serve Nearby Cities</h3>
            </div>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem; text-align: center;">
                <a href="apex.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Apex</strong></a>
                <a href="fuquay-varina.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Fuquay-Varina</strong></a>
                <a href="cary.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Cary</strong></a>
                <a href="raleigh.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Raleigh</strong></a>
                <a href="garner.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Garner</strong></a>
                <a href="chapel-hill.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Chapel Hill</strong></a>
            </div>
        </div>
    </section>

    
"@
    "fuquay-varina" = @"

            <!-- Nearby Cities -->
            <div class="section-header" style="margin-top: 3rem;">
                <h3 style="font-size: 1.5rem; color: #1f2937;">We Also Serve Nearby Cities</h3>
            </div>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem; text-align: center;">
                <a href="holly-springs.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Holly Springs</strong></a>
                <a href="apex.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Apex</strong></a>
                <a href="garner.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Garner</strong></a>
                <a href="raleigh.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Raleigh</strong></a>
                <a href="cary.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Cary</strong></a>
                <a href="clayton.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Clayton</strong></a>
            </div>
        </div>
    </section>

    
"@
    "clayton"       = @"

            <!-- Nearby Cities -->
            <div class="section-header" style="margin-top: 3rem;">
                <h3 style="font-size: 1.5rem; color: #1f2937;">We Also Serve Nearby Cities</h3>
            </div>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem; text-align: center;">
                <a href="garner.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Garner</strong></a>
                <a href="raleigh.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Raleigh</strong></a>
                <a href="knightdale.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Knightdale</strong></a>
                <a href="cary.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Cary</strong></a>
                <a href="fuquay-varina.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Fuquay-Varina</strong></a>
                <a href="wendell.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Wendell</strong></a>
            </div>
        </div>
    </section>

    
"@
    "knightdale"    = @"

            <!-- Nearby Cities -->
            <div class="section-header" style="margin-top: 3rem;">
                <h3 style="font-size: 1.5rem; color: #1f2937;">We Also Serve Nearby Cities</h3>
            </div>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem; text-align: center;">
                <a href="raleigh.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Raleigh</strong></a>
                <a href="wendell.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Wendell</strong></a>
                <a href="garner.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Garner</strong></a>
                <a href="wake-forest.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Wake Forest</strong></a>
                <a href="clayton.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Clayton</strong></a>
                <a href="rolesville.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Rolesville</strong></a>
            </div>
        </div>
    </section>

    
"@
    "wendell"       = @"

            <!-- Nearby Cities -->
            <div class="section-header" style="margin-top: 3rem;">
                <h3 style="font-size: 1.5rem; color: #1f2937;">We Also Serve Nearby Cities</h3>
            </div>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem; text-align: center;">
                <a href="knightdale.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Knightdale</strong></a>
                <a href="raleigh.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Raleigh</strong></a>
                <a href="garner.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Garner</strong></a>
                <a href="clayton.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Clayton</strong></a>
                <a href="rolesville.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Rolesville</strong></a>
                <a href="wake-forest.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Wake Forest</strong></a>
            </div>
        </div>
    </section>

    
"@
    "rolesville"    = @"

            <!-- Nearby Cities -->
            <div class="section-header" style="margin-top: 3rem;">
                <h3 style="font-size: 1.5rem; color: #1f2937;">We Also Serve Nearby Cities</h3>
            </div>
            <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(150px, 1fr)); gap: 1rem; text-align: center;">
                <a href="wake-forest.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Wake Forest</strong></a>
                <a href="raleigh.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Raleigh</strong></a>
                <a href="knightdale.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Knightdale</strong></a>
                <a href="wendell.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Wendell</strong></a>
                <a href="durham.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Durham</strong></a>
                <a href="garner.html" style="display: block; padding: 1rem; background: #1e3a8a; color: white; border-radius: 0.5rem; text-decoration: none; transition: all 0.3s;" onmouseover="this.style.background='#1e40af'" onmouseout="this.style.background='#1e3a8a'"><strong>Garner</strong></a>
            </div>
        </div>
    </section>

    
"@
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  Adding Nearby Cities to Location Pages" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host ""

$filesUpdated = 0

foreach ($location in $nearbyCitiesHTML.Keys) {
    $filePath = Join-Path $rootDir "$location.html"
    
    if (Test-Path $filePath) {
        $content = Get-Content -Path $filePath -Raw -Encoding UTF8
        
        # Check if already has nearby cities
        if ($content -match "We Also Serve Nearby Cities") {
            Write-Host "[SKIP] $location.html - Already has nearby cities" -ForegroundColor Yellow
            continue
        }
        
        # Insert before </section> that comes before <!-- Map Section -->
        $insertHtml = $nearbyCitiesHTML[$location]
        $content = $content -replace '</section>\s*\r?\n\s*\r?\n\s*<!-- Map Section -->', "$insertHtml`r`n    <!-- Map Section -->"
        
        $utf8NoBom = New-Object System.Text.UTF8Encoding $false
        [System.IO.File]::WriteAllText($filePath, $content, $utf8NoBom)
        
        Write-Host "[ADDED] $location.html" -ForegroundColor Green
        $filesUpdated++
    }
    else {
        Write-Host "[MISS] $location.html - File not found" -ForegroundColor Red
    }
}

Write-Host ""
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "  COMPLETE" -ForegroundColor Cyan
Write-Host "============================================" -ForegroundColor Cyan
Write-Host "Files updated: $filesUpdated" -ForegroundColor White
Write-Host ""
