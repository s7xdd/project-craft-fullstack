
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

                // Get video from assets/Videos directory based on testimonial ID or use default
                $videoFiles = [
                    'VN20250904_035052.mp4',
                    'VN20250904_035542.mp4',
                    'VN20250904_124113.mp4',
                    'VN20250904_124131.mp4',
                    'VN20250904_124156.mp4',
                    'VN20250904_124335.mp4',
                    'VN20250904_124350.mp4',
                    'VN20250904_124402.mp4',
                    'VN20250904_124432.mp4',
                    'VN20250904_124444.mp4',
                ];

                // Use testimonial ID to select video, fallback to first video
                $videoIndex = ($testimonial->id - 1) % count($videoFiles);
                $video = asset('assets/Videos/' . $videoFiles[$videoIndex]);

                return [
                    'name' => $testimonial->name,
                    'text' => $testimonial->comment,
                    'image' => $image,
                    'video' => $video,
                ];
            })
            : [];

    @endphp

      <style>
            .hide-scrollbar::-webkit-scrollbar {
              display: none;
            }
          </style>

    <x-frontend.home.banner>
        @foreach ($data['slider'] as $slide)
            <x-frontend.home.banner-slide image="{{ uploaded_asset($slide['image']) }}" title="{{ $slide['name'] ?? '' }}"
                link="{{ $slide['link'] ?? '' }}" buttonText="{{ $slide['btn_text'] ?? '' }}" />
        @endforeach
    </x-frontend.home.banner>



    @if ($page->getTranslation('image1', $lang) && is_array(json_decode($page->getTranslation('image1', $lang))))
        <x-frontend.home.highlights>
            @foreach (json_decode($page->getTranslation('image1', $lang), true) as $sectionData)
                <x-frontend.home.highlight-item
                    icon="{{ isset($sectionData['icon'][0]) ? $sectionData['icon'][0]['url'] ?? '' : '' }}"
                    text="{{ $sectionData['title'] ?? '' }}" />
            @endforeach
        </x-frontend.home.highlights>
    @endif

    


    @if ($topCollections->isNotEmpty())
    @foreach ($topCollections as $collectionKey => $collection)
        <x-frontend.common.product-section title="{{ $collection['collectiontitle'] }}">
            <div class="p-tab active-tab" id="tab-{{ $loop->index + 1 }}">
                <div class="relative">
                    {{-- edge fade (optional hint) --}}
                    <div class="pointer-events-none absolute inset-y-0 left-0 w-10 bg-gradient-to-r from-white to-transparent"></div>
                    <div class="pointer-events-none absolute inset-y-0 right-0 w-10 bg-gradient-to-l from-white to-transparent"></div>

                    {{-- horizontal scroller with snap --}}
                    <div
                        id="row-{{ $loop->index + 1 }}"
                        class="scroll-row overflow-x-auto no-scrollbar snap-x snap-mandatory scroll-smooth hide-scrollbar"
                        aria-label="Products scroller {{ $collection['collectiontitle'] }}"
                    >
                        <div class="flex flex-row gap-5 pr-4 ">
                            @foreach ($collection['products'] as $product)
                                @php $priceData = getProductOfferPrice($product); @endphp
                                <div class="snap-start shrink-0">
                                    <x-frontend.common.product-card
                                        image="{{ get_product_image($product->thumbnail_img) }}"
                                        alt="{{ $product->getTranslation('name', $lang) }}"
                                        category="{{ $product->category->getTranslation('name', $lang) ?? 'Product' }}"
                                        name="{{ $product->getTranslation('name', $lang) }}"
                                        originalPrice="{{ $priceData['original_price'] }}"
                                        price="{{ $priceData['discounted_price'] }}"
                                        link="{{ route('product-detail', ['slug' => $product->slug, 'sku' => $product->sku]) }}"
                                    />
                                </div>
                            @endforeach
                        </div>
                    </div>
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

 
    @if ($topCollections->isNotEmpty())
    @foreach ($topCollections as $collectionKey => $collection)
        <x-frontend.common.product-section title="{{ $collection['collectiontitle'] }}">
            <div class="p-tab active-tab" id="tab-{{ $loop->index + 1 }}">
                <div class="relative">
                    {{-- edge fade (optional hint) --}}
                    <div class="pointer-events-none absolute inset-y-0 left-0 w-10 bg-gradient-to-r from-white to-transparent"></div>
                    <div class="pointer-events-none absolute inset-y-0 right-0 w-10 bg-gradient-to-l from-white to-transparent"></div>

                    {{-- horizontal scroller with snap --}}
                    <div
                        id="row-{{ $loop->index + 1 }}"
                        class="scroll-row overflow-x-auto no-scrollbar snap-x snap-mandatory scroll-smooth hide-scrollbar"
                        aria-label="Products scroller {{ $collection['collectiontitle'] }}"
                    >
                        <div class="flex flex-row gap-5 pr-4 ">
                            @foreach ($collection['products'] as $product)
                                @php $priceData = getProductOfferPrice($product); @endphp
                                <div class="snap-start shrink-0">
                                    <x-frontend.common.product-card
                                        image="{{ get_product_image($product->thumbnail_img) }}"
                                        alt="{{ $product->getTranslation('name', $lang) }}"
                                        category="{{ $product->category->getTranslation('name', $lang) ?? 'Product' }}"
                                        name="{{ $product->getTranslation('name', $lang) }}"
                                        originalPrice="{{ $priceData['original_price'] }}"
                                        price="{{ $priceData['discounted_price'] }}"
                                        link="{{ route('product-detail', ['slug' => $product->slug, 'sku' => $product->sku]) }}"
                                    />
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>
            </div>
        </x-frontend.common.product-section>
    @endforeach
@endif

    @if ($testimonials->count() > 0)
        <x-frontend.home.testimonial-feed>
            @foreach ($testimonials as $t)
                <x-frontend.home.testimonial-item
                    video="{{ $t['video'] }}"
                    name="{{ $t['name'] }}"
                    text="{{ $t['text'] }}" />
            @endforeach
        </x-frontend.home.testimonial-feed>
    @endif

    <x-frontend.common.whatsapp-subscribe />
@endsection

@section('script')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var loaderText = document.querySelector('#page-loader .loader-text');
        });
    </script>
@endsection
