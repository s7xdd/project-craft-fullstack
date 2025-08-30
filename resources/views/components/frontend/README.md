# Frontend Components

This directory contains reusable Blade components for the frontend.

## Available Components

1. **Banner Components**
   - `banner.blade.php` - Main banner container
   - `banner-slide.blade.php` - Individual banner slides

2. **Highlights Components**
   - `highlights.blade.php` - Highlights section container
   - `highlight-item.blade.php` - Individual highlight items

3. **Product Components**
   - `product-section.blade.php` - Product section container
   - `product-card.blade.php` - Individual product cards

4. **Featured Products Components**
   - `featured-products.blade.php` - Featured products section container
   - `featured-product.blade.php` - Individual featured products

5. **Instagram Components**
   - `instagram-feed.blade.php` - Instagram feed container
   - `instagram-item.blade.php` - Individual Instagram items

6. **Subscription Components**
   - `whatsapp-subscribe.blade.php` - WhatsApp subscription section

## Usage

To use these components in your Blade templates, use the following syntax:

```blade
<x-frontend.component-name :prop1="$value1" :prop2="$value2">
    <!-- Slot content (if applicable) -->
</x-frontend.component-name>
```

For detailed documentation on each component and their props, see `COMPONENTS.md`.