# New Site Replication Checklist

Use this checklist when cloning the Raleigh Roof Pro repository to create a new website for a different business (e.g., Plumbing, electrical, Landscaping).

## Phase 1: Preparation & Setup
- [ ] **Clone Repository:** Copy the entire project folder to a new directory named after the new business.
- [ ] **Clean Git:** Delete the `.git` folder to start a fresh history (`rm -rf .git`).
- [ ] **Initialize Git:** Run `git init` in the new folder.
- [ ] **Create Business Profile:** Create a new `BUSINESS_PROFILE.md` with:
    - [ ] Business Name
    - [ ] Address, Phone, Email
    - [ ] Founding Date
    - [ ] Hours
    - [ ] List of Primary Services
    - [ ] List of Target Cities

## Phase 2: Core Configuration (The "Brains")
- [ ] **Update `js/schema.js`:**
    - [ ] Update `businessInfo` object (Name, URL, Phone, Address, Geo Coords).
    - [ ] Update `services` object (Replace all roofing services with new niche services).
    - [ ] Update `commonFAQs` (General questions about pricing, estimates, etc.).
    - [ ] Update `serviceFAQs` (Specific questions for the new niche).
    - [ ] Update Schema Type (Change `RoofingContractor` to `Plumber`, `Electrician`, etc.).
- [ ] **Update `CNAME`:** If using GitHub Pages, update the `CNAME` file with the new domain.
- [ ] **Update `robots.txt`:** Ensure the Sitemap URL matches the new domain.
- [ ] **Update `sitemap.xml`:**
    - [ ] Find & Replace old domain `raleighroofpro.com` with the new domain.
    - [ ] Update URLs to match new service pages (see Phase 4).

## Phase 3: Visual Identity (The "Look")
- [ ] **Update Images (`images/` folder):**
    - [ ] **Logo:** Replace `logo-light.jpg` and `logo-dark.jpg`.
    - [ ] **Favicon:** Replace `favicon.ico` or `logo.png`.
    - [ ] **Hero Images:** Replace `hero_homepage.jpg`, `hero_about.jpg`, etc.
    - [ ] **Project Images:** Delete old roofing photos; add niche-specific project photos.
    - [ ] **Team Photos:** Replace `roofing_team.jpeg` with a real team photo or high-quality stock.
- [ ] **Update CSS Variables (`css/style.css`):**
    - [ ] `primary-color`: Change Blue (`#1e3a8a`) to the new brand color.
    - [ ] `accent-color`: Update for buttons/highlights.
    - [ ] `text-color`: Adjust if necessary (usually safe to keep).

## Phase 4: Core Pages (Content Rewrite)
*Note: Do not just find/replace. Rewrite the "body" text to match the new industry.*
- [ ] **Update `index.html` (Homepage):**
    - [ ] Hero Section Headline & Subtitle.
    - [ ] "Trust Bar" Stats (Years, Projects Completed).
    - [ ] Services Grid (Icons and Titles).
    - [ ] Reviews/Testimonials.
- [ ] **Update `about.html`:**
    - [ ] "Our Story" (Founding year, background).
    - [ ] "Mission & Values".
    - [ ] Team section.
- [ ] **Update `contact.html`:**
    - [ ] Verify Address/Phone matches `schema.js`.
    - [ ] Test the contact form (if applicable) or phone links.
- [ ] **Update Components (`components/header.html` & `components/footer.html`):**
    - [ ] Update Navigation Links (Menu items).
    - [ ] Update Footer Address/Phone.
    - [ ] Update Copyright Year & Business Name.
    - [ ] Update Social Media Links.

## Phase 5: Service Pages
- [ ] **Rename Files:**
    - [ ] Rename `services/residential-roofing.html` -> `services/drain-cleaning.html` (example).
    - [ ] Rename `services/commercial-roofing.html` -> `services/water-heaters.html` (example).
    - [ ] Delete unused service pages.
- [ ] **Update Content per Page:**
    - [ ] **Title Tag & Meta Description:** Critical for SEO.
    - [ ] **H1 Headline:** Main keyword.
    - [ ] **Intro Text:** Problem/Solution specific to the service.
    - [ ] **Features/Process:** How you perform this service.
    - [ ] **FAQs:** Update page-specific FAQs.
    - [ ] **Images:** Ensure `alt` tags describe the new service.

## Phase 6: Location Pages
- [ ] **Keep or Update Cities:**
    - [ ] If serving the same area (Raleigh), keep the files (`locations/raleigh.html`, etc.).
    - [ ] If new area, rename files (e.g., `locations/charlotte.html`).
- [ ] **Update Content:**
    - [ ] Find & Replace "Roofing" with "Plumbing" (etc.).
    - [ ] **CRITICAL:** Rewrite the "Why specific-city homeowners choose us" section to be relevant.
    - [ ] Update "Local Landmarks" text if the city has changed.

## Phase 7: Final Polish & Verification
- [ ] **Global Search:** Run a `grep` or "Find in Files" for:
    - [ ] "Roof" (Make sure none slipped through).
    - [ ] "Shingle" / "Leak" / "Storm Damage".
    - [ ] Old Phone Number.
    - [ ] Old Business Name.
- [ ] **Link Check:**
    - [ ] Click every link in the Header/Footer.
    - [ ] Verify "Call Now" buttons dial the correct number.
- [ ] **Mobile Check:** Open on phone to ensure logos/colors look good.
- [ ] **PageSpeed:** Run a quick LightHouse audit.

## Phase 8: Deployment
- [ ] **Push to New Repo:** `git remote add origin [new-repo-url]`.
- [ ] **Connect Domain:** Configure DNS settings.
- [ ] **Google Search Console:** Verify the new property.
- [ ] **Google My Business:** Update the website URL on your GMB profile.
