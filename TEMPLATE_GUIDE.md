# Template Customization Guide

This detailed guide explains *how* to modify the files listed in the `SITE_REPLICATION_CHECKLIST.md`.

## 1. Global Settings (`js/schema.js`)
This is the "Brain" of the website. Updating this file updates data across every page's schema markup.

*   **`businessInfo` Variable:**
    *   `name`: Your full business name.
    *   `image`: URL to your main hero image (used for rich snippets).
    *   `telephone`: Format as `(555) 123-4567`.
    *   `priceRange`: Usually `$$` for standard services.
    *   `areasServed`: Array of city strings. This affects the Schema only, not the visual menu.

*   **`services` Variable:**
    *   Keys (e.g., `'residential-roofing'`): These **MUST** match your HTML filenames in the `services/` folder (minus `.html`).
    *   `name`: The display name of the service.
    *   `description`: Short summary (1-2 sentences) for SEO.
    *   `serviceType`: Specific schema type (e.g., "DrainCleaning").

## 2. Visual Styles (`css/style.css`)
We use CSS Variables (Custom Properties) to control the theme. You can "rebrand" the site by changing just top 20 lines.

```css
:root {
    /* Primary Brand Colors */
    --color-primary: #1e3a8a;       /* <--- CHANGE ME (Main Brand Color) */
    --color-primary-dark: #1e3a8a;  /* <--- CHANGE ME (Darker shade for hover) */
    --color-accent: #f59e0b;        /* <--- CHANGE ME (Button/Call-to-Action color) */
    
    /* Gradients */
    --gradient-primary: linear-gradient(135deg, var(--color-primary) 0%, var(--color-primary-dark) 100%);
}
```

## 3. Navigation (`components/header.html`)
The menu is **not** auto-generated. You must manually edit the HTML link structure.

*   **Structure:**
    ```html
    <li class="mega-menu-container">
        <a href="services/new-service-name">Services</a>
        <div class="mega-menu">
            <!-- Update these list items -->
            <li><a href="services/new-service-name">New Service Name</a></li>
        </div>
    </li>
    ```
*   **Mobile Menu:** Ensure the "Services" and "Locations" dropdowns in the mobile view (if separate) are also updated.

## 4. Footer (`components/footer.html`)
Similar to the header, this is a manual update.

*   **Logo:** Update the `<img>` src.
*   **Description:** Update the short "About Us" blurb.
*   **Links:** Update the list of Services and Locations to match your new pages.
*   **Social:** Update `href` attributes for Facebook, Instagram, etc.

## 5. Page Titles & Meta Tags (All `.html` files)
Every HTML file has a `<head>` section. You **must** update:

```html
<title>NEW KEYWORD | NEW BUSINESS NAME</title>
<meta name="description" content="New description relevant to plumbing/electrical...">
<link rel="canonical" href="https://yournewdomain.com/this-page">
```

## 6. Sitemaps & SEO Files
*   **`sitemap.xml`**: Use a free online XML sitemap generator once your site is live, OR manually find/replace all URLs in the existing file.
*   **`robots.txt`**: Ensure it points to the correct sitemap URL: `Sitemap: https://yournewdomain.com/sitemap.xml`
