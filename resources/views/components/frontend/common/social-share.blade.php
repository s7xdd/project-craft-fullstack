@props(['product'])

@php
    $currentUrl = urlencode(url()->full());
    $pageTitle = urlencode($product['name'] ?? 'Check this product');
    $productImage = $product['thumbnail_image'];
@endphp

<div class="flex flex-wrap xl:flex-nowrap items-center gap-3 mt-4">
    <span class="text-gray-700 text-sm font-semibold">Share:</span>

    <a href="https://www.facebook.com/sharer/sharer.php?u={{ $currentUrl }}" target="_blank"
        class="flex items-center gap-2 px-3 py-2 bg-gray-200 rounded-full hover:bg-gray-300 transition-all duration-300">

        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="black" class="w-6 h-6">
            <path
                d="M22 12c0-5.52-4.48-10-10-10S2 6.48 2 12c0 5 3.66 9.14 8.43 9.88v-6.99h-2.54v-2.89h2.54V9.31c0-2.51 1.49-3.89 3.77-3.89 1.09 0 2.23.19 2.23.19v2.45h-1.26c-1.24 0-1.63.77-1.63 1.56v1.88h2.78l-.44 2.89h-2.34v6.99C18.34 21.14 22 17 22 12z" />
        </svg>
        <span class="text-sm text-gray-700 hidden xl:block">Facebook</span>
    </a>

    <a href="https://www.instagram.com/" target="_blank"
        class="flex items-center gap-2 px-3 py-2 bg-gray-200 rounded-full hover:bg-gray-300 transition-all duration-300">
        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="black" class="w-6 h-6">
            <path
                d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z" />
        </svg>
        <span class="text-sm text-gray-700 hidden xl:block">Instagram</span>
    </a>

    <a href="https://pinterest.com/pin/create/button/?url={{ $currentUrl }}&media={{ $productImage }}&description={{ $pageTitle }}"
        target="_blank"
        class="flex items-center gap-2 px-3 py-2 bg-gray-200 rounded-full hover:bg-gray-300 transition-all duration-300">

        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="black" class="w-6 h-6">
            <path
                d="M12 0C5.37 0 0 5.37 0 12c0 4.89 2.9 9.1 7.06 11.01-.1-.94-.2-2.39.04-3.42.22-.95 1.46-6.06 1.46-6.06s-.37-.75-.37-1.85c0-1.74 1.01-3.04 2.27-3.04 1.07 0 1.59.8 1.59 1.76 0 1.07-.68 2.67-1.03 4.14-.3 1.26.64 2.29 1.88 2.29 2.27 0 3.81-2.92 3.81-6.38 0-2.63-1.77-4.6-5-4.6-3.64 0-5.91 2.73-5.91 5.77 0 1.04.4 2.17.9 2.78.1.12.12.22.09.34-.1.37-.3 1.26-.34 1.44-.05.22-.18.27-.41.16-1.54-.71-2.51-2.93-2.51-4.72 0-3.83 2.78-7.36 8.01-7.36 4.2 0 7.47 2.99 7.47 7.02 0 4.17-2.62 7.52-6.26 7.52-1.22 0-2.36-.63-2.75-1.37l-.75 2.87c-.27 1.04-1 2.35-1.49 3.15C9.42 23.79 10.68 24 12 24c6.63 0 12-5.37 12-12S18.63 0 12 0z" />
        </svg>
        <span class="text-sm text-gray-700 hidden xl:block">Pinterest</span>
    </a>

</div>
