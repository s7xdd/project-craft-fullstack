@extends('frontend.layouts.app')

@section('content')
    @php
        $images = $response['photos'];
        if ($response['thumbnail_image'] != null) {
            array_unshift($images, $response['thumbnail_image']);
        }

        if ($response['variant_image'] != null) {
            array_push($images, $response['variant_image']);
        }

        $thumbanailSlider = $productImagesWeb = $productImagesMob = '';

        $flattened_product_prices = call_user_func_array('array_merge', $response['varient_productsPrice']);
    @endphp


    @if (!empty($images))
        @foreach ($images as $imgkey => $img)
            @php
                $activeStatus = '';
                if ($imgkey == 0) {
                    $activeStatus = 'active';
                }

                $productImagesWeb .=
                    '<li class="' .
                    $activeStatus .
                    ' js-product-main-image" data-id="' .
                    $imgkey .
                    '">
                                        <a href="' .
                    $img .
                    '">
                                            <img alt="Image" src="' .
                    $img .
                    '"
                                                data-zoomed="' .
                    $img .
                    '" class="js-zoomit" />
                                        </a>
                                    </li>';

                $productImagesMob .=
                    '<div class="mobile-product-image">
                                            <p>
                                                <a href="' .
                    $img .
                    '" target="_blank">
                                                    <img alt="Image" src="' .
                    $img .
                    '" />
                                                </a>
                                            </p>
                                        </div>';

                $thumbanailSlider .=
                    '<li class="js-product-thumnail-slider" data-group="1">
                                    <a href="#" class="' .
                    $activeStatus .
                    ' js-product-thumbnail" data-id="' .
                    $imgkey .
                    '">
                                        <img alt="Image" src="' .
                    $img .
                    '" />
                                    </a>
                                </li>';
            @endphp
        @endforeach
    @endif


    <x-frontend.product-detail.product-gallery>
        <x-slot name="productDetails">

            <x-frontend.product-detail.product-details category="Resins" title="Premium Clear Epoxy Resin Kit"
                price="{{ $flattened_product_prices[$response['sku']]['discounted_price'] }}"
                originalPrice="{{ $flattened_product_prices[$response['sku']]['original_price'] }}">

                <x-slot name="description">
                    {!! $response['short_description'] !!}
                </x-slot>

                <x-slot name="details">
                    @if ($response['brand'])
                        <li><strong>Brand :</strong>{{ $response['brand'] }}</li>
                    @endif

                    <li><strong>Product SKU :</strong>{{ $response['sku'] }}</li>

                    <li><strong>Category :</strong>{{ $response['category']['name'] }}</li>

                    <li>
                        <strong>Availability :</strong>
                        @if ($response['quantity'] > 0)
                            <span class="product-stock">
                                <img src="assets/images/icons/icon-13.png" alt="" /> In Stock
                            </span>
                        @else
                            <span class="" style="color: red">
                                Out of stock
                            </span>
                        @endif
                    </li>

                </x-slot>

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
                            <div class="product__add-to-cart">
                                @if ($response['quantity'] > 0)
                                    <button class="eighth-button add-to-cart-btn"
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

                @if ($response['tags'])
                    <x-slot name="tags">
                        <li>
                            <strong>Tag :</strong>
                            @foreach ($response['tags'] as $tag)
                                <a href="">{{ $tag }}</a>,
                            @endforeach
                        </li>
                    </x-slot>
                @endif

                <x-slot name="socialLinks">
                    <li class="social-links">
                        <strong>Share :</strong>
                        <a href="shop-details.html"><i class="icon-14"></i></a>
                        <a href="shop-details.html"><i class="icon-15"></i></a>
                        <a href="shop-details.html"><i class="icon-16"></i></a>
                    </li>
                </x-slot>

            </x-frontend.product-detail.product-details>
        </x-slot>

        <x-slot name="productDescription">
            <x-frontend.product-detail.product-description>
                <x-slot name="tabs">
                    <x-frontend.product-detail.tab-button class="active-btn" tabId="tab-1" title="Description" />
                </x-slot>

                <x-frontend.product-detail.description-content>
                    {!! $response['description'] !!}
                </x-frontend.product-detail.description-content>

            </x-frontend.product-detail.product-description>
        </x-slot>

        <x-frontend.product-detail.product-slider-item image="{{ $images[0] ?? 'assets/images/product-1.webp' }}"
            alt="Product Image">
            <x-slot name="thumbnails">
                @foreach ($images as $index => $img)
                    <x-frontend.product-detail.thumbnail-item class="{{ $index === 0 ? 'active' : '' }}"
                        index="{{ $index }}" image="{{ $img }}" alt="Thumbnail {{ $index + 1 }}" />
                @endforeach
            </x-slot>
        </x-frontend.product-detail.product-slider-item>


    </x-frontend.product-detail.product-gallery>

    <x-frontend.common.product-section title="Related Products" class="pt_40 pb_90">
        <div class="p-tab active-tab" id="tab-1">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Secret of the Enchanted Forest Path" category="History"
                    name="The Secret of the Enchanted Forest Path" originalPrice="$08.99" price="$07.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-2.webp"
                    alt="The Magical Adventure of the Lost Unicorn" category="Comic"
                    name="The Magical Adventure of the Lost Unicorn" originalPrice="$04.99" price="$03.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-3.webp"
                    alt="Oliver and the Quest for the Golden Key" category="School"
                    name="Oliver and the Quest for the Golden Key" originalPrice="$02.99" price="$01.99"
                    link="shop-details.html" />
            </div>
        </div>

        <div class="p-tab" id="tab-2">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Secret of the Enchanted Forest Path" category="History"
                    name="The Secret of the Enchanted Forest Path" originalPrice="$08.99" price="$07.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Magical Adventure of the Lost Unicorn" category="Comic"
                    name="The Magical Adventure of the Lost Unicorn" originalPrice="$04.99" price="$03.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Oliver and the Quest for the Golden Key" category="School"
                    name="Oliver and the Quest for the Golden Key" originalPrice="$02.99" price="$01.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp" alt="The Mystery of the Moonlight"
                    category="Comic" name="The Mystery of the Moonlight" originalPrice="$07.99" price="$06.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Luna and the Hidden Treasure Map" category="Science" name="Luna and the Hidden Treasure Map"
                    originalPrice="$12.99" price="$10.99" link="shop-details.html" />
            </div>
        </div>

        <div class="p-tab" id="tab-3">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Secret of the Enchanted Forest Path" category="History"
                    name="The Secret of the Enchanted Forest Path" originalPrice="$08.99" price="$07.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Magical Adventure of the Lost Unicorn" category="Comic"
                    name="The Magical Adventure of the Lost Unicorn" originalPrice="$04.99" price="$03.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Oliver and the Quest for the Golden Key" category="School"
                    name="Oliver and the Quest for the Golden Key" originalPrice="$02.99" price="$01.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp" alt="The Mystery of the Moonlight"
                    category="Comic" name="The Mystery of the Moonlight" originalPrice="$07.99" price="$06.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Luna and the Hidden Treasure Map" category="Science" name="Luna and the Hidden Treasure Map"
                    originalPrice="$12.99" price="$10.99" link="shop-details.html" />
            </div>
        </div>

        <div class="p-tab" id="tab-4">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Secret of the Enchanted Forest Path" category="History"
                    name="The Secret of the Enchanted Forest Path" originalPrice="$08.99" price="$07.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Magical Adventure of the Lost Unicorn" category="Comic"
                    name="The Magical Adventure of the Lost Unicorn" originalPrice="$04.99" price="$03.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Oliver and the Quest for the Golden Key" category="School"
                    name="Oliver and the Quest for the Golden Key" originalPrice="$02.99" price="$01.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp" alt="The Mystery of the Moonlight"
                    category="Comic" name="The Mystery of the Moonlight" originalPrice="$07.99" price="$06.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Luna and the Hidden Treasure Map" category="Science" name="Luna and the Hidden Treasure Map"
                    originalPrice="$12.99" price="$10.99" link="shop-details.html" />
            </div>
        </div>

        <div class="p-tab" id="tab-5">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Secret of the Enchanted Forest Path" category="History"
                    name="The Secret of the Enchanted Forest Path" originalPrice="$08.99" price="$07.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Magical Adventure of the Lost Unicorn" category="Comic"
                    name="The Magical Adventure of the Lost Unicorn" originalPrice="$04.99" price="$03.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Oliver and the Quest for the Golden Key" category="School"
                    name="Oliver and the Quest for the Golden Key" originalPrice="$02.99" price="$01.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp" alt="The Mystery of the Moonlight"
                    category="Comic" name="The Mystery of the Moonlight" originalPrice="$07.99" price="$06.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Luna and the Hidden Treasure Map" category="Science" name="Luna and the Hidden Treasure Map"
                    originalPrice="$12.99" price="$10.99" link="shop-details.html" />
            </div>
        </div>
    </x-frontend.common.product-section>

    <x-frontend.common.whatsapp-subscribe />
@endsection
