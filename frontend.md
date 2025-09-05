# Frontend Codebase Mapping

This document provides a comprehensive mapping of the frontend files, components, and their associated CSS files for the Grostore e-commerce application.

## Architecture Overview

The frontend is built using Laravel Blade templates with Vue.js components. The main layout is defined in `resources/views/frontend/layouts/app.blade.php` which includes all global CSS files and common components like header and footer.

## Global CSS Files (Included in Main Layout)

All pages inherit these CSS files from `resources/views/frontend/layouts/app.blade.php`:

### Core Framework CSS
- `assets/css/bootstrap.min.css`
- `assets/css/theme.css`
- `assets/css/custom-style.css`
- `assets/css/bootstrap.css`
- `assets/css/jquery.fancybox.min.css`
- `assets/css/animate.css`
- `assets/css/nice-select.css`
- `assets/css/elpath.css`
- `assets/css/color.css`
- `assets/css/rtl.css`
- `assets/css/style.css`
- `assets/css/responsive.css`

### Icon and Font CSS
- `assets/css/lineicons-regular.css`
- `assets/css/icon-font.min.css`
- `assets/css/font-awesome-all.css`
- `assets/css/flaticon.css`
- `assets/css/owl.css`

### Module-Specific CSS
- `assets/css/module-css/header.css`
- `assets/css/module-css/banner.css`
- `assets/css/module-css/shop.css`
- `assets/css/module-css/featured.css`
- `assets/css/module-css/category.css`
- `assets/css/module-css/ads.css`
- `assets/css/module-css/popular-product.css`
- `assets/css/module-css/highlights.css`
- `assets/css/module-css/collection.css`
- `assets/css/module-css/fluid.css`
- `assets/css/module-css/deals.css`
- `assets/css/module-css/news.css`
- `assets/css/module-css/subscribe.css`
- `assets/css/module-css/footer.css`
- `assets/css/module-css/page-title.css`
- `assets/css/module-css/shop-sidebar.css`
- `assets/css/module-css/shop-page.css`
- `assets/css/module-css/shop-details.css`
- `assets/css/module-css/cart.css`
- `assets/css/module-css/checkout.css`
- `assets/css/module-css/account.css`
- `assets/css/module-css/contact.css`
- `assets/css/module-css/about.css`

### Compiled Assets
- `dist/assets/app-*.css` (Vite compiled assets)

## Page-by-Page Component Mapping

### 1. Home Page (`resources/views/frontend/home.blade.php`)
**Components Used:**
- `x-frontend.home.banner`
- `x-frontend.home.banner-slide`
- `x-frontend.home.highlights`
- `x-frontend.home.highlight-item`
- `x-frontend.common.product-section`
- `x-frontend.common.product-card`
- `x-frontend.home.featured-products`
- `x-frontend.home.featured-product`
- `x-frontend.home.testimonial-feed`
- `x-frontend.home.testimonial-item`
- `x-frontend.common.whatsapp-subscribe`

**Primary CSS Files:**
- `assets/css/module-css/banner.css`
- `assets/css/module-css/highlights.css`
- `assets/css/module-css/featured.css`
- `assets/css/module-css/popular-product.css`

### 2. Products Page (`resources/views/frontend/products.blade.php`)
**Components Used:**
- `x-frontend.common.page-title`
- `x-frontend.products.shop-page`
- `x-frontend.products.shop-sidebar`
- `x-frontend.products.product-card-item`
- `x-frontend.products.custom-pagination`
- `x-frontend.common.whatsapp-subscribe`

**Primary CSS Files:**
- `assets/css/module-css/page-title.css`
- `assets/css/module-css/shop-page.css`
- `assets/css/module-css/shop-sidebar.css`
- `assets/css/module-css/shop.css`

### 3. Product Details Page (`resources/views/frontend/product_details.blade.php`)
**Components Used:**
- `x-frontend.product-detail.product-gallery`
- `x-frontend.product-detail.product-details`
- `x-frontend.product-detail.product-description`
- `x-frontend.product-detail.tab-button`
- `x-frontend.product-detail.description-content`
- `x-frontend.product-detail.add-to-cart`
- `x-frontend.product-detail.color-options`
- `x-frontend.product-detail.color-item`
- `x-frontend.product-detail.rating`
- `x-frontend.product-detail.rating-item`
- `x-frontend.product-detail.review-content`
- `x-frontend.product-detail.review-item`
- `x-frontend.product-detail.review-reply`
- `x-frontend.product-detail.related-products`
- `x-frontend.product-detail.specification-content`
- `x-frontend.product-detail.specification-item`
- `x-frontend.product-detail.tab-content`
- `x-frontend.product-detail.thumbnail-item`
- `x-frontend.common.image-slider`
- `x-frontend.common.product-section`
- `x-frontend.common.product-card`
- `x-frontend.common.social-share`
- `x-frontend.common.whatsapp-subscribe`

**Primary CSS Files:**
- `assets/css/module-css/shop-details.css`
- `assets/css/module-css/shop.css`

### 4. Cart Page (`resources/views/frontend/cart.blade.php`)
**Components Used:**
- `x-frontend.common.page-title`
- `x-frontend.cart.cart-section`
- `x-frontend.cart.cart-item`
- `x-frontend.cart.cart-totals`
- `x-frontend.cart.total-box`
- `x-frontend.cart.total-item`
- `x-frontend.cart.checkout-button`
- `x-frontend.common.product-section`
- `x-frontend.common.product-card`
- `x-frontend.common.whatsapp-subscribe`

**Primary CSS Files:**
- `assets/css/module-css/cart.css`
- `assets/css/module-css/page-title.css`

### 5. Checkout Page (`resources/views/frontend/checkout.blade.php`)
**Components Used:**
- `x-frontend.common.page-title`
- `x-frontend.checkout.checkout`
- `x-frontend.checkout.checkout-section`
- `x-frontend.checkout.billing-details`
- `x-frontend.checkout.checkout.blade`
- `x-frontend.checkout.order-summary`
- `x-frontend.common.whatsapp-subscribe`

**Primary CSS Files:**
- `assets/css/module-css/checkout.css`
- `assets/css/module-css/page-title.css`

### 6. About Page (`resources/views/frontend/about.blade.php`)
**Components Used:**
- `x-frontend.common.page-title`
- `x-frontend.about.about-section`
- `x-frontend.about.fun-facts`
- `x-frontend.about.fun-fact-item`
- `x-frontend.home.highlights`
- `x-frontend.home.highlight-item`
- `x-frontend.common.whatsapp-subscribe`

**Primary CSS Files:**
- `assets/css/module-css/about.css`
- `assets/css/module-css/page-title.css`
- `assets/css/module-css/highlights.css`

### 7. Contact Page (`resources/views/frontend/contact_us.blade.php`)
**Components Used:**
- `x-frontend.common.page-title`
- `x-frontend.contact.contact-info`
- `x-frontend.contact.contact-section`
- `x-frontend.contact.contact-form`
- `x-frontend.contact.contact.blade`

**Primary CSS Files:**
- `assets/css/module-css/contact.css`
- `assets/css/module-css/page-title.css`

### 8. Orders Page (`resources/views/frontend/orders.blade.php`)
**Components Used:**
- `x-frontend.common.page-title`
- `x-frontend.account.account-section`
- `x-frontend.account.history-item`
- `x-frontend.account.order-id-filter`

**Primary CSS Files:**
- `assets/css/module-css/account.css`
- `assets/css/module-css/page-title.css`

### 9. Testimonials Pages (`resources/views/frontend/testimonials.blade.php`, `resources/views/frontend/testimonial_detail.blade.php`)
**Components Used:**
- `x-frontend.common.page-title`
- `x-frontend.home.testimonial-feed`
- `x-frontend.home.testimonial-item`

**Primary CSS Files:**
- `assets/css/module-css/page-title.css`
- `assets/css/module-css/testimonial.css`

## Header and Footer Components

### Header (`resources/views/frontend/parts/header.blade.php`)
**Includes:**
- `resources/views/frontend/parts/menu-item.blade.php`
- `resources/views/frontend/parts/menu-item-mobile.blade.php`
- `resources/views/frontend/parts/mobile-menu.blade.php`

**Primary CSS Files:**
- `assets/css/module-css/header.css`

### Footer (`resources/views/frontend/parts/footer.blade.php`)
**Primary CSS Files:**
- `assets/css/module-css/footer.css`

## Component Directory Structure

```
resources/views/components/frontend/
├── about/
│   ├── about-section.blade.php
│   ├── fun-fact-item.blade.php
│   └── fun-facts.blade.php
├── account/
│   ├── account-section.blade.php
│   ├── history-item.blade.php
│   └── order-id-filter.blade.php
├── cart/
│   ├── cart-item.blade.php
│   ├── cart-section.blade.php
│   ├── cart-totals.blade.php
│   ├── checkout-button.blade.php
│   ├── coupon.blade.php
│   ├── total-box.blade.php
│   └── total-item.blade.php
├── checkout/
│   ├── billing-details.blade.php
│   ├── checkout-section.blade.php
│   ├── checkout.blade.php
│   └── order-summary.blade.php
├── common/
│   ├── image-slider.blade.php
│   ├── page-title.blade.php
│   ├── product-card.blade.php
│   ├── product-section.blade.php
│   ├── social-share.blade.php
│   └── whatsapp-subscribe.blade.php
├── contact/
│   ├── contact-form.blade.php
│   ├── contact-info.blade.php
│   ├── contact-section.blade.php
│   └── contact.blade.php
├── home/
│   ├── banner-slide.blade.php
│   ├── banner.blade.php
│   ├── featured-product.blade.php
│   ├── featured-products.blade.php
│   ├── highlight-item.blade.php
│   ├── highlights.blade.php
│   ├── instagram-feed.blade.php
│   ├── instagram-item.blade.php
│   ├── testimonial-feed.blade.php
│   └── testimonial-item.blade.php
├── product-detail/
│   ├── add-to-cart.blade.php
│   ├── color-item.blade.php
│   ├── color-options.blade.php
│   ├── customer-review-form.blade.php
│   ├── description-content.blade.php
│   ├── product-description.blade.php
│   ├── product-details.blade.php
│   ├── product-gallery.blade.php
│   ├── product-slider-item.blade.php
│   ├── rating-item.blade.php
│   ├── rating.blade.php
│   ├── related-products.blade.php
│   ├── review-content.blade.php
│   ├── review-item.blade.php
│   ├── review-reply.blade.php
│   ├── specification-content.blade.php
│   ├── specification-item.blade.php
│   ├── tab-button.blade.php
│   ├── tab-content.blade.php
│   └── thumbnail-item.blade.php
└── products/
    ├── custom-pagination.blade.php
    ├── pagination-item.blade.php
    ├── pagination.blade.php
    ├── product-card-item.blade.php
    ├── shop-page.blade.php
    ├── shop-sidebar.blade.php
    └── shop-sorting.blade.php
```

## JavaScript Components

Located in `resources/js/`:
- `formio/` - Form.io related components
- `app.js` - Main application JavaScript
- `bootstrap.js` - Bootstrap configuration
- `contact.js` - Contact form handling

## Additional Resources

- **SASS Files:** `resources/sass/app.scss`
- **CSS Files:** `resources/css/app.css`
- **Compiled Assets:** `dist/assets/`

## Working and Functionality

1. **Layout System:** All pages extend the main app layout which provides consistent header, footer, and global styles
2. **Component-Based Architecture:** Reusable Blade components for UI elements
3. **Modular CSS:** Page-specific styles are separated into module CSS files
4. **Responsive Design:** Responsive CSS ensures mobile compatibility
5. **Dynamic Content:** Components receive data through slots and props
6. **JavaScript Integration:** jQuery and custom JS handle interactive features
7. **Asset Compilation:** Vite compiles SASS/CSS and JS assets

This mapping provides a complete overview of how the frontend is structured, styled, and organized for maintainability and scalability.