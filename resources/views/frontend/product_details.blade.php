@extends('frontend.layouts.app')

@section('content')
    @php
        $images = $response['photos'] ?? [];
        if (isset($response['thumbnail_image']) && $response['thumbnail_image'] != null) {
            array_unshift($images, $response['thumbnail_image']);
        }

        if (isset($response['variant_image']) && $response['variant_image'] != null) {
            array_push($images, $response['variant_image']);
        }

        $flattened_product_prices = [];
        if (!empty($response['varient_productsPrice']) && is_array($response['varient_productsPrice'])) {
            $arrays = array_filter($response['varient_productsPrice'], 'is_array');
            if (!empty($arrays)) {
                $flattened_product_prices = call_user_func_array('array_merge', $arrays);
            }
        }

        $product_main_price = !empty($flattened_product_prices[$response['sku']]['original_price'])
            ? $flattened_product_prices[$response['sku']]['original_price']
            : $response['main_price'];

        $product_discount_price = !empty($flattened_product_prices[$response['sku']]['discounted_price'])
            ? $flattened_product_prices[$response['sku']]['original_price']
            : $response['stroked_price'];

    @endphp


    <x-frontend.product-detail.product-gallery>
        <x-slot name="productDetails">

            @if (isset($response['id']) && isset($response['name']))
                <x-frontend.product-detail.product-details category="{{ $response['category']['name'] }}"
                    title="{{ isset($response['name']) ? $response['name'] : '' }}" price="{{ $product_main_price }}"
                    originalPrice="{{ $product_discount_price }}">

                    <x-slot name="description">
                        {!! $response['short_description'] !!}
                    </x-slot>

                    <x-slot name="details">
                        @if ($response['brand'])
                            <div class="flex items-center gap-2">
                                <strong class="min-w-[100px]">Brand </strong>
                                <strong>:</strong>
                                <span>{{ $response['brand'] }}</span>
                            </div>
                        @endif

                        <div class="flex items-center gap-2">
                            <strong class="min-w-[100px]">Product SKU </strong>
                            <strong>:</strong>
                            <span>{{ $response['sku'] }}</span>
                        </div>

                        <div class="flex items-center gap-2">
                            <strong class="min-w-[100px]">Category </strong>
                            <strong>:</strong>
                            <span>{{ $response['category']['name'] }}</span>
                        </div>

                        <div class="flex items-center gap-2">
                            <strong class="min-w-[100px]">Availability </strong>
                            <strong>:</strong>
                            @if ($response['quantity'] > 0)
                                <span class="product-stock flex gap-2">
                                    <img src="assets/images/icons/icon-13.png" alt="" /> In Stock
                                </span>
                            @else
                                <span class="text-red-500">
                                    Out of stock
                                </span>
                            @endif
                        </div>

                    </x-slot>

                    @if (isset($response['description']) && $response['description'] . trim('') != '')
                        <x-slot name="productDescription">
                            <x-frontend.product-detail.product-description>
                                <x-slot name="tabs">
                                    <x-frontend.product-detail.tab-button class="active-btn text-black" tabId="tab-1"
                                        title="Description" />
                                </x-slot>

                                <x-frontend.product-detail.description-content>
                                    {!! $response['description'] !!}
                                </x-frontend.product-detail.description-content>

                            </x-frontend.product-detail.product-description>
                        </x-slot>
                    @endif

                     <x-slot name="colorOptions">
                         <div class="space-y-4">
                             @if ($response['product_type'] == 1 && !empty($response['product_attributes'][0]))
                                 @php
                                     $flattened_products = call_user_func_array(
                                         'array_merge',
                                         $response['varient_products'],
                                     );
                                 @endphp
                                 @foreach ($response['product_attributes'] as $akey => $attribute)
                                     <div class="space-y-3">
                                         <div class="flex items-center justify-between">
                                             <span class="text-sm font-medium text-gray-700">{{ $attribute['name'] }}</span>
                                             <span class="text-sm text-gray-500">{{ $selectedValue ?? '' }}</span>
                                         </div>
                                         <div class="flex flex-wrap gap-2">
                                             @foreach ($attribute['values'] as $vkey => $value)
                                                 @php
                                                     $is_present =
                                                         isset($flattened_products[$response['sku']]) &&
                                                         in_array($value['id'], $flattened_products[$response['sku']]);
                                                 @endphp
                                                 <button class="px-4 py-2 text-sm border border-gray-300 rounded-md hover:border-gray-400 hover:bg-gray-50 transition-colors {{ isset($response['current_attribute'][$attribute['id']]) && $response['current_attribute'][$attribute['id']] == $value['id'] ? 'border-blue-500 bg-blue-50 text-blue-700' : 'text-gray-700' }} {{ (!$is_present && $akey != 0) ? 'opacity-50 cursor-not-allowed' : '' }}"
                                                         data-value-id="{{ $value['id'] }}"
                                                         {{ (!$is_present && $akey != 0) ? 'disabled' : '' }}>
                                                     {{ $value['name'] }}
                                                 </button>
                                             @endforeach
                                         </div>
                                     </div>
                                 @endforeach
                             @endif
                         </div>
                     </x-slot>

                     <x-slot name="cartOptions">
                         <div class="flex items-center space-x-4 pt-6">
                             <div class="flex items-center border border-gray-300 rounded-lg">
                                 <button class="p-3 text-gray-600 hover:text-gray-800 hover:bg-gray-50 rounded-l-lg transition-colors js-quantity-down">
                                     <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                         <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 12H4"></path>
                                     </svg>
                                 </button>
                                 <input type="text" value="1" name="product_quantity" id="product_quantity"
                                        class="w-16 text-center border-0 focus:ring-0 text-gray-900 js-quantity-field">
                                 <button class="p-3 text-gray-600 hover:text-gray-800 hover:bg-gray-50 rounded-r-lg transition-colors js-quantity-up">
                                     <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                         <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                                     </svg>
                                 </button>
                             </div>
                             <button class="flex-1 bg-black text-white px-8 py-3 rounded-lg font-semibold hover:bg-gray-800 transition-colors add-to-cart-btn"
                                     data-product-slug="{{ $response['slug'] }}" data-product-sku="{{ $response['sku'] }}">
                                 {{ trans('messages.add_to_cart') }}
                             </button>
                         </div>

                         <div id="image-zoom-window"
                             class="fixed top-1/2 right-4 lg:right-[300px] transform -translate-y-1/2 w-96 h-96 lg:w-[600px] lg:h-[600px] bg-white border-2 border-gray-300 rounded-lg shadow-lg overflow-hidden z-50 hidden">
                             <div id="zoom-lens" class="w-full h-full bg-no-repeat bg-cover"
                                 style="background-image: url('');"></div>
                         </div>
                     </x-slot>


                    <x-slot name="socialLinks">
                        <x-frontend.common.social-share :product="$response" />
                    </x-slot>

                </x-frontend.product-detail.product-details>
            @endif

        </x-slot>

        {{-- @if (isset($response['description']) && $response['description'] . trim('') != '')
            <x-slot name="productDescription">
                <x-frontend.product-detail.product-description>
                    <x-slot name="tabs">
                        <x-frontend.product-detail.tab-button class="active-btn text-black" tabId="tab-1"
                            title="Description" />
                    </x-slot>

                    <x-frontend.product-detail.description-content>
                        {!! $response['description'] !!}
                    </x-frontend.product-detail.description-content>

                </x-frontend.product-detail.product-description>
            </x-slot>
        @endif --}}

        <div class="">
            <div class="product-gallery flex flex-col items-center">
                <!-- Main Image Slider -->
                <div class="embla overflow-hidden w-full max-w-4xl" id="product-image-carousel">
                    <div class="embla__container flex">
                        @foreach ($response['photos'] as $index => $photo)
                            <div class="embla__slide flex-[0_0_100%] min-w-0 flex items-center justify-center">
                                <img src="{{ $photo }}" alt="Product Image {{ $index + 1 }}"
                                    class="w-full h-auto object-cover rounded-lg max-h-[300px] md:max-h-[700px]"
                                    loading="lazy">
                            </div>
                        @endforeach
                    </div>
                </div>

                <!-- Thumbnail Navigation -->
                <div class="flex justify-center space-x-2 mt-4" id="product-thumbnails">
                    @foreach ($response['photos'] as $index => $photo)
                        <button
                            class="thumbnail-btn w-12 h-12 sm:w-16 sm:h-16 rounded border-2 border-gray-300 overflow-hidden transition-all duration-200 hover:border-blue-500"
                            data-index="{{ $index }}" aria-label="View image {{ $index + 1 }}">
                            <img src="{{ $photo }}" alt="Thumbnail {{ $index + 1 }}"
                                class="w-full h-full object-cover">
                        </button>
                    @endforeach
                </div>
            </div>
        </div>


        {{-- <div id="product-swiper" data-images='@json($response['photos'] ?? ['default-product.jpg'])'
            class="w-full md:w-1/2 relative flex flex-col justify-center items-center space-y-2 !min-h-[400px] md:!h-[1000px]">
        </div> --}}


        {{-- <x-frontend.product-detail.product-slider-item image="{{ $images[0] ?? asset('assets/images/product-1.webp') }}"
            alt="{{ $response['name'] ?? 'Product Image' }}">
            <x-slot name="thumbnails">
                @foreach ($images as $index => $img)
                    <x-frontend.product-detail.thumbnail-item class="{{ $index === 0 ? 'active' : '' }}"
                        index="{{ $index }}" image="{{ $img }}" alt="Thumbnail {{ $index + 1 }}" />
                @endforeach
            </x-slot>
        </x-frontend.product-detail.product-slider-item> --}}




    </x-frontend.product-detail.product-gallery>



     @if (!empty($relatedProducts[0]))
         <section class="py-16 bg-white">
             <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                 <h2 class="text-3xl font-bold text-gray-900 text-center mb-12">Related Products</h2>
                 @php
                     $chunks = collect($relatedProducts)->chunk(5);
                 @endphp

                 @foreach ($chunks as $chunkIndex => $chunk)
                     <div class="{{ $chunkIndex === 0 ? 'block' : 'hidden' }}" id="related-tab-{{ $chunkIndex + 1 }}">
                         <div class="relative">
                             <div class="swiper relatedProductsSwiper">
                                 <div class="swiper-wrapper">

                                     @foreach ($chunk as $relProd)
                                         @php
                                             $imageRel = $relProd->thumbnail_img ?? app('url')->asset('assets/img/placeholder.jpg');
                                             $priceDataRel = getProductOfferPrice($relProd);
                                         @endphp

                                         <div class="swiper-slide">
                                             <x-frontend.common.product-card image="{{ $imageRel }}"
                                                 alt="{{ $relProd->name ?? 'Product Image' }}"
                                                 category="{{ $relProd->category->name ?? 'Category' }}" name="{{ $relProd->name }}"
                                                 originalPrice="{{ $priceDataRel['original_price'] }}"
                                                 price="{{ $priceDataRel['discounted_price'] }}"
                                                 link="{{ route('product-detail', ['slug' => $relProd->slug, 'sku' => $relProd->sku]) }}" />
                                         </div>
                                     @endforeach

                                 </div>
                                 <button class="swiper-button-prev absolute left-0 top-1/2 -translate-y-1/2 z-10 w-12 h-12 bg-white rounded-full shadow-lg text-gray-800 hover:bg-gray-50 transition-colors">
                                     <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                         <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                                     </svg>
                                 </button>
                                 <button class="swiper-button-next absolute right-0 top-1/2 -translate-y-1/2 z-10 w-12 h-12 bg-white rounded-full shadow-lg text-gray-800 hover:bg-gray-50 transition-colors">
                                     <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                         <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                                     </svg>
                                 </button>
                             </div>
                         </div>
                     </div>
                 @endforeach
             </div>
         </section>
     @endif

@endsection


@section('script')
     <script>
         // Initialize Swiper for Related Products
         document.addEventListener('DOMContentLoaded', function () {
             new Swiper('.relatedProductsSwiper', {
                 slidesPerView: 2,
                 spaceBetween: 10,
                 navigation: {
                     nextEl: '.swiper-button-next',
                     prevEl: '.swiper-button-prev',
                 },
                 autoplay: {
                     delay: 3000,
                     disableOnInteraction: false,
                 },
                 loop: true,
                 breakpoints: {
                     480: { slidesPerView: 2 },
                     768: { slidesPerView: 3 },
                     1024: { slidesPerView: 4 },
                     1280: { slidesPerView: 5 },
                     1536: { slidesPerView: 6 },
                 },
             });
         });

         const currentAttribute = @json($response['current_attribute']);
         const productAttributes = @json($response['product_attributes']);
         const variantProducts = @json($response['varient_products']);


         var slug = '{{ $response['slug'] }}';
         $(document).ready(function() {

            let selectedAttributes = {};
            const firstAttributeId = productAttributes[0].id;

            $('.attribute-item').click(function() {
                const attributeId = $(this).closest('.attribute-list').data('attribute-id');
                const valueId = $(this).data('value-id');

                if (attributeId === firstAttributeId) {
                    selectedAttributes[attributeId] = valueId;
                    $(this).siblings().removeClass('active');
                    $(this).addClass('active');

                    updateSubsequentAttributes(selectedAttributes);
                    return;
                }

                selectedAttributes[attributeId] = valueId;

                $(this).siblings().removeClass('active');
                $(this).addClass('active');

                clearSubsequentAttributes(attributeId);

                filterAttributes(selectedAttributes);

                if (Object.keys(selectedAttributes).length === productAttributes.length) {
                    displaySKU(selectedAttributes);
                } else {
                    $('#product-stock').html('<p>Select all attributes to see product details.</p>');
                }
            });

            function filterAttributes(selectedAttributes) {
                const validCombinations = getValidCombinations(selectedAttributes);
                let validValues = {};

                validCombinations.forEach(variant => {
                    const values = Object.values(variant)[0].map(value => parseInt(
                        value));
                    values.forEach(value => {
                        const attrId = getAttributeId(value);
                        if (!validValues[attrId]) validValues[attrId] = [];
                        if (!validValues[attrId].includes(value)) validValues[attrId].push(value);
                    });
                });

                $('.attribute-list').each(function() {
                    const attrId = $(this).data('attribute-id');

                    if (attrId === firstAttributeId) {
                        $(this).find('.attribute-item').show().removeClass('disabled');
                        return;
                    }

                    $(this).find('.attribute-item').each(function() {
                        if ($(this).hasClass('firstItem_0')) {
                            return;
                        }

                        const valueId = parseInt($(this).data('value-id'));
                        if (validValues[attrId]?.includes(valueId)) {
                            $(this).removeClass('disabled').show();
                        } else {
                            $(this).addClass('disabled').hide();
                        }
                    });
                });
            }

            function updateSubsequentAttributes(selectedAttributes) {
                const validCombinations = getValidCombinations(selectedAttributes);

                let validValues = {};
                validCombinations.forEach(variant => {
                    const values = Object.values(variant)[0].map(value => parseInt(
                        value));
                    values.forEach(value => {
                        const attrId = getAttributeId(value);
                        if (!validValues[attrId]) validValues[attrId] = [];
                        if (!validValues[attrId].includes(value)) validValues[attrId].push(value);
                    });
                });

                $('.attribute-list').each(function() {
                    const attrId = $(this).data('attribute-id');

                    if (attrId === firstAttributeId) {
                        $(this).find('.attribute-item').show().removeClass('disabled');
                        return;
                    }

                    $(this).find('.attribute-item').each(function() {
                        const valueId = parseInt($(this).data('value-id'));
                        if (validValues[attrId]?.includes(valueId)) {
                            $(this).removeClass('disabled').show();
                            if (!selectedAttributes[attrId]) {
                                selectedAttributes[attrId] = valueId;
                                $(this).addClass('active');
                            }
                        } else {
                            $(this).addClass('disabled').hide();
                        }
                    });
                });

                if (Object.keys(selectedAttributes).length === productAttributes.length) {
                    displaySKU(selectedAttributes);
                }
            }

            function getValidCombinations(selectedAttributes) {
                console.log("Selected Attributes:", selectedAttributes);
                console.log("Variant Products:", variantProducts);

                return variantProducts.filter(variant => {
                    const values = Object.values(variant)[0].map(value => parseInt(
                        value));
                    return Object.entries(selectedAttributes).every(([attrId, valueId]) => {
                        return values.includes(parseInt(valueId));
                    });
                });
            }

            function clearSubsequentAttributes(attributeId) {
                const attributeIndex = productAttributes.findIndex(attr => attr.id == attributeId);
                productAttributes.slice(attributeIndex + 1).forEach(attr => {
                    delete selectedAttributes[attr.id];
                    $(`[data-attribute-id="${attr.id}"] .attribute-item`).removeClass('active');
                });
            }

            function displaySKU(selectedAttributes) {
                const matchingVariant = variantProducts.find(variant => {
                    const values = Object.values(variant)[0].map(value => parseInt(
                        value));
                    return Object.values(selectedAttributes).every(value => values.includes(value));
                });

                if (matchingVariant) {
                    const sku = Object.keys(matchingVariant)[0];
                    $('#product-stock').html(`<p>SKU: ${sku}</p>`);
                    var url = '/product-detail?slug=' + encodeURIComponent(slug) + '&sku=' + encodeURIComponent(
                        sku);

                    window.location.href = url;
                } else {
                    $('#product-stock').html('<p>No matching product found.</p>');
                }
            }

            function getAttributeId(valueId) {
                for (const attribute of productAttributes) {
                    if (attribute.values.some(value => value.id === valueId)) {
                        return attribute.id;
                    }
                }
                return null;
            }
        });
    </script>
@endsection
