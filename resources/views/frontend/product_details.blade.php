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
                        <div class="product-attributes product__options">
                            @if ($response['product_type'] == 1 && !empty($response['product_attributes'][0]))
                                @php
                                    $flattened_products = call_user_func_array(
                                        'array_merge',
                                        $response['varient_products'],
                                    );
                                @endphp
                                @foreach ($response['product_attributes'] as $akey => $attribute)
                                    <div class="attribute product__sizes-2 d-flex align-items-center">
                                        <ul class="attribute-list product__available-sizes"
                                            data-attribute-id="{{ $attribute['id'] }}">
                                            @php
                                                $selectedValue = '';
                                            @endphp
                                            @foreach ($attribute['values'] as $vkey => $value)
                                                @php
                                                    $activeClass = '';
                                                    $is_present =
                                                        isset($flattened_products[$response['sku']]) &&
                                                        in_array($value['id'], $flattened_products[$response['sku']]);

                                                    if (
                                                        isset($response['current_attribute'][$attribute['id']]) &&
                                                        $response['current_attribute'][$attribute['id']] == $value['id']
                                                    ) {
                                                        $activeClass = 'active';
                                                        $selectedValue = $value['name'];
                                                    }

                                                @endphp
                                                <li class="attribute-item firstItem_{{ $akey }} firstvalue_{{ $vkey }} {{ isset($response['current_attribute'][$attribute['id']]) && $response['current_attribute'][$attribute['id']] == $value['id'] ? 'active' : '' }} @if (!$is_present && $akey != 0) disabled @endif"
                                                    data-value-id="{{ $value['id'] }}">
                                                    {{ $value['name'] }}
                                                </li>
                                            @endforeach
                                        </ul>
                                        <div class="product__current-size">{{ $attribute['name'] }}:
                                            <span>{{ $selectedValue }}</span>
                                        </div>
                                    </div>
                                @endforeach
                            @endif
                        </div>
                    </x-slot>

                    <x-slot name="cartOptions">
                        <div class="product__action js-product-action" style="margin-bottom: 20px">
                            <div class="product__quantity-and-add-to-cart d-flex">
                                <div class="product__quantity">
                                    <div class="product-quantity__minus js-quantity-down"><a href="#"><i
                                                class="lnil lnil-minus"></i></a></div>
                                    <input type="text" value="1" name="product_quantity" id="product_quantity"
                                        class="product-quantity__input js-quantity-field">
                                    <div class="product-quantity__plus js-quantity-up"><a href="#"><i
                                                class="lnil lnil-plus"></i></a></div>
                                </div>
                                <div class="product__add-to-cart max-w-[300px]">
                                    @if ($response['quantity'] > 0)
                                        <button class="eighth-button add-to-cart-btn h-full"
                                            data-product-slug="{{ $response['slug'] }}"
                                            data-product-sku="{{ $response['sku'] }}">
                                            {{ trans('messages.add_to_cart') }}
                                        </button>
                                    @else
                                        <span class="status__value ">{{ trans('messages.out_of_stock') }}</span>
                                    @endif

                                </div>
                            </div>
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
                                 <img src="{{ $photo }}" alt="Product Image {{ $index + 1 }}" class="w-full h-auto object-cover rounded-lg max-h-[300px] md:max-h-[700px]" loading="lazy">
                             </div>
                         @endforeach
                     </div>
                 </div>

                 <!-- Thumbnail Navigation -->
                 <div class="flex justify-center space-x-2 mt-4" id="product-thumbnails">
                     @foreach ($response['photos'] as $index => $photo)
                         <button class="thumbnail-btn w-12 h-12 sm:w-16 sm:h-16 rounded border-2 border-gray-300 overflow-hidden transition-all duration-200 hover:border-blue-500" data-index="{{ $index }}" aria-label="View image {{ $index + 1 }}">
                             <img src="{{ $photo }}" alt="Thumbnail {{ $index + 1 }}" class="w-full h-full object-cover">
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
        <x-frontend.common.product-section title="Related Products" class="pt_40 pb_90">
            @php
                $chunks = collect($relatedProducts)->chunk(5);
            @endphp

            @foreach ($chunks as $chunkIndex => $chunk)
                <div class="p-tab active-tab" id="tab-{{ $chunkIndex + 1 }}">
                    <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">

                        @foreach ($chunk as $relProd)
                            @php
                                $imageRel = $relProd->thumbnail_img ?? app('url')->asset('assets/img/placeholder.jpg');
                                $priceDataRel = getProductOfferPrice($relProd);
                            @endphp

                            <x-frontend.common.product-card image="{{ $imageRel }}"
                                alt="{{ $relProd->name ?? 'Product Image' }}"
                                category="{{ $relProd->category->name ?? 'Category' }}" name="{{ $relProd->name }}"
                                originalPrice="{{ $priceDataRel['original_price'] }}"
                                price="{{ $priceDataRel['discounted_price'] }}"
                                link="{{ route('product-detail', ['slug' => $relProd->slug, 'sku' => $relProd->sku]) }}" />
                        @endforeach

                    </div>
                </div>
            @endforeach
        </x-frontend.common.product-section>
    @endif

@endsection


@section('script')
    <script>
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
