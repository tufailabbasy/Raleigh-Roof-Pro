// ========================================
// Theme Toggle (Dark/Light Mode)
// ========================================

function initTheme() {
    const themeToggle = document.getElementById('themeToggle');

    // Check for saved theme preference or default to system preference
    const savedTheme = localStorage.getItem('theme');
    const systemPrefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;

    if (savedTheme) {
        document.documentElement.setAttribute('data-theme', savedTheme);
    } else if (systemPrefersDark) {
        document.documentElement.setAttribute('data-theme', 'dark');
    }

    // Create theme toggle button if it doesn't exist
    if (!themeToggle) {
        createThemeToggle();
    }

    // Listen for system theme changes
    window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
        if (!localStorage.getItem('theme')) {
            document.documentElement.setAttribute('data-theme', e.matches ? 'dark' : 'light');
        }
    });
}

function createThemeToggle() {
    const toggle = document.createElement('button');
    toggle.id = 'themeToggle';
    toggle.className = 'theme-toggle';
    toggle.setAttribute('aria-label', 'Toggle dark mode');
    toggle.innerHTML = `
        <svg class="sun-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="12" cy="12" r="5"></circle>
            <line x1="12" y1="1" x2="12" y2="3"></line>
            <line x1="12" y1="21" x2="12" y2="23"></line>
            <line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line>
            <line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line>
            <line x1="1" y1="12" x2="3" y2="12"></line>
            <line x1="21" y1="12" x2="23" y2="12"></line>
            <line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line>
            <line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line>
        </svg>
        <svg class="moon-icon" xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M21 12.79A9 9 0 1 1 11.21 3 7 7 0 0 0 21 12.79z"></path>
        </svg>
    `;

    toggle.addEventListener('click', toggleTheme);
    document.body.appendChild(toggle);
}

function toggleTheme() {
    const currentTheme = document.documentElement.getAttribute('data-theme');
    const newTheme = currentTheme === 'dark' ? 'light' : 'dark';

    document.documentElement.setAttribute('data-theme', newTheme);
    localStorage.setItem('theme', newTheme);

    // Add animation feedback
    const toggle = document.getElementById('themeToggle');
    if (toggle) {
        toggle.style.transform = 'scale(0.8) rotate(180deg)';
        setTimeout(() => {
            toggle.style.transform = '';
        }, 200);
    }
}

// ========================================
// Scroll Animations (Intersection Observer)
// ========================================

function initScrollAnimations() {
    // Elements to animate
    const animatedElements = document.querySelectorAll(`
        .section-header,
        .service-card,
        .feature-card,
        .testimonial-card,
        .process-step,
        .trust-item,
        .service-area-text,
        .service-area-map,
        .footer-grid > div
    `);

    // Add animation classes
    animatedElements.forEach((el, index) => {
        el.classList.add('animate-on-scroll', 'fade-up');

        // Add stagger delay for grid items
        const parent = el.parentElement;
        if (parent && (parent.classList.contains('services-grid') ||
            parent.classList.contains('features-grid') ||
            parent.classList.contains('testimonials-grid') ||
            parent.classList.contains('process-steps') ||
            parent.classList.contains('trust-indicators') ||
            parent.classList.contains('footer-grid'))) {
            const siblings = Array.from(parent.children);
            const siblingIndex = siblings.indexOf(el);
            el.classList.add(`stagger-${Math.min(siblingIndex + 1, 6)}`);
        }
    });

    // Create intersection observer
    const observerOptions = {
        root: null,
        rootMargin: '0px 0px -50px 0px',
        threshold: 0.1
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
                observer.unobserve(entry.target); // Only animate once
            }
        });
    }, observerOptions);

    // Observe all animated elements
    animatedElements.forEach(el => observer.observe(el));
}

// ========================================
// Mobile Menu Functionality
// ========================================

function initMobileMenu() {
    const mobileMenuToggle = document.getElementById('mobileMenuToggle');
    const nav = document.getElementById('nav');
    const mobileMenuOverlay = document.getElementById('mobileMenuOverlay');

    if (mobileMenuToggle && nav) {
        mobileMenuToggle.addEventListener('click', () => {
            nav.classList.toggle('active');
            mobileMenuToggle.classList.toggle('active');
            if (mobileMenuOverlay) {
                mobileMenuOverlay.classList.toggle('active');
                mobileMenuOverlay.style.display = mobileMenuOverlay.classList.contains('active') ? 'block' : 'none';
            }
            document.body.style.overflow = nav.classList.contains('active') ? 'hidden' : '';
        });
    }

    if (mobileMenuOverlay) {
        mobileMenuOverlay.addEventListener('click', () => {
            if (nav) nav.classList.remove('active');
            if (mobileMenuToggle) mobileMenuToggle.classList.remove('active');
            mobileMenuOverlay.classList.remove('active');
            mobileMenuOverlay.style.display = 'none';
            document.body.style.overflow = '';
        });
    }

    // Mobile submenu toggle
    const megaMenuContainers = document.querySelectorAll('.mega-menu-container');
    const dropdowns = document.querySelectorAll('.dropdown');

    const handleMobileSubmenu = (containers) => {
        containers.forEach(container => {
            const link = container.querySelector(':scope > a');
            if (link) {
                link.addEventListener('click', (e) => {
                    // Only apply mobile behavior when in mobile viewport
                    if (window.innerWidth <= 768) {
                        const hasSubmenu = container.querySelector('.mega-menu') || container.querySelector('.dropdown-menu');
                        if (hasSubmenu) {
                            e.preventDefault();
                            e.stopPropagation();

                            // Close other open submenus
                            const allContainers = document.querySelectorAll('.mega-menu-container, .dropdown');
                            allContainers.forEach(other => {
                                if (other !== container) {
                                    other.classList.remove('mobile-active');
                                }
                            });

                            container.classList.toggle('mobile-active');
                        }
                    }
                });
            }
        });
    };

    handleMobileSubmenu(megaMenuContainers);
    handleMobileSubmenu(dropdowns);
}

// ========================================
// Sticky Header with Scroll Effects
// ========================================

function initStickyHeader() {
    const header = document.getElementById('header') || document.querySelector('.header');

    if (!header) return;

    let lastScroll = 0;
    let ticking = false;

    window.addEventListener('scroll', () => {
        if (!ticking) {
            window.requestAnimationFrame(() => {
                const currentScroll = window.pageYOffset;

                if (currentScroll > 100) {
                    header.classList.add('scrolled');
                } else {
                    header.classList.remove('scrolled');
                }

                lastScroll = currentScroll;
                ticking = false;
            });
            ticking = true;
        }
    });
}

// ========================================
// Smooth Scroll for Anchor Links
// ========================================

function initSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            const href = this.getAttribute('href');
            if (href !== '#' && href.length > 1) {
                const target = document.querySelector(href);
                if (target) {
                    e.preventDefault();
                    target.scrollIntoView({
                        behavior: 'smooth',
                        block: 'start'
                    });

                    // Close mobile menu if open
                    const nav = document.getElementById('nav');
                    const mobileMenuToggle = document.getElementById('mobileMenuToggle');
                    const mobileMenuOverlay = document.getElementById('mobileMenuOverlay');

                    if (nav && nav.classList.contains('active')) {
                        nav.classList.remove('active');
                        if (mobileMenuToggle) mobileMenuToggle.classList.remove('active');
                        if (mobileMenuOverlay) {
                            mobileMenuOverlay.classList.remove('active');
                            mobileMenuOverlay.style.display = 'none';
                        }
                        document.body.style.overflow = '';
                    }
                }
            }
        });
    });
}

// ========================================
// Button Hover Effects
// ========================================

function initButtonEffects() {
    const buttons = document.querySelectorAll('.btn');

    buttons.forEach(btn => {
        // Add ripple effect on click
        btn.addEventListener('click', function (e) {
            const ripple = document.createElement('span');
            ripple.classList.add('btn-ripple');

            const rect = this.getBoundingClientRect();
            const size = Math.max(rect.width, rect.height);

            ripple.style.width = ripple.style.height = size + 'px';
            ripple.style.left = e.clientX - rect.left - size / 2 + 'px';
            ripple.style.top = e.clientY - rect.top - size / 2 + 'px';

            this.appendChild(ripple);

            setTimeout(() => ripple.remove(), 600);
        });
    });
}

// ========================================
// Form Validation
// ========================================

function initFormValidation() {
    const forms = document.querySelectorAll('form');

    forms.forEach(form => {
        form.addEventListener('submit', function (e) {
            const requiredFields = form.querySelectorAll('[required]');
            let isValid = true;

            requiredFields.forEach(field => {
                if (!field.value.trim()) {
                    isValid = false;
                    field.classList.add('error');
                    field.style.borderColor = 'var(--color-error)';
                } else {
                    field.classList.remove('error');
                    field.style.borderColor = '';
                }
            });

            if (!isValid) {
                e.preventDefault();

                // Shake animation for invalid form
                form.style.animation = 'shake 0.5s ease-in-out';
                setTimeout(() => {
                    form.style.animation = '';
                }, 500);
            }
        });

        // Real-time validation
        form.querySelectorAll('[required]').forEach(field => {
            field.addEventListener('blur', function () {
                if (!this.value.trim()) {
                    this.style.borderColor = 'var(--color-error)';
                } else {
                    this.style.borderColor = 'var(--color-success)';
                }
            });

            field.addEventListener('focus', function () {
                this.style.borderColor = 'var(--color-accent)';
            });
        });
    });
}

// ========================================
// Counter Animation (for trust numbers)
// ========================================

function initCounterAnimation() {
    const counters = document.querySelectorAll('.trust-number');

    const animateCounter = (counter) => {
        const text = counter.textContent.trim();
        
        // Check if the content is primarily numeric (has a number at the start)
        const numericMatch = text.match(/^([\d,.]+)/);
        
        // Skip if no numeric value found (e.g., "Local")
        if (!numericMatch) {
            return;
        }
        
        const numericPart = numericMatch[1].replace(/,/g, '');
        const target = parseFloat(numericPart);
        
        // Skip if not a valid number
        if (isNaN(target)) {
            return;
        }
        
        // Get the suffix (everything after the number)
        const suffix = text.substring(numericMatch[0].length);
        
        // Check if it's a decimal number
        const isDecimal = numericPart.includes('.');
        const decimalPlaces = isDecimal ? (numericPart.split('.')[1] || '').length : 0;
        
        const duration = 2000;
        const increment = target / (duration / 16);
        let current = 0;

        const updateCounter = () => {
            current += increment;
            if (current < target) {
                if (isDecimal) {
                    counter.textContent = current.toFixed(decimalPlaces) + suffix;
                } else {
                    counter.textContent = Math.ceil(current) + suffix;
                }
                requestAnimationFrame(updateCounter);
            } else {
                // Restore original format
                counter.textContent = numericMatch[0] + suffix;
            }
        };

        updateCounter();
    };

    const counterObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                animateCounter(entry.target);
                counterObserver.unobserve(entry.target);
            }
        });
    }, { threshold: 0.5 });

    counters.forEach(counter => counterObserver.observe(counter));
}

// ========================================
// Parallax Effect for Hero
// ========================================

function initParallax() {
    const hero = document.querySelector('.hero');

    if (hero && window.innerWidth > 768) {
        window.addEventListener('scroll', () => {
            const scrolled = window.pageYOffset;
            const rate = scrolled * 0.3;

            if (scrolled < window.innerHeight) {
                hero.style.backgroundPositionY = rate + 'px';
            }
        });
    }
}

// ========================================
// Back to Top Button
// ========================================

function initBackToTop() {
    // Create back to top button if it doesn't exist
    let backToTop = document.getElementById('backToTop');

    if (!backToTop) {
        backToTop = document.createElement('button');
        backToTop.id = 'backToTop';
        backToTop.className = 'back-to-top';
        backToTop.setAttribute('aria-label', 'Back to top');
        backToTop.innerHTML = `
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <polyline points="18 15 12 9 6 15"></polyline>
            </svg>
        `;
        document.body.appendChild(backToTop);
    }

    // Scroll to top on click
    backToTop.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    // Show/hide based on scroll position
    let ticking = false;

    window.addEventListener('scroll', () => {
        if (!ticking) {
            window.requestAnimationFrame(() => {
                if (window.pageYOffset > 400) {
                    backToTop.classList.add('visible');
                } else {
                    backToTop.classList.remove('visible');
                }
                ticking = false;
            });
            ticking = true;
        }
    });
}

// ========================================
// Sticky Call Button
// ========================================

function initStickyCall() {
    // Create sticky call button if it doesn't exist
    let stickyCall = document.getElementById('stickyCall');

    if (!stickyCall) {
        stickyCall = document.createElement('a');
        stickyCall.id = 'stickyCall';
        stickyCall.className = 'sticky-call';
        stickyCall.href = 'tel:+19195101528';
        stickyCall.setAttribute('aria-label', 'Call us now');
        stickyCall.innerHTML = `
            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07 19.5 19.5 0 0 1-6-6 19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 4.11 2h3a2 2 0 0 1 2 1.72 12.84 12.84 0 0 0 .7 2.81 2 2 0 0 1-.45 2.11L8.09 9.91a16 16 0 0 0 6 6l1.27-1.27a2 2 0 0 1 2.11-.45 12.84 12.84 0 0 0 2.81.7A2 2 0 0 1 22 16.92z"></path>
            </svg>
            <span class="sticky-call-text">Call Now!</span>
        `;
        document.body.appendChild(stickyCall);
    }

    // Show/hide based on scroll position
    let ticking = false;

    window.addEventListener('scroll', () => {
        if (!ticking) {
            window.requestAnimationFrame(() => {
                if (window.pageYOffset > 300) {
                    stickyCall.classList.add('visible');
                } else {
                    stickyCall.classList.remove('visible');
                }
                ticking = false;
            });
            ticking = true;
        }
    });
}

// ========================================
// Initialize Everything
// ========================================

document.addEventListener('DOMContentLoaded', () => {
    initTheme();
    initMobileMenu();
    initStickyHeader();
    initSmoothScroll();
    initScrollAnimations();
    initButtonEffects();
    initFormValidation();
    initCounterAnimation();
    initParallax();
    initBackToTop();
    initStickyCall();

    // Add loaded class to body for initial animations
    document.body.classList.add('loaded');
});

// Export for use in other scripts
if (typeof module !== 'undefined' && module.exports) {
    module.exports = { toggleTheme, initTheme };
}
