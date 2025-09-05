# AGENTS.md - Development Guidelines for Laravel Project

This document outlines the development, testing, and coding standards for the Laravel project, with **strict backend protection** and **modern frontend development** focus. The agent has permission to modify only frontend code while maintaining production-level quality, modern UI standards, and ensuring no disruption to existing application functionality.

## 🚨 CRITICAL RESTRICTIONS

### Backend Protection
- **NEVER modify any PHP files** (Controllers, Models, Migrations, Routes, Config, etc.)
- **NEVER alter database schema** or existing database operations
- **NEVER change API endpoints** or their functionality
- **NEVER modify Laravel configuration files**
- **Backend code is production-tested and must remain untouched**

### Frontend Modification Authority
- **Full permission** to update HTML/Blade templates (views only)
- **Full permission** to modify CSS and JavaScript
- **Full permission** to enhance UI/UX without breaking functionality
- **Must maintain** all existing form submissions and data flow
- **Must preserve** all existing JavaScript functionality

## Test and Validation Commands

### Frontend Testing
```bash
# Validate HTML structure
npx html-validate resources/views/**/*.blade.php

# Check CSS for errors
npx stylelint "public/css/**/*.css" "resources/css/**/*.css"

# Validate JavaScript
npx eslint "public/js/**/*.js" "resources/js/**/*.js"

# Test responsive design
# Use browser dev tools to test breakpoints: 320px, 768px, 1024px, 1440px, 1920px
```

### Compatibility Testing
```bash
# Test existing functionality after UI updates
# Manual testing required for:
# - All forms submit correctly
# - All buttons and links work
# - All JavaScript interactions function
# - No console errors
# - Mobile responsiveness maintained
```

## Modern Frontend Standards

### HTML/Blade Templates

#### Modern Semantic Structure
```html
<!-- Use modern HTML5 semantic elements -->
<main class="main-content">
    <section class="hero-section">
        <header class="section-header">
            <h1 class="heading-primary">{{ $title }}</h1>
        </header>
    </section>
</main>

<!-- Accessibility-first approach -->
<button 
    type="button"
    class="btn btn--primary"
    aria-label="Submit form"
    aria-describedby="submit-help"
>
    Submit
</button>
<div id="submit-help" class="sr-only">This will save your changes</div>
```

#### Modern Blade Practices
- Use `@push` and `@stack` for page-specific assets
- Implement component-based architecture with Blade components
- Use `@once` directive for performance optimization
- Maintain existing `@csrf` tokens and form structures

### CSS - Modern Industry Standards

#### CSS Architecture
```css
/* Use CSS Custom Properties (CSS Variables) */
:root {
    --color-primary: #3b82f6;
    --color-primary-dark: #2563eb;
    --color-gray-50: #f9fafb;
    --color-gray-900: #111827;
    
    --font-family-primary: 'Inter', system-ui, sans-serif;
    --font-size-base: 1rem;
    --font-size-lg: 1.125rem;
    
    --spacing-xs: 0.25rem;
    --spacing-sm: 0.5rem;
    --spacing-md: 1rem;
    --spacing-lg: 1.5rem;
    --spacing-xl: 2rem;
    
    --border-radius: 0.5rem;
    --shadow-sm: 0 1px 2px 0 rgb(0 0 0 / 0.05);
    --shadow-md: 0 4px 6px -1px rgb(0 0 0 / 0.1);
    
    --transition-fast: 150ms ease-in-out;
    --transition-normal: 250ms ease-in-out;
}

/* Modern CSS Grid and Flexbox layouts */
.grid-modern {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    gap: var(--spacing-lg);
}

.flex-modern {
    display: flex;
    align-items: center;
    gap: var(--spacing-md);
}
```

#### Component-Based CSS (BEM + Modern Utilities)
```css
/* Block-Element-Modifier with modern enhancements */
.card {
    background: var(--color-white);
    border-radius: var(--border-radius);
    box-shadow: var(--shadow-md);
    padding: var(--spacing-lg);
    transition: transform var(--transition-normal), box-shadow var(--transition-normal);
}

.card:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px -5px rgb(0 0 0 / 0.1);
}

.card__header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    margin-bottom: var(--spacing-md);
}

.card__title {
    font-size: var(--font-size-lg);
    font-weight: 600;
    color: var(--color-gray-900);
}

.card--featured {
    border-left: 4px solid var(--color-primary);
    background: linear-gradient(135deg, var(--color-gray-50) 0%, white 100%);
}
```

#### Modern Responsive Design
```css
/* Mobile-first responsive design */
.container {
    width: 100%;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 var(--spacing-md);
}

@media (min-width: 768px) {
    .container {
        padding: 0 var(--spacing-lg);
    }
}

@media (min-width: 1024px) {
    .container {
        padding: 0 var(--spacing-xl);
    }
}

/* Modern button system */
.btn {
    display: inline-flex;
    align-items: center;
    gap: var(--spacing-sm);
    padding: var(--spacing-sm) var(--spacing-md);
    border: none;
    border-radius: var(--border-radius);
    font-family: inherit;
    font-size: var(--font-size-base);
    font-weight: 500;
    text-decoration: none;
    transition: all var(--transition-fast);
    cursor: pointer;
    user-select: none;
}

.btn:focus-visible {
    outline: 2px solid var(--color-primary);
    outline-offset: 2px;
}

.btn--primary {
    background: var(--color-primary);
    color: white;
}

.btn--primary:hover:not(:disabled) {
    background: var(--color-primary-dark);
    transform: translateY(-1px);
}
```

### JavaScript - Modern ES2020+ Standards

#### Modern JavaScript Architecture
```javascript
// Use ES6+ modules and modern syntax
class UIController {
    constructor() {
        this.init();
    }

    init() {
        this.bindEvents();
        this.initializeComponents();
    }

    bindEvents() {
        // Use event delegation for better performance
        document.addEventListener('click', this.handleClick.bind(this));
        document.addEventListener('submit', this.handleSubmit.bind(this));
        
        // Use Intersection Observer for animations
        this.observeElements();
    }

    handleClick(event) {
        const { target } = event;
        
        // Modern event handling with early returns
        if (!target.matches('[data-action]')) return;
        
        const action = target.dataset.action;
        this.executeAction(action, target, event);
    }

    async handleSubmit(event) {
        const form = event.target;
        if (!form.matches('[data-ajax-form]')) return;
        
        event.preventDefault();
        
        try {
            await this.submitFormAjax(form);
        } catch (error) {
            this.showError('Form submission failed. Please try again.');
            console.error('Form submission error:', error);
        }
    }

    async submitFormAjax(form) {
        const formData = new FormData(form);
        const submitBtn = form.querySelector('[type="submit"]');
        
        this.setLoadingState(submitBtn, true);
        
        try {
            const response = await fetch(form.action, {
                method: form.method,
                body: formData,
                headers: {
                    'X-Requested-With': 'XMLHttpRequest',
                    'X-CSRF-TOKEN': document.querySelector('meta[name="csrf-token"]').content
                }
            });

            if (!response.ok) {
                throw new Error(`HTTP ${response.status}: ${response.statusText}`);
            }

            const data = await response.json();
            this.handleFormSuccess(data, form);
        } finally {
            this.setLoadingState(submitBtn, false);
        }
    }

    observeElements() {
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    entry.target.classList.add('animate-in');
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.1 });

        document.querySelectorAll('[data-animate]').forEach(el => {
            observer.observe(el);
        });
    }

    setLoadingState(button, isLoading) {
        if (isLoading) {
            button.disabled = true;
            button.innerHTML = `
                <svg class="animate-spin h-4 w-4" viewBox="0 0 24 24">
                    <circle cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4" fill="none" opacity="0.25"/>
                    <path fill="currentColor" opacity="0.75" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"/>
                </svg>
                Processing...
            `;
        } else {
            button.disabled = false;
            button.innerHTML = button.dataset.originalText || 'Submit';
        }
    }
}

// Initialize when DOM is ready
document.addEventListener('DOMContentLoaded', () => {
    new UIController();
});
```

#### Modern Animation and Interactions
```javascript
// Modern smooth scrolling
function smoothScrollTo(target) {
    const element = document.querySelector(target);
    if (!element) return;
    
    element.scrollIntoView({
        behavior: 'smooth',
        block: 'start'
    });
}

// Modern toast notifications
class ToastNotification {
    static show(message, type = 'info', duration = 5000) {
        const toast = document.createElement('div');
        toast.className = `toast toast--${type}`;
        toast.innerHTML = `
            <div class="toast__content">
                <span class="toast__message">${message}</span>
                <button class="toast__close" aria-label="Close notification">&times;</button>
            </div>
        `;
        
        document.body.appendChild(toast);
        
        // Animate in
        requestAnimationFrame(() => {
            toast.classList.add('toast--visible');
        });
        
        // Auto remove
        setTimeout(() => {
            this.remove(toast);
        }, duration);
        
        // Manual close
        toast.querySelector('.toast__close').addEventListener('click', () => {
            this.remove(toast);
        });
    }
    
    static remove(toast) {
        toast.classList.add('toast--removing');
        toast.addEventListener('transitionend', () => {
            toast.remove();
        });
    }
}
```

## Modern UI Design Principles

### Design System Approach
- Use consistent spacing scale (4px, 8px, 16px, 24px, 32px, 48px)
- Implement consistent color palette with semantic naming
- Use modern typography scale with proper line heights
- Implement consistent border radius and shadow system
- Use modern animation timing (150ms, 250ms, 350ms)

### Component Library Structure
```css
/* Modern Form Components */
.form-group {
    margin-bottom: var(--spacing-lg);
}

.form-label {
    display: block;
    margin-bottom: var(--spacing-xs);
    font-size: var(--font-size-sm);
    font-weight: 500;
    color: var(--color-gray-700);
}

.form-input {
    width: 100%;
    padding: var(--spacing-sm) var(--spacing-md);
    border: 1px solid var(--color-gray-300);
    border-radius: var(--border-radius);
    font-size: var(--font-size-base);
    transition: border-color var(--transition-fast), box-shadow var(--transition-fast);
}

.form-input:focus {
    outline: none;
    border-color: var(--color-primary);
    box-shadow: 0 0 0 3px rgb(59 130 246 / 0.1);
}

.form-error {
    margin-top: var(--spacing-xs);
    font-size: var(--font-size-sm);
    color: var(--color-red-600);
}
```

## Security and Performance Standards

### Frontend Security
- Always sanitize user input before DOM insertion
- Use `textContent` instead of `innerHTML` for user data
- Validate all form inputs on frontend (backend validation already exists)
- Implement Content Security Policy headers consideration

### Performance Optimization
```css
/* Use efficient CSS selectors */
.specific-class {} /* Good */
div.class {} /* Avoid */

/* Minimize repaints and reflows */
.transform-element {
    will-change: transform;
    transform: translateZ(0); /* Create composite layer */
}

/* Use CSS containment */
.independent-section {
    contain: layout style paint;
}
```

```javascript
// Debounce expensive operations
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// Use requestAnimationFrame for animations
function animate() {
    // Animation logic
    requestAnimationFrame(animate);
}
```

## File Organization

### Frontend Structure
```
resources/views/
├── layouts/
│   ├── app.blade.php           # Main layout
│   └── components/             # Reusable components
├── components/                 # Blade components
├── auth/                      # Authentication views
└── [modules]/                 # Feature-specific views

public/css/
├── app.css                    # Main stylesheet
├── components/                # Component styles
└── vendor/                    # Third-party CSS

public/js/
├── app.js                     # Main JavaScript
├── components/                # Component scripts
└── vendor/                    # Third-party scripts

resources/css/                 # Source CSS (if using build tools)
resources/js/                  # Source JavaScript (if using build tools)
```

## Quality Assurance Checklist

### Before Any Frontend Update
- [ ] Test all existing forms continue to work
- [ ] Verify all buttons and links function correctly
- [ ] Check responsive design on mobile, tablet, desktop
- [ ] Validate HTML markup
- [ ] Test keyboard navigation and accessibility
- [ ] Verify no JavaScript console errors
- [ ] Test in Chrome, Firefox, Safari, Edge
- [ ] Ensure no disruption to existing user workflows

### Modern UI Standards Checklist
- [ ] Uses CSS custom properties for theming
- [ ] Implements modern CSS Grid/Flexbox layouts
- [ ] Includes smooth animations and transitions
- [ ] Follows accessibility guidelines (WCAG 2.1 AA)
- [ ] Uses semantic HTML5 elements
- [ ] Implements proper focus management
- [ ] Includes loading states and user feedback
- [ ] Uses modern JavaScript features (ES2020+)
- [ ] Implements proper error handling
- [ ] Uses performance optimization techniques

## Deployment Considerations

### Pre-deployment Validation
```bash
# Validate all frontend assets
npm run production  # If using build tools
php artisan optimize:clear  # Clear Laravel caches
php artisan view:cache  # Cache Blade templates
```

### Browser Compatibility
- Support modern browsers (Chrome 88+, Firefox 85+, Safari 14+, Edge 88+)
- Use progressive enhancement for older browsers
- Test critical paths in target browsers
- Implement graceful degradation where needed

## Emergency Rollback

### If Frontend Changes Cause Issues
1. Immediately revert changed files from version control
2. Clear Laravel view cache: `php artisan view:clear`
3. Clear browser caches
4. Notify development team
5. Document the issue for future reference

---

**Remember: The backend is production-tested and stable. All frontend modifications must enhance user experience while maintaining existing functionality and data flow. When in doubt, prioritize preserving existing behavior over new features.**