/**
 * Global Components Loader
 * Loads header and footer components dynamically
 * 
 * Usage:
 * 1. Add <div id="site-header"></div> where you want the header
 * 2. Add <div id="site-footer"></div> where you want the footer
 * 3. Include this script: <script src="js/components.js"></script>
 * 
 * For pages in subdirectories (services/, locations/), the script
 * automatically adjusts relative paths.
 */

(function () {
    'use strict';

    // Determine base path based on current page location
    function getBasePath() {
        const path = window.location.pathname;
        // Check if we're in a subdirectory
        if (path.includes('/services/') || path.includes('/locations/')) {
            return '../';
        }
        return '';
    }

    // Load a component into a target element
    async function loadComponent(componentPath, targetId, basePath) {
        const target = document.getElementById(targetId);
        if (!target) return;

        try {
            const response = await fetch(basePath + componentPath);
            if (!response.ok) throw new Error(`Failed to load ${componentPath}`);

            let html = await response.text();

            // Replace {BASE} placeholders with actual base path
            html = html.replace(/\{BASE\}/g, basePath);

            target.innerHTML = html;

            // Dispatch event when component is loaded
            target.dispatchEvent(new CustomEvent('component-loaded', {
                detail: { component: componentPath }
            }));
        } catch (error) {
            console.error(`Error loading component ${componentPath}:`, error);
        }
    }

    // Initialize components when DOM is ready
    function init() {
        const basePath = getBasePath();

        // Load header and footer
        Promise.all([
            loadComponent('components/header.html', 'site-header', basePath),
            loadComponent('components/footer.html', 'site-footer', basePath)
        ]).then(() => {
            // Re-initialize mobile menu after header loads
            initMobileMenu();
            // Re-initialize mega menu hover effects
            initMegaMenus();
            // Initialize search functionality
            initSearch();
        });
    }

    // Search functionality
    function initSearch() {
        const searchToggle = document.getElementById('searchToggle');
        const searchModal = document.getElementById('searchModal');
        const searchClose = document.getElementById('searchClose');
        const searchInput = document.getElementById('searchInput');

        if (!searchToggle || !searchModal) return;

        // Open search modal
        searchToggle.addEventListener('click', () => {
            searchModal.classList.add('active');
            document.body.style.overflow = 'hidden';
            setTimeout(() => searchInput?.focus(), 100);
        });

        // Close search modal
        const closeSearch = () => {
            searchModal.classList.remove('active');
            document.body.style.overflow = '';
        };

        if (searchClose) {
            searchClose.addEventListener('click', closeSearch);
        }

        // Close on overlay click
        searchModal.addEventListener('click', (e) => {
            if (e.target === searchModal) closeSearch();
        });

        // Close on Escape key
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && searchModal.classList.contains('active')) {
                closeSearch();
            }
        });

        // Open with Ctrl+K or Cmd+K
        document.addEventListener('keydown', (e) => {
            if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
                e.preventDefault();
                searchModal.classList.add('active');
                document.body.style.overflow = 'hidden';
                setTimeout(() => searchInput?.focus(), 100);
            }
        });
    }

    // Mobile menu initialization
    function initMobileMenu() {
        const mobileMenuToggle = document.getElementById('mobileMenuToggle');
        const nav = document.getElementById('nav');
        const overlay = document.getElementById('mobileMenuOverlay');

        if (!mobileMenuToggle || !nav) return;

        mobileMenuToggle.addEventListener('click', function () {
            nav.classList.toggle('nav-open');
            mobileMenuToggle.classList.toggle('active');
            if (overlay) overlay.classList.toggle('active');
            document.body.classList.toggle('menu-open');
        });

        if (overlay) {
            overlay.addEventListener('click', function () {
                nav.classList.remove('nav-open');
                mobileMenuToggle.classList.remove('active');
                overlay.classList.remove('active');
                document.body.classList.remove('menu-open');
            });
        }
    }

    // Mega menu initialization for touch devices
    function initMegaMenus() {
        const megaMenuContainers = document.querySelectorAll('.mega-menu-container');

        megaMenuContainers.forEach(container => {
            const link = container.querySelector('a');
            if (!link) return;

            // For touch devices, prevent navigation on first tap
            link.addEventListener('click', function (e) {
                if (window.innerWidth <= 1024) {
                    const isOpen = container.classList.contains('active');

                    // Close all other menus
                    megaMenuContainers.forEach(c => c.classList.remove('active'));

                    if (!isOpen) {
                        e.preventDefault();
                        container.classList.add('active');
                    }
                }
            });
        });

        // Close menus when clicking outside
        document.addEventListener('click', function (e) {
            if (!e.target.closest('.mega-menu-container')) {
                megaMenuContainers.forEach(c => c.classList.remove('active'));
            }
        });
    }

    // Run initialization
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
