@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title title="Shop" homeLink="index.html" />

    <x-frontend.products.shop-page>
        <x-slot name="sidebar">
            <x-frontend.products.shop-sidebar />
        </x-slot>

        <x-slot name="sorting">
            <x-frontend.products.shop-sorting showingStart="1" showingEnd="30" totalResults="160" />
        </x-slot>

        @if (!empty($products))
            @foreach ($products as $prod)
                @php
                    $priceData = getProductOfferPrice($prod);
                @endphp

                <x-frontend.products.product-card-item image="{{ get_product_image($prod->thumbnail_img) }}"
                    alt="{{ $prod->brand->getTranslation('name', $lang) }}"
                    title="{{ $prod->brand->getTranslation('name', $lang) }}"
                    currentPrice="{{ $priceData['discounted_price'] }}" originalPrice="{{ $priceData['original_price'] }}"
                    link="{{ route('product-detail', ['slug' => $prod->slug, 'sku' => $prod->sku]) }}"
                    sku="{{ $prod->sku }}" slug="{{ $prod->slug }}" />
            @endforeach
        @endif

        <x-slot name="pagination">
            <x-frontend.products.pagination>
                {{-- <x-frontend.products.pagination-item link="shop.html" icon="icon-29" />
                <x-frontend.products.pagination-item link="shop.html" text="1" class="current" />
                <x-frontend.products.pagination-item link="shop.html" text="2" />
                <x-frontend.products.pagination-item link="shop.html" text="3" /> --}}

                <div class="loading-spin text-center">
                    <div class="standard-pagination">
                        {{ $products->appends(request()->input())->links('pagination::bootstrap-4') }}
                    </div>
                </div>
            </x-frontend.products.pagination>
        </x-slot>
    </x-frontend.products.shop-page>

    <x-frontend.common.whatsapp-subscribe title="Order With WhatsApp" buttonText="Order Now!"
        backgroundImage="assets/images/whatsapp-bg.jpg"
        whatsappLink="https://wa.me/1234567890?text=Hello,%20I%20would%20like%20to%20place%20an%20order!" />
@endsection
