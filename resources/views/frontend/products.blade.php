@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title 
        title="Shop" 
        homeLink="index.html" />

    <x-frontend.products.shop-page>
        <x-slot name="sidebar">
            <x-frontend.products.shop-sidebar />
        </x-slot>

        <x-slot name="sorting">
            <x-frontend.products.shop-sorting 
                showingStart="1" 
                showingEnd="30" 
                totalResults="160" />
        </x-slot>

        <x-frontend.products.product-card-item
            image="assets/images/product-2.webp"
            alt="Premium Epoxy Resin"
            title="Premium Epoxy Resin"
            currentPrice="₹449"
            originalPrice="₹699"
            discount="39"
            link="shop-details.html" />

        <x-frontend.products.product-card-item
            image="assets/images/product-3.webp"
            alt="Premium Epoxy Resin"
            title="Premium Epoxy Resin"
            currentPrice="₹449"
            originalPrice="₹699"
            discount="39"
            link="shop-details.html" />

        <x-frontend.products.product-card-item
            image="assets/images/product-4.webp"
            alt="Premium Epoxy Resin"
            title="Premium Epoxy Resin"
            currentPrice="₹449"
            originalPrice="₹699"
            discount="39"
            link="shop-details.html" />

        <x-frontend.products.product-card-item
            image="assets/images/product-5.webp"
            alt="Premium Epoxy Resin"
            title="Premium Epoxy Resin"
            currentPrice="₹449"
            originalPrice="₹699"
            discount="39"
            link="shop-details.html" />

        <x-frontend.products.product-card-item
            image="assets/images/product-6.webp"
            alt="Premium Epoxy Resin"
            title="Premium Epoxy Resin"
            currentPrice="₹449"
            originalPrice="₹699"
            discount="39"
            link="shop-details.html" />

        <x-frontend.products.product-card-item
            image="assets/images/product-1.webp"
            alt="Premium Epoxy Resin"
            title="Premium Epoxy Resin"
            currentPrice="₹449"
            originalPrice="₹699"
            discount="39"
            link="shop-details.html" />

        <x-frontend.products.product-card-item
            image="assets/images/product-2.webp"
            alt="Premium Epoxy Resin"
            title="Premium Epoxy Resin"
            currentPrice="₹449"
            originalPrice="₹699"
            discount="39"
            link="shop-details.html" />

        <x-frontend.products.product-card-item
            image="assets/images/product-3.webp"
            alt="Premium Epoxy Resin"
            title="Premium Epoxy Resin"
            currentPrice="₹449"
            originalPrice="₹699"
            discount="39"
            link="shop-details.html" />

        <x-frontend.products.product-card-item
            image="assets/images/product-4.webp"
            alt="Premium Epoxy Resin"
            title="Premium Epoxy Resin"
            currentPrice="₹449"
            originalPrice="₹699"
            discount="39"
            link="shop-details.html" />

        <x-frontend.products.product-card-item
            image="assets/images/product-2.webp"
            alt="Premium Epoxy Resin"
            title="Premium Epoxy Resin"
            currentPrice="₹449"
            originalPrice="₹699"
            discount="39"
            link="shop-details.html" />

        <x-frontend.products.product-card-item
            image="assets/images/product-3.webp"
            alt="Premium Epoxy Resin"
            title="Premium Epoxy Resin"
            currentPrice="₹449"
            originalPrice="₹699"
            discount="39"
            link="shop-details.html" />

        <x-frontend.products.product-card-item
            image="assets/images/product-4.webp"
            alt="Premium Epoxy Resin"
            title="Premium Epoxy Resin"
            currentPrice="₹449"
            originalPrice="₹699"
            discount="39"
            link="shop-details.html" />

        <x-slot name="pagination">
            <x-frontend.products.pagination>
                <x-frontend.products.pagination-item 
                    link="shop.html" 
                    icon="icon-29" />
                
                <x-frontend.products.pagination-item 
                    link="shop.html" 
                    text="1" 
                    class="current" />
                
                <x-frontend.products.pagination-item 
                    link="shop.html" 
                    text="2" />
                
                <x-frontend.products.pagination-item 
                    link="shop.html" 
                    text="3" />
                
                <x-frontend.products.pagination-item 
                    link="shop.html" 
                    icon="icon-30" />
            </x-frontend.products.pagination>
        </x-slot>
    </x-frontend.products.shop-page>

    <x-frontend.common.whatsapp-subscribe
        title="Order With WhatsApp"
        buttonText="Order Now!"
        backgroundImage="assets/images/whatsapp-bg.jpg"
        whatsappLink="https://wa.me/1234567890?text=Hello,%20I%20would%20like%20to%20place%20an%20order!" />
@endsection