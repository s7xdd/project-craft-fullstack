@extends('frontend.layouts.app')

@section('content')
    @php
        $topCollections = collect($data['collection_products'])->filter(
            fn($collection) => isset($collection['products']) &&
                count($collection['products']) > 0 &&
                isset($collection['page_reference']) &&
                $collection['page_reference'] === 'top',
        );

        $middleCollections = collect($data['collection_products'])->filter(
            fn($collection) => isset($collection['products']) &&
                count($collection['products']) > 0 &&
                isset($collection['page_reference']) &&
                $collection['page_reference'] === 'middle',
        );

        $testimonials = isset($data['testimonials'])
            ? $data['testimonials']->map(function ($testimonial) {
                $imageData = $testimonial->image ? json_decode($testimonial->image) : [];
                $image = isset($imageData[0]->url) ? $imageData[0]->url : '';

                return [
                    'name' => $testimonial->name,
                    'text' => $testimonial->comment,
                    'image' => $image,
                ];
            })
            : [];

    @endphp

    <x-frontend.home.banner>
        @foreach ($data['slider'] as $slide)
            <x-frontend.home.banner-slide image="{{ uploaded_asset($slide['image']) }}" title="{{ $slide['name'] ?? '' }}"
                link="{{ $slide['link'] ?? '' }}" buttonText="{{ $slide['btn_text'] ?? '' }}" />
        @endforeach
    </x-frontend.home.banner>



    <x-frontend.home.highlights>
        <x-frontend.home.highlight-item icon="assets/images/icons/fast-delivery.png" text="Same day Product Delivery" />

        <x-frontend.home.highlight-item icon="assets/images/icons/rating.png" text="100% Customer Satisfaction" />

        <x-frontend.home.highlight-item icon="assets/images/icons/peace.png" text="Help and access is our mission" />

        <x-frontend.home.highlight-item icon="assets/images/icons/high-quality.png" text="100% quality Art Supplies" />

        <x-frontend.home.highlight-item icon="assets/images/icons/customer-service.png" text="24/7 Support for Clients" />
    </x-frontend.home.highlights>



    @if ($topCollections->isNotEmpty())
        @foreach ($topCollections as $collectionKey => $collection)
            <x-frontend.common.product-section title="{{ $collection['collectiontitle'] }}">
                <div class="p-tab active-tab" id="tab-{{ $loop->index + 1 }}">
                    <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                        @foreach ($collection['products'] as $product)
                            @php
                                $priceData = getProductOfferPrice($product);
                            @endphp
                            <x-frontend.common.product-card image="{{ get_product_image($product->thumbnail_img) }}"
                                alt="{{ $product->getTranslation('name', $lang) }}"
                                category="{{ $product->category->getTranslation('name', $lang) ?? 'Product' }}"
                                name="{{ $product->getTranslation('name', $lang) }}"
                                originalPrice="{{ env('DEFAULT_CURRENCY') }} {{ $priceData['original_price'] }}"
                                price="{{ env('DEFAULT_CURRENCY') }} {{ $priceData['discounted_price'] }}"
                                link="{{ route('product-detail', ['slug' => $product->slug, 'sku' => $product->sku]) }}" />
                        @endforeach
                    </div>
                </div>
            </x-frontend.common.product-section>
        @endforeach
    @endif


    @if (!empty($data['banners']['home_mid_banner']))
        <x-frontend.home.featured-products>
            @foreach ($data['banners']['home_mid_banner'] as $midKey => $home_mid_banner)
                <div class="col-lg-4 col-md-6 col-sm-12 -block">
                    <x-frontend.home.featured-product image="{{ $home_mid_banner['image'] }}" alt="Featured Product 1"
                        link="{{ $home_mid_banner['link'] }}" buttonText="{{ $home_mid_banner['btn_text'] }}" />
                </div>
            @endforeach

        </x-frontend.home.featured-products>
    @endif

    @if ($middleCollections->isNotEmpty())
        @foreach ($middleCollections as $collectionKey => $collection)
            <x-frontend.common.product-section title="{{ $collection['collectiontitle'] }}">
                <div class="p-tab active-tab" id="tab-{{ $loop->index + 1 }}">
                    <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                        @foreach ($collection['products'] as $product)
                            @php
                                $priceData = getProductOfferPrice($product);
                            @endphp
                            <x-frontend.common.product-card image="{{ get_product_image($product->thumbnail_img) }}"
                                alt="{{ $product->getTranslation('name', $lang) }}"
                                category="{{ $product->category->getTranslation('name', $lang) ?? 'Product' }}"
                                name="{{ $product->getTranslation('name', $lang) }}"
                                originalPrice="{{ env('DEFAULT_CURRENCY') }} {{ $priceData['original_price'] }}"
                                price="{{ env('DEFAULT_CURRENCY') }} {{ $priceData['discounted_price'] }}"
                                link="{{ route('product-detail', ['slug' => $product->slug, 'sku' => $product->sku]) }}" />
                        @endforeach
                    </div>
                </div>
            </x-frontend.common.product-section>
        @endforeach
    @endif

    @if ($testimonials->count() > 0)
        <x-frontend.home.instagram-feed>
            @foreach ($testimonials as $t)
                <x-frontend.home.instagram-item image="{{ $t['image'] }}" alt="{{ $t['name'] }}" />
            @endforeach
        </x-frontend.home.instagram-feed>
    @endif

    <x-frontend.common.whatsapp-subscribe />
@endsection
