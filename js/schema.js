// ========================================
// Schema Markup Generator for Raleigh Roof Pro
// Automatically injects appropriate schema based on page type
// ========================================

(function () {
    'use strict';

    // Base business information
    const businessInfo = {
        name: "Raleigh Roof Pro",
        legalName: "Raleigh Roof Pro LLC",
        url: "https://raleighroofpro.com",
        logo: "https://raleighroofpro.com/images/logo-light.jpg",
        image: "https://raleighroofpro.com/images/hero_homepage.png",
        telephone: "(919) 739-4051",
        email: "contact@raleighroofpro.com",
        address: {
            streetAddress: "1037 N West St",
            addressLocality: "Raleigh",
            addressRegion: "NC",
            postalCode: "27603",
            addressCountry: "US"
        },
        geo: {
            latitude: 35.7796,
            longitude: -78.6382
        },
        priceRange: "$$",
        openingHours: "Mo-Fr 08:00-17:00",
        socialLinks: [
            "https://facebook.com/raleighroofpro",
            "https://instagram.com/raleighroofpro"
        ],
        areasServed: [
            "Raleigh", "Cary", "Durham", "Apex", "Wake Forest",
            "Garner", "Chapel Hill", "Morrisville", "Holly Springs",
            "Fuquay-Varina", "Clayton", "Knightdale", "Wendell", "Rolesville"
        ]
    };

    // Service definitions for service pages
    const services = {
        'residential-roofing': {
            name: 'Residential Roofing Services',
            description: 'Complete residential roofing services including installation, replacement, and repair for homes in Raleigh and the Triangle area.',
            serviceType: 'Residential Roofing'
        },
        'commercial-roofing': {
            name: 'Commercial Roofing Services',
            description: 'Professional commercial roofing solutions including TPO, EPDM, and metal roofing systems for businesses.',
            serviceType: 'Commercial Roofing'
        },
        'roof-replacement': {
            name: 'Roof Replacement Services',
            description: 'Full roof replacement services with quality materials and expert installation. GAF and Owens Corning certified.',
            serviceType: 'Roof Replacement'
        },
        'roof-repair': {
            name: 'Roof Repair Services',
            description: 'Fast, reliable roof repair services for leaks, storm damage, and general wear. Same-day emergency service available.',
            serviceType: 'Roof Repair'
        },
        'metal-roofing': {
            name: 'Metal Roofing Installation',
            description: 'Durable metal roofing installation for residential and commercial properties. Long-lasting, energy-efficient solutions.',
            serviceType: 'Metal Roofing'
        },
        'storm-damage': {
            name: 'Storm Damage Repair',
            description: 'Emergency storm damage repair and insurance claim assistance. Available 24/7 for weather emergencies.',
            serviceType: 'Storm Damage Repair'
        },
        'emergency-repairs': {
            name: 'Emergency Roofing Repairs',
            description: '24/7 emergency roofing repair services. Fast response to protect your home from further damage.',
            serviceType: 'Emergency Repair'
        },
        'roof-inspection': {
            name: 'Free Roof Inspection',
            description: 'Comprehensive free roof inspection services. Detailed reports and honest recommendations.',
            serviceType: 'Roof Inspection'
        },
        'gutter-installation': {
            name: 'Gutter Installation Services',
            description: 'Professional gutter installation and repair. Seamless gutters and gutter guards available.',
            serviceType: 'Gutter Installation'
        },
        'siding': {
            name: 'Siding Installation Services',
            description: 'Quality siding installation and replacement. Vinyl, fiber cement, and wood siding options.',
            serviceType: 'Siding Installation'
        }
    };

    // Common FAQs for all pages
    const commonFAQs = [
        {
            question: "How much does a new roof cost in Raleigh?",
            answer: "The cost of a new roof in Raleigh typically ranges from $8,000 to $25,000+ depending on the size of your home, materials chosen, and complexity of the installation. We provide free, detailed estimates for all roofing projects."
        },
        {
            question: "Do you offer free roof inspections?",
            answer: "Yes! We offer completely free, no-obligation roof inspections. Our certified inspectors will assess your roof's condition and provide honest recommendations. Call (919) 739-4051 to schedule yours."
        },
        {
            question: "Are you licensed and insured?",
            answer: "Absolutely. Raleigh Roof Pro is fully licensed, bonded, and insured in North Carolina. We're also GAF Master Elite certified, a distinction held by only 2% of roofing contractors nationwide."
        },
        {
            question: "How long does a roof replacement take?",
            answer: "Most residential roof replacements are completed in 1-3 days, depending on the size and complexity of the project. We work efficiently to minimize disruption to your daily routine."
        },
        {
            question: "Do you help with insurance claims?",
            answer: "Yes, we provide full insurance claim assistance. We document all damage, meet with adjusters, and help ensure you receive fair compensation for storm damage repairs."
        }
    ];

    // Service-specific FAQs
    const serviceFAQs = {
        'residential-roofing': [
            {
                question: "What roofing materials do you recommend for Raleigh homes?",
                answer: "We recommend architectural shingles for most Raleigh homes due to their durability, affordability, and aesthetic appeal. For higher budgets, we offer premium options like slate, tile, and designer shingles."
            },
            {
                question: "How do I know if I need a new roof or just repairs?",
                answer: "Common signs you need a new roof include: shingles over 20 years old, multiple leaks, significant storm damage, or widespread granule loss. Our free inspection will help determine the best course of action."
            }
        ],
        'storm-damage': [
            {
                question: "What should I do immediately after storm damage?",
                answer: "First, ensure everyone's safety. Then document the damage with photos, cover any exposed areas if possible, and call us immediately at (919) 739-4051. We offer 24/7 emergency response."
            },
            {
                question: "Will my homeowner's insurance cover storm damage?",
                answer: "Most homeowner's insurance policies cover storm damage from wind, hail, and fallen trees. We work directly with insurance companies and can help you navigate the claims process."
            }
        ]
    };

    // Function to create LocalBusiness schema
    function createLocalBusinessSchema() {
        return {
            "@context": "https://schema.org",
            "@type": "RoofingContractor",
            "@id": businessInfo.url + "/#organization",
            "name": businessInfo.name,
            "legalName": businessInfo.legalName,
            "url": businessInfo.url,
            "logo": {
                "@type": "ImageObject",
                "url": businessInfo.logo
            },
            "image": businessInfo.image,
            "telephone": businessInfo.telephone,
            "email": businessInfo.email,
            "address": {
                "@type": "PostalAddress",
                ...businessInfo.address
            },
            "geo": {
                "@type": "GeoCoordinates",
                ...businessInfo.geo
            },
            "openingHoursSpecification": [
                {
                    "@type": "OpeningHoursSpecification",
                    "dayOfWeek": ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
                    "opens": "08:00",
                    "closes": "17:00"
                }
            ],
            "sameAs": businessInfo.socialLinks,
            "priceRange": businessInfo.priceRange,
            "areaServed": businessInfo.areasServed.map(city => ({
                "@type": "City",
                "name": city
            })),
            "hasOfferCatalog": {
                "@type": "OfferCatalog",
                "name": "Roofing Services",
                "itemListElement": Object.values(services).map(service => ({
                    "@type": "Offer",
                    "itemOffered": {
                        "@type": "Service",
                        "name": service.name
                    }
                }))
            },
            "aggregateRating": {
                "@type": "AggregateRating",
                "ratingValue": "5.0",
                "reviewCount": "127",
                "bestRating": "5",
                "worstRating": "1"
            }
        };
    }

    // Function to create WebSite schema
    function createWebSiteSchema() {
        return {
            "@context": "https://schema.org",
            "@type": "WebSite",
            "@id": businessInfo.url + "/#website",
            "url": businessInfo.url,
            "name": businessInfo.name,
            "description": "Professional roofing contractor serving Raleigh and the Triangle area. Expert roof replacement, repair, and installation.",
            "publisher": {
                "@id": businessInfo.url + "/#organization"
            }
        };
    }

    // Function to create BreadcrumbList schema
    function createBreadcrumbSchema() {
        const path = window.location.pathname;
        const breadcrumbs = [
            { name: "Home", url: businessInfo.url + "/" }
        ];

        // Parse current path for breadcrumbs
        if (path.includes('/services/')) {
            breadcrumbs.push({ name: "Services", url: businessInfo.url + "/services.html" });
            const serviceName = path.split('/').pop().replace('.html', '').replace(/-/g, ' ');
            if (serviceName && serviceName.trim()) {
                breadcrumbs.push({
                    name: serviceName.charAt(0).toUpperCase() + serviceName.slice(1),
                    url: businessInfo.url + path
                });
            }
        } else if (path.includes('/locations/')) {
            breadcrumbs.push({ name: "Locations", url: businessInfo.url + "/locations.html" });
            const locationName = path.split('/').pop().replace('.html', '').replace(/-/g, ' ');
            if (locationName && locationName.trim()) {
                breadcrumbs.push({
                    name: locationName.charAt(0).toUpperCase() + locationName.slice(1),
                    url: businessInfo.url + path
                });
            }
        } else if (path !== '/' && path !== '/index.html' && !path.endsWith('/index.html') && path.length > 1) {
            const pageName = path.replace(/^\//, '').replace('.html', '').replace(/-/g, ' ');
            if (pageName && pageName.trim()) {
                breadcrumbs.push({
                    name: pageName.charAt(0).toUpperCase() + pageName.slice(1),
                    url: businessInfo.url + path
                });
            }
        }

        // Only return valid BreadcrumbList with proper itemListElement
        if (breadcrumbs.length === 0) {
            breadcrumbs.push({ name: "Home", url: businessInfo.url + "/" });
        }

        return {
            "@context": "https://schema.org",
            "@type": "BreadcrumbList",
            "itemListElement": breadcrumbs.map((crumb, index) => ({
                "@type": "ListItem",
                "position": index + 1,
                "name": crumb.name,
                "item": crumb.url
            }))
        };
    }

    // Function to create SiteNavigationElement schema
    function createNavigationSchema() {
        return {
            "@context": "https://schema.org",
            "@type": "SiteNavigationElement",
            "name": "Main Navigation",
            "hasPart": [
                {
                    "@type": "SiteNavigationElement",
                    "name": "Home",
                    "url": businessInfo.url + "/"
                },
                {
                    "@type": "SiteNavigationElement",
                    "name": "Services",
                    "url": businessInfo.url + "/services.html",
                    "hasPart": Object.entries(services).map(([slug, service]) => ({
                        "@type": "SiteNavigationElement",
                        "name": service.name,
                        "url": businessInfo.url + "/services/" + slug + ".html"
                    }))
                },
                {
                    "@type": "SiteNavigationElement",
                    "name": "Locations",
                    "url": businessInfo.url + "/locations.html"
                },
                {
                    "@type": "SiteNavigationElement",
                    "name": "About",
                    "url": businessInfo.url + "/about.html"
                },
                {
                    "@type": "SiteNavigationElement",
                    "name": "Contact",
                    "url": businessInfo.url + "/contact.html"
                }
            ]
        };
    }

    // Function to create Service schema
    function createServiceSchema(serviceSlug) {
        const service = services[serviceSlug];
        if (!service) return null;

        return {
            "@context": "https://schema.org",
            "@type": "Service",
            "@id": businessInfo.url + "/services/" + serviceSlug + ".html#service",
            "name": service.name,
            "description": service.description,
            "serviceType": service.serviceType,
            "provider": {
                "@id": businessInfo.url + "/#organization"
            },
            "areaServed": businessInfo.areasServed.map(city => ({
                "@type": "City",
                "name": city
            })),
            "hasOfferCatalog": {
                "@type": "OfferCatalog",
                "name": service.name,
                "itemListElement": [{
                    "@type": "Offer",
                    "itemOffered": {
                        "@type": "Service",
                        "name": service.name,
                        "description": service.description
                    }
                }]
            }
        };
    }

    // Function to create FAQ schema
    function createFAQSchema(additionalFAQs = []) {
        const faqs = [...commonFAQs, ...additionalFAQs];

        return {
            "@context": "https://schema.org",
            "@type": "FAQPage",
            "mainEntity": faqs.map(faq => ({
                "@type": "Question",
                "name": faq.question,
                "acceptedAnswer": {
                    "@type": "Answer",
                    "text": faq.answer
                }
            }))
        };
    }

    // Function to create WebPage schema
    function createWebPageSchema() {
        const path = window.location.pathname;
        const title = document.title || businessInfo.name;
        const description = document.querySelector('meta[name="description"]')?.content || '';

        let pageType = "WebPage";
        if (path.includes('/contact')) pageType = "ContactPage";
        if (path.includes('/about')) pageType = "AboutPage";
        if (path.includes('/services/')) pageType = "WebPage";

        return {
            "@context": "https://schema.org",
            "@type": pageType,
            "@id": businessInfo.url + path + "#webpage",
            "url": businessInfo.url + path,
            "name": title,
            "description": description,
            "isPartOf": {
                "@id": businessInfo.url + "/#website"
            },
            "about": {
                "@id": businessInfo.url + "/#organization"
            },
            "breadcrumb": {
                "@id": businessInfo.url + path + "#breadcrumb"
            }
        };
    }

    // Function to inject schema into page
    function injectSchema(schemaData) {
        if (!schemaData) return;

        const script = document.createElement('script');
        script.type = 'application/ld+json';
        script.textContent = JSON.stringify(schemaData);
        document.head.appendChild(script);
    }

    // Main function to initialize all schemas
    function initSchemas() {
        const path = window.location.pathname;

        // Always inject LocalBusiness schema
        injectSchema(createLocalBusinessSchema());

        // Always inject WebSite schema (only on homepage)
        if (path === '/' || path === '/index.html' || path.endsWith('/index.html')) {
            injectSchema(createWebSiteSchema());
        }

        // Always inject WebPage schema
        injectSchema(createWebPageSchema());

        // Always inject Breadcrumb schema
        injectSchema(createBreadcrumbSchema());

        // Always inject Navigation schema
        injectSchema(createNavigationSchema());

        // Inject Service schema for service pages
        if (path.includes('/services/')) {
            const serviceSlug = path.split('/').pop().replace('.html', '');
            injectSchema(createServiceSchema(serviceSlug));

            // Add service-specific FAQs
            const additionalFAQs = serviceFAQs[serviceSlug] || [];
            injectSchema(createFAQSchema(additionalFAQs));
        } else {
            // Standard FAQ schema for non-service pages
            injectSchema(createFAQSchema());
        }
    }

    // Run when DOM is ready
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', initSchemas);
    } else {
        initSchemas();
    }
})();
