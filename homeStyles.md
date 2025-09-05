# Home Components CSS Mapping

This document maps each component file in `resources/views/components/frontend/home/` to their corresponding CSS files and styles.

## Component Files and CSS Mappings

### 1. banner.blade.php
**File Path:** `resources/views/components/frontend/home/banner.blade.php`

**CSS Classes Used:**
- `banner-section`
- `banner-style-two`
- `banner-content`
- `banner-carousel`
- `owl-theme`
- `owl-carousel`
- `owl-nav-none`
- `owl-dots-none`

**Corresponding CSS Files:**
- `public/assets/css/module-css/banner.css` - Contains styles for `.banner-section`, `.banner-style-two`, `.banner-content`, `.banner-carousel`
- `public/assets/css/owl.css` - Contains styles for `.owl-theme`, `.owl-carousel`, `.owl-nav-none`, `.owl-dots-none`

---

### 2. banner-slide.blade.php
**File Path:** `resources/views/components/frontend/home/banner-slide.blade.php`

**CSS Classes Used:**
- `slide-item`
- `bg-color-1`
- `content-box`
- `btn-box`
- `theme-btn`
- `btn-one`

**Corresponding CSS Files:**
- `public/assets/css/module-css/banner.css` - Contains styles for `.slide-item`, `.bg-color-1`, `.content-box`, `.btn-box`, `.theme-btn`, `.btn-one`

---

### 3. highlights.blade.php
**File Path:** `resources/views/components/frontend/home/highlights.blade.php`

**CSS Classes Used:**
- `highlights-section`
- `list-item`

**Corresponding CSS Files:**
- `public/assets/css/module-css/highlights.css` - Contains styles for `.highlights-section`, `.list-item`

---

### 4. highlight-item.blade.php
**File Path:** `resources/views/components/frontend/home/highlight-item.blade.php`

**CSS Classes Used:**
- `single-item`
- `icon-box`

**Corresponding CSS Files:**
- `public/assets/css/module-css/highlights.css` - Contains styles for `.single-item`, `.icon-box`

---

### 5. featured-products.blade.php
**File Path:** `resources/views/components/frontend/home/featured-products.blade.php`

**CSS Classes Used:**
- `featured-style-five`

**Corresponding CSS Files:**
- `public/assets/css/module-css/featured.css` - Contains styles for `.featured-style-five`

---

### 6. featured-product.blade.php
**File Path:** `resources/views/components/frontend/home/featured-product.blade.php`

**CSS Classes Used:**
- `featured-block-one`
- `inner-box`
- `bg-color-1`
- `image-box`
- `text-box`
- `theme-btn`
- `btn-one`

**Corresponding CSS Files:**
- `public/assets/css/module-css/featured.css` - Contains styles for `.featured-block-one`, `.inner-box`, `.bg-color-1`, `.image-box`, `.text-box`, `.theme-btn`, `.btn-one`

---

### 7. testimonial-feed.blade.php
**File Path:** `resources/views/components/frontend/home/testimonial-feed.blade.php`

**CSS Classes Used:**
- `testimonial-section`
- `sec-title`
- `centred`
- `testimonial-carousel`
- `owl-carousel`
- `owl-theme`
- `owl-dots-none`
- `owl-nav-none`

**Corresponding CSS Files:**
- `public/assets/css/module-css/testimonial.css` - Contains styles for `.testimonial-section`, `.sec-title`, `.centred`, `.testimonial-carousel`
- `public/assets/css/owl.css` - Contains styles for `.owl-carousel`, `.owl-theme`, `.owl-dots-none`, `.owl-nav-none`

---

### 8. testimonial-item.blade.php
**File Path:** `resources/views/components/frontend/home/testimonial-item.blade.php`

**CSS Classes Used:**
- `testimonial-block-one`
- `inner-box`
- `video-card`
- `video-box`
- `testimonial-video`

**Corresponding CSS Files:**
- `public/assets/css/module-css/testimonial.css` - Contains styles for `.testimonial-block-one`, `.inner-box`, `.video-card`, `.video-box`, `.testimonial-video`

---

### 9. instagram-feed.blade.php
**File Path:** `resources/views/components/frontend/home/instagram-feed.blade.php`

**CSS Classes Used:**
- `instagram-section`
- `instagram-carousel`
- `owl-carousel`
- `owl-theme`
- `owl-dots-none`
- `owl-nav-none`

**Corresponding CSS Files:**
- `public/assets/css/module-css/instagram.css` - Contains styles for `.instagram-section`, `.instagram-carousel`
- `public/assets/css/owl.css` - Contains styles for `.owl-carousel`, `.owl-theme`, `.owl-dots-none`, `.owl-nav-none`

---

### 10. instagram-item.blade.php
**File Path:** `resources/views/components/frontend/home/instagram-item.blade.php`

**CSS Classes Used:**
- `instagram-block-one`
- `inner-box`
- `image-box`

**Corresponding CSS Files:**
- `public/assets/css/module-css/instagram.css` - Contains styles for `.instagram-block-one`, `.inner-box`, `.image-box`

## Summary

### Primary CSS Files Used by Home Components:
1. **banner.css** - Banner section, slides, and carousel styling
2. **highlights.css** - Highlights section and items styling
3. **featured.css** - Featured products section styling
4. **testimonial.css** - Testimonial section and video styling
5. **instagram.css** - Instagram feed and items styling
6. **owl.css** - Carousel/slider functionality styling

### Architecture Notes:
- Each component has dedicated CSS files in `public/assets/css/module-css/`
- Carousel functionality uses Owl Carousel library with custom styling
- Components follow consistent naming conventions (e.g., `*-section`, `*-block-one`, `*-item`)
- Responsive design is handled within each module CSS file
- Global styles are inherited from the main layout but module-specific styles take precedence

This mapping ensures that styling changes can be made efficiently by targeting the correct CSS files for each component.