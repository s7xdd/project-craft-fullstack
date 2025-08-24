@extends('frontend.layouts.app')
@section('content')
    <!-- Shop breadcrumb -->
    <div class="shop-breadcrumb">
        <!-- Container -->
        <div class="container container--type-2">
           
            {{ Breadcrumbs::render('product', $product_stock->product) }}
            <!-- End breadcrumb -->
            <!-- Title -->
            <!-- End Title -->
        </div>
        <!-- End container -->
    </div>
    <!-- End shop breadcrumb -->

    @php
        $images = $response['photos'];
        if($response['thumbnail_image'] != null){
            array_unshift($images, $response['thumbnail_image']);
        }

        if($response['variant_image'] != null){
            array_push($images, $response['variant_image']);
        }

        $thumbanailSlider = $productImagesWeb = $productImagesMob = '';
    @endphp

    @if (!empty($images))
        @foreach ($images as $imgkey => $img)
            
            @php
                $activeStatus = '';
                if($imgkey == 0){
                    $activeStatus = 'active';
                }

                $productImagesWeb .= '<li class="'.$activeStatus.' js-product-main-image" data-id="'.$imgkey.'">
                                        <a href="'. $img .'">
                                            <img alt="Image" src="'. $img .'"
                                                data-zoomed="'. $img .'" class="js-zoomit" />
                                        </a>
                                    </li>';
                
                $productImagesMob .= '<div class="mobile-product-image">
                                            <p>
                                                <a href="'. $img .'" target="_blank">
                                                    <img alt="Image" src="'. $img .'" />
                                                </a>
                                            </p>
                                        </div>';

                $thumbanailSlider .= '<li class="js-product-thumnail-slider" data-group="1">
                                    <a href="#" class="'.$activeStatus.' js-product-thumbnail" data-id="'.$imgkey.'">
                                        <img alt="Image" src="'. $img .'" />
                                    </a>
                                </li>';
            @endphp
        @endforeach
    @endif


    <!-- Product mobile gallery -->
    <div class="product__mobile-gallery js-product-mobile-gallery">

        {!! $productImagesMob !!}
       
    </div>
    <!-- End product mobile allery -->

    <!-- Product -->
    <div class="product product-layout-3">
        <!-- Container -->
        <div class="container container--type-2">
            <!-- Product main -->
            <div class="product__main d-flex">
                <!-- Product image and thumbnails -->
                <div class="product__main-image-and-thumbnails">
                    <!-- Product tag -->
                    <div class="product-grid-item__tag">{{ $response['offer_tag'] }}</div>
                    <!-- End product tag -->
                    <!-- Product main image -->
                    <ul class="product__main-image js-popup-gallery">
                       
                        {!! $productImagesWeb !!}
                       
                    </ul>
                    <!-- End product main image -->
                    <!-- Product thumbnails -->
                    <ul class="product__thumbnails">
                        {!! $thumbanailSlider !!}
                       
                    </ul>
                    <!-- End product thumbnails -->
                </div>
                <!-- End product thumbnails and image -->
                <!-- Product right -->
                <div class="product__right">
                    <!-- Product title -->
                    <h1 class="product__title">{{ $response['name'] }}</h1>
                    <!-- End product title -->
                    <!-- Product reviews -->
                    <div class="product__reviews">
                        <i class="lnil lnil-star-fill active"></i>
                        <i class="lnil lnil-star-fill active"></i>
                        <i class="lnil lnil-star-fill active"></i>
                        <i class="lnil lnil-star-fill active"></i>
                        <i class="lnil lnil-star-fill"></i>
                        <span>{{ $response['rating_count'] }} {{ trans('messages.reviews') }}</span>
                    </div>
                    <!-- End product reviews -->
                    <!-- Product price -->

                    @php
                        $flattened_product_prices = call_user_func_array('array_merge', $response['varient_productsPrice']);
                    @endphp
                    
                    @if (isset($flattened_product_prices[$response['sku']]['original_price']))
                        <div class="product__price" bis_skin_checked="1">
                            <span class="product-price__new">{{ env('DEFAULT_CURRENCY').' '. $flattened_product_prices[$response['sku']]['discounted_price']  }}</span>
                        
                            @if ($flattened_product_prices[$response['sku']]['original_price'] != $flattened_product_prices[$response['sku']]['discounted_price'])
                                <span class="product-price__old">{{ env('DEFAULT_CURRENCY').' '.$flattened_product_prices[$response['sku']]['original_price'] }}</span>
                            @endif
                            
                        </div>
                    @endif
                    
                    <!-- End product price -->


                    <!-- Status -->
                    <div class="product__status">
                        <i class="lni lni-package"></i>
                        <span>{{ trans('messages.status') }}:</span>

                        @if ($response['quantity'] > 0)
                            <span class="status__value status__value--in-stock">{{trans('messages.in_stock')}}</span>
                        @else
                            <span class="status__value ">{{ trans('messages.out_of_stock') }}</span>
                        @endif

                       
                    </div>
                    <!-- End product status -->
                    <!-- Product description -->
                    {{-- <div class="product__description">
                        {!! $response['description'] !!}
                    </div> --}}
                    <!-- End product description -->
                    <!-- Options -->
                    
                    <div class="product-attributes product__options">
                        @if ($response['product_type'] == 1 && !empty($response['product_attributes'][0]))
                            @php
                                $flattened_products = call_user_func_array('array_merge', $response['varient_products']);
                            @endphp
                            @foreach ($response['product_attributes'] as $akey => $attribute)
                                <div class="attribute product__sizes-2 d-flex align-items-center">
                                    <ul class="attribute-list product__available-sizes" data-attribute-id="{{ $attribute['id'] }}">
                                        @php
                                            $selectedValue = '';
                                        @endphp
                                        @foreach ($attribute['values'] as $vkey => $value)
                                            @php
                                                $activeClass = '';
                                                $is_present = isset($flattened_products[$response['sku']]) && in_array($value['id'], $flattened_products[$response['sku']]);

                                                if(isset($response['current_attribute'][$attribute['id']]) && $response['current_attribute'][$attribute['id']] == $value['id']){
                                                    $activeClass = 'active';
                                                    $selectedValue = $value['name'];
                                                }
                                                
                                            @endphp
                                            <li class="attribute-item firstItem_{{$akey}} firstvalue_{{$vkey}} {{ isset($response['current_attribute'][$attribute['id']]) && $response['current_attribute'][$attribute['id']] == $value['id'] ? 'active' : '' }} @if (!$is_present && $akey !=0) disabled @endif"  data-value-id="{{ $value['id'] }}">
                                                {{ $value['name'] }}
                                            </li>
                                        @endforeach
                                    </ul>
                                    <div class="product__current-size">{{ $attribute['name'] }}: <span>{{ $selectedValue }}</span></div>
                                </div>
                            @endforeach
                        @endif

                        <div class="product__description product-stock" id="product-stock">
                            <p>SKU : {{$response['sku']}}</p>
                        </div>
                    </div>
                    
                    <!-- End options -->
                    <!-- Product action -->
                    <div class="product__action js-product-action">
                        <!-- Product quantity and add to cart -->
                        <div class="product__quantity-and-add-to-cart d-flex">
                            <!-- Quantity -->
                            <div class="product__quantity">
                                <div class="product-quantity__minus js-quantity-down"><a href="#"><i
                                            class="lnil lnil-minus"></i></a></div>
                                <input type="text" value="1" name="product_quantity" id="product_quantity" class="product-quantity__input js-quantity-field">
                                <div class="product-quantity__plus js-quantity-up"><a href="#"><i
                                            class="lnil lnil-plus"></i></a></div>
                            </div>
                            <!-- End quantity -->
                            <!-- Add to cart -->
                            <div class="product__add-to-cart">
                                @if ($response['quantity'] > 0)
                                    <button class="eighth-button add-to-cart-btn" data-product-slug="{{$response['slug']}}" data-product-sku="{{$response['sku']}}">
                                        {{ trans('messages.add_to_cart') }}
                                    </button>
                                @else
                                    <span class="status__value ">{{ trans('messages.out_of_stock') }}</span>
                                @endif
                                
                            </div>
                            <!-- End add to cart -->
                        </div>
                        <!-- End product quantity and add to cart -->
                        <!-- Buy now -->
                        {{-- <div class="product__buy-now">
                            <a href="#" class="second-button">Buy now</a>
                        </div> --}}
                        <!-- End buy now -->
                    </div>
                    <!-- End product action -->
                    <!-- Product second action -->
                    <ul class="product__second-action d-flex">
                        <li><a href="#" class="wishlist-btn" data-product-slug="{{ $response['slug'] }}" data-product-sku="{{ $response['sku'] }}" ><i class="lnr lnr-heart {{($response['wishlisted'] == 1) ? 'active' : '' }}"></i> 
                            <span class="wishlist_msg">@if($response['wishlisted'] == 1) 
                                {{ trans('messages.remove_wishlist') }}
                            @else
                                {{ trans('messages.add_wishlist') }}
                            @endif
                            </span>
                        </a></li>
                        {{-- <li><a href="#"><i class="lnil lnil-reload"></i> Compare</a></li>
                        <li><a href="#"><i class="lnil lnil-size"></i> Size guide</a></li> --}}



                    </ul>
                    <!-- End product section action -->
                    <!-- Product information -->
                    <div class="product__description">
                        {!! $response['description'] !!}
                    </div>
                    <!-- End product information -->
                    <!-- Product social -->
                    {{-- <ul class="product__socials product__socials--type-2">
                        <li><a href="https://twitter.com" target="_blank"><i class="lnil lnil-twitter"></i></a></li>
                        <li><a href="https://facebook.com" target="_blank"><i class="lnil lnil-facebook"></i></a>
                        </li>
                        <li><a href="https://instagram.com" target="_blank"><i class="lnil lnil-Instagram"></i></a>
                        </li>
                    </ul> --}}
                    <!-- End product social -->
                </div>
                <!-- End product right -->
                <!-- Product sidebar -->
                <div class="product__sidebar">
                    <div class="product-sidebar__features">
                        <!-- Feature -->
                        <div class="home-about-us__feature d-flex">
                            <!-- Icon -->
                            <div class="feature__icon">
                                <i class="lni lni-crown"></i>
                            </div>
                            <!-- End icon -->
                            <!-- Content -->
                            <div class="feature__content">
                                <!-- Title -->
                                <h6 class="feature__h6">1 Year Zena & Kazena Brand Warranty</h6>
                                <!-- End title -->
                                <!-- Description -->
                                <div class="feature__description">Zena & Kazena Promise for Exchange and Upgrades.

                                </div>
                                <!-- End Description -->
                            </div>
                            <!-- End content -->
                        </div>
                        <!-- End feature -->



                        <!-- Feature -->
                        <div class="home-about-us__feature d-flex">
                            <!-- Icon -->
                            <div class="feature__icon">
                                <i class="lni lni-spinner-solid"></i>
                            </div>
                            <!-- End icon -->
                            <!-- Content -->
                            <div class="feature__content">
                                <!-- Title -->
                                <h6 class="feature__h6">30 Day Return Policy</h6>
                                <!-- End title -->
                                <!-- Description -->
                                <div class="feature__description">Zena & Kazena Promise for Exchange and Upgrades.

                                </div>
                                <!-- End Description -->
                            </div>
                            <!-- End content -->
                        </div>
                        <!-- End feature -->
                        <!-- Feature -->
                        <div class="home-about-us__feature d-flex">
                            <!-- Icon -->
                            <div class="feature__icon">
                                <i class="lnil lnil-ship"></i>
                            </div>
                            <!-- End icon -->
                            <!-- Content -->
                            <div class="feature__content">
                                <!-- Title -->
                                <h6 class="feature__h6">Free shipping</h6>
                                <!-- End title -->
                                <!-- Description -->
                                <div class="feature__description">Durotan free shipping for all orders over AED 199
                                </div>
                                <!-- End Description -->
                            </div>
                            <!-- End content -->
                        </div>
                        <!-- End feature -->
                        <!-- Feature -->
                        <div class="home-about-us__feature d-flex">
                            <!-- Icon -->
                            <div class="feature__icon">
                                <i class="lnil lnil-money-protection"></i>
                            </div>
                            <!-- End icon -->
                            <!-- Content -->
                            <div class="feature__content">
                                <!-- Title -->
                                <h6 class="feature__h6">Secure payment</h6>
                                <!-- End title -->
                                <!-- Description -->
                                <div class="feature__description">We guarantee 100% secure with online payment on
                                    our site.</div>
                                <!-- End Description -->
                            </div>
                            <!-- End content -->
                        </div>
                        <!-- End feature -->
                    </div>
                    <!-- Safe checkout -->
                    <div class="product__safe-checkout">
                        <img src="assets/images/safe-checkout.jpg" alt="Safe checkout" />
                    </div>
                    <!-- End safe checkout -->
                </div>
                <!-- End product sidebar -->
            </div>
            <!-- End product main -->



            <!-- Product tabs -->
            <div class="product__tabs-2">
                <!-- Mobile tabs -->
                <div class="product__mobile-tabs">
                    <!-- Accordion -->
                    @if (!empty($response['tabs']))
                        @foreach ($response['tabs'] as $tabkeyMob => $tabMob)
                            <div class="accordion @if($tabkeyMob == 0) active @endif js-accordion">
                                <!-- Title -->
                                <div class="accordion__title js-accordion-title">
                                    {{ $tabMob->heading }}
                                </div>
                                <!-- End title -->
                                <!-- Content -->
                                <div class="accordion__content js-accordion-content">
                                    <div class="row">
                                        <div class="col-12 col-lg-12">
                                            {!! $tabMob->content !!}
                                        </div>
                                    </div>
                                </div>
                                <!-- End content -->
                            </div>
                        @endforeach
                    @endif
                    
                    <!-- End accordion -->
                   
                    <!-- Accordion -->
                    <div class="accordion js-accordion">
                        <!-- Title -->
                        <div class="accordion__title js-accordion-title">
                            {{ trans('messages.reviews') }} ({{$response['rating_count']}})
                        </div>
                        <!-- End title -->
                        <!-- Content -->
                        <div class="accordion__content js-accordion-content">
                            <!--<h3 class="review__title">Customer’s Review (2)</h3>-->
                            
                            <!-- End review -->
                            <!-- Review -->
                            <!--<div class="review d-flex">-->
                                <!-- Avatar -->
                            <!--    <div class="review__avatar">-->
                            <!--        <img alt="Image" data-sizes="auto"-->
                            <!--            data-srcset="assets/images/default/avatar_2.jpg 1560w,-->
                            <!--        assets/images/default/avatar_2.jpg 3120w"-->
                            <!--            src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="-->
                            <!--            class="lazyload" />-->
                            <!--    </div>-->
                            <!--    <div class="review__details">-->
                            <!--        <div class="review__title-and-rating d-flex align">-->
                            <!--            <div class="review__title">Awesome product</div>-->
                            <!--            <div class="review__rating">-->
                            <!--                <i class="lnil lnil-star-fill active"></i>-->
                            <!--                <i class="lnil lnil-star-fill active"></i>-->
                            <!--                <i class="lnil lnil-star-fill active"></i>-->
                            <!--                <i class="lnil lnil-star-fill active"></i>-->
                            <!--                <i class="lnil lnil-star-fill active"></i>-->
                            <!--            </div>-->
                            <!--        </div>-->
                            <!--        <div class="review__content">I love it & certainly that i’ll buy it once again.-->
                            <!--            Perfection experience!</div>-->
                            <!--        <div class="review__meta">-->
                            <!--            <span>Alexander Arnold.</span> on 25 April, 2022-->
                            <!--        </div>-->
                            <!--    </div>-->
                            <!--</div>-->
                            <!-- End review -->
                            <h3>Add A Review</h3>
                            <!-- Form -->
                            <form class="review__form">
                                <div class="form__required-fields">Your email address will not be published.
                                    Required fields are marked<span>*</span></div>
                                <div class="form__your-rating d-flex align-items-center">
                                    <div class="your-rating__title">Your rating</div>
                                    <div class="your-rating__content js-rating-content">
                                        <i class="lnil lnil-star-fill js-rating" data-value="1"></i>
                                        <i class="lnil lnil-star-fill js-rating" data-value="2"></i>
                                        <i class="lnil lnil-star-fill js-rating" data-value="3"></i>
                                        <i class="lnil lnil-star-fill js-rating" data-value="4"></i>
                                        <i class="lnil lnil-star-fill js-rating" data-value="5"></i>
                                        <div class="d-none">
                                            <input type="radio" name="rating" class="js-rating-input"
                                                value="1" />
                                            <input type="radio" name="rating" class="js-rating-input"
                                                value="2" />
                                            <input type="radio" name="rating" class="js-rating-input"
                                                value="3" />
                                            <input type="radio" name="rating" class="js-rating-input"
                                                value="4" />
                                            <input type="radio" name="rating" class="js-rating-input"
                                                value="5" />
                                        </div>
                                    </div>
                                </div>
                                <!-- End your rating -->
                                <!-- Form group -->
                                <div class="form-group">
                                    <input type="text" name="subject" class="form-group__input"
                                        placeholder="Give your review a tittle ">
                                </div>
                                <!-- End form group -->
                                <!-- Form group -->
                                <div class="form-group">
                                    <textarea placeholder="Write your review here" class="form-group__textarea" rows="3"></textarea>
                                </div>
                                <!-- End form group -->
                                <!-- Row -->
                                <div class="row">
                                    <div class="col-md-6">
                                        <!-- Form group -->
                                        <div class="form-group">
                                            <input type="text" name="name" class="form-group__input"
                                                placeholder="Full Name">
                                        </div>
                                        <!-- End form group -->
                                    </div>
                                    <div class="col-md-6">
                                        <!-- Form group -->
                                        <div class="form-group">
                                            <input type="email" name="email" class="form-group__input"
                                                placeholder="Your E-mail*">
                                        </div>
                                        <!-- End form group -->
                                    </div>
                                </div>
                                <!-- End row -->
                                <!-- Form checkbox -->
                                <div class="form-checkbox">
                                    <input type="checkbox" id="checkbox1" class="form-checkbox__input" />
                                    <label class="form-checkbox__label" for="checkbox1">Save my name & email in this
                                        browser for next time i comment</label>
                                </div>
                                <!-- End form checkbox -->
                                <!-- Action -->
                                <div class="form__action">
                                    <button type="submit" class="second-button" disabled>Submit review</button>
                                </div>
                                <!-- End action -->
                            </form>
                            <!-- End form -->
                        </div>
                        <!-- End content -->
                    </div>
                    <!-- End accordion -->
                    <!-- Accordion -->
                    {{-- <div class="accordion js-accordion">
                        <!-- Title -->
                        <div class="accordion__title js-accordion-title">
                            Ask a question
                        </div>
                        <!-- End title -->
                        <!-- Content -->
                        <div class="accordion__content js-accordion-content">
                            <!-- Form -->
                            <form class="contact-page__form">
                                <!-- Form group -->
                                <div class="form-group">
                                    <input type="text" name="subject" class="form-group__input"
                                        placeholder="Subject (optional)">
                                </div>
                                <!-- End form group -->
                                <!-- Form group -->
                                <div class="form-group">
                                    <textarea placeholder="Write your question here" class="form-group__textarea" rows="5"></textarea>
                                </div>
                                <!-- End form group -->
                                <!-- Row -->
                                <div class="row">
                                    <div class="col-md-6">
                                        <!-- Form group -->
                                        <div class="form-group">
                                            <input type="text" name="name" class="form-group__input"
                                                placeholder="Full Name">
                                        </div>
                                        <!-- End form group -->
                                    </div>
                                    <div class="col-md-6">
                                        <!-- Form group -->
                                        <div class="form-group">
                                            <input type="email" name="email" class="form-group__input"
                                                placeholder="Your E-mail*">
                                        </div>
                                        <!-- End form group -->
                                    </div>
                                </div>
                                <!-- End row -->
                                <!-- Action -->
                                <div class="form__action">
                                    <button type="submit" class="second-button">Ask a question</button>
                                </div>
                                <!-- End action -->
                            </form>
                            <!-- End form -->
                        </div>
                        <!-- End content -->
                    </div> --}}
                    <!-- End accordion -->
                </div>
                <!-- End mobile tabs -->


                <!-- Desktop tabs -->
                <div class="product__desktop-tabs">
                    <ul class="tabs__nav">
                        @php
                            $tabkeyOut = 0;
                            $tabContent = '';
                        @endphp
                        @if (!empty($response['tabs']))
                            @foreach ($response['tabs'] as $tabkey => $tab)
                                <li>
                                    <a href="#" class="@if($tabkey == 0) active @endif js-tab-link" data-id="{{$tabkey}}">{{ $tab->heading }}</a>
                                </li>
                                
                                @php
                                    $tabkeyOut++;
                                    $tabactive = '';
                                    if($tabkey == 0){
                                        $tabactive = 'tab-content__active tab-content__show';
                                    }

                                    $tabContent .= '<div class="tab-content '.$tabactive.' js-tab-content" data-id="'.$tabkey.'">
                                            <div class="row">
                                                <div class="col-12 col-lg-12">
                                                    
                                                    '.$tab->content.'
                                                </div>
                                            
                                            </div>
                                        </div>';


                                @endphp
                            @endforeach
                        @endif
                       
                        <!--<li>-->
                        <!--    <a href="#" class="js-tab-link" data-id="{{$tabkeyOut}}">{{ trans('messages.reviews') }} ({{$response['rating_count']}})</a>-->
                        <!--</li>-->
                        {{-- <li>
                            <a href="#" class="js-tab-link" data-id="4">Ask a question</a>
                        </li> --}}
                    </ul>
                    <div class="tabs__content">
                        <!-- Description tab -->
                        {!! $tabContent !!}
                        <!-- End description tab -->
                        
                        <!-- Reviews tab -->
                        {{-- <div class="tab-content js-tab-content" data-id="{{$tabkeyOut}}">
                            <div class="row">
                                <div class="col-12 col-lg-6">
                                    <h3 class="review__title">Customer’s Review (2)</h3>
                                    <!-- Review -->
                                    <div class="review d-flex">
                                        <!-- Avatar -->
                                        <div class="review__avatar">
                                            <img alt="Image" data-sizes="auto"
                                                data-srcset="assets/images/default/avatar_1.jpg 1560w,
                                                assets/images/default/avatar_1.jpg 3120w"
                                                src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                                                class="lazyload" />
                                        </div>
                                        <!-- End avatar -->
                                        <!-- Details -->
                                        <div class="review__details">
                                            <!-- Title and rating -->
                                            <div class="review__title-and-rating d-flex">
                                                <!-- Name -->
                                                <div class="review__title">Quality product & very comfortable!</div>
                                                <!-- End name -->
                                                <!-- Rating -->
                                                <div class="review__rating">
                                                    <i class="lnil lnil-star-fill active"></i>
                                                    <i class="lnil lnil-star-fill active"></i>
                                                    <i class="lnil lnil-star-fill active"></i>
                                                    <i class="lnil lnil-star-fill active"></i>
                                                    <i class="lnil lnil-star-fill active"></i>
                                                </div>
                                                <!-- End rating -->
                                            </div>
                                            <!-- End title and rating -->
                                            <!-- Content -->
                                            <div class="review__content">Thanks to the precious advice of the store
                                                owner, I choose this wonderful product. I absolutely love it!
                                                Additionally, my order was sent very quickly. I'm a happy customer
                                                and I'll order again!</div>
                                            <!-- End content -->
                                            <!-- Meta -->
                                            <div class="review__meta">
                                                <span>andy robertson.</span> on 25 April, 2022
                                            </div>
                                            <!-- End meta -->
                                        </div>
                                        <!-- End details -->
                                    </div>
                                    <!-- End review -->
                                    <!-- Review -->
                                    <div class="review d-flex">
                                        <!-- Avatar -->
                                        <div class="review__avatar">
                                            <img alt="Image" data-sizes="auto"
                                                data-srcset="assets/images/default/avatar_2.jpg 1560w,
                                                assets/images/default/avatar_2.jpg 3120w"
                                                src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                                                class="lazyload" />
                                        </div>
                                        <!-- End avatar -->
                                        <!-- Details -->
                                        <div class="review__details">
                                            <!-- Title and rating -->
                                            <div class="review__title-and-rating d-flex align">
                                                <!-- Name -->
                                                <div class="review__title">Awesome product</div>
                                                <!-- End name -->
                                                <!-- Rating -->
                                                <div class="review__rating">
                                                    <i class="lnil lnil-star-fill active"></i>
                                                    <i class="lnil lnil-star-fill active"></i>
                                                    <i class="lnil lnil-star-fill active"></i>
                                                    <i class="lnil lnil-star-fill active"></i>
                                                    <i class="lnil lnil-star-fill active"></i>
                                                </div>
                                                <!-- End rating -->
                                            </div>
                                            <!-- End title and rating -->
                                            <!-- Content -->
                                            <div class="review__content">I love it & certainly that i’ll buy it once
                                                again. Perfection experience!</div>
                                            <!-- End content -->
                                            <!-- Meta -->
                                            <div class="review__meta">
                                                <span>Alexander Arnold.</span> on 25 April, 2022
                                            </div>
                                            <!-- End meta -->
                                        </div>
                                        <!-- End details -->
                                    </div>
                                    <!-- End review -->
                                </div>
                                <!--<div class="col-12 col-lg-6">
                                    <h3>Add A Review</h3>
                                    <form class="review__form">
                                        <div class="form__required-fields">Your email address will not be published.
                                            Required fields are marked<span>*</span></div>
                                        <div class="form__your-rating d-flex align-items-center">
                                            <div class="your-rating__title">Your rating</div>
                                            <div class="your-rating__content js-rating-content">
                                                <i class="lnil lnil-star-fill js-rating" data-value="1"></i>
                                                <i class="lnil lnil-star-fill js-rating" data-value="2"></i>
                                                <i class="lnil lnil-star-fill js-rating" data-value="3"></i>
                                                <i class="lnil lnil-star-fill js-rating" data-value="4"></i>
                                                <i class="lnil lnil-star-fill js-rating" data-value="5"></i>
                                                <div class="d-none">
                                                    <input type="radio" name="rating" class="js-rating-input"
                                                        value="1" />
                                                    <input type="radio" name="rating" class="js-rating-input"
                                                        value="2" />
                                                    <input type="radio" name="rating" class="js-rating-input"
                                                        value="3" />
                                                    <input type="radio" name="rating" class="js-rating-input"
                                                        value="4" />
                                                    <input type="radio" name="rating" class="js-rating-input"
                                                        value="5" />
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" name="subject" class="form-group__input"
                                                placeholder="Give your review a tittle ">
                                        </div>
                                        <div class="form-group">
                                            <textarea placeholder="Write your review here" class="form-group__textarea" rows="3"></textarea>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="text" name="name" class="form-group__input"
                                                        placeholder="Full Name">
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <input type="email" name="email" class="form-group__input"
                                                        placeholder="Your E-mail*">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-checkbox">
                                            <input type="checkbox" id="checkbox1" class="form-checkbox__input" />
                                            <label class="form-checkbox__label" for="checkbox1">Save my name & email
                                                in this browser for next time i comment</label>
                                        </div>
                                        <div class="form__action">
                                            <button type="submit" class="second-button">Submit review</button>
                                        </div>
                                    </form>
                                </div>-->
                            </div>
                        </div> --}}
                        <!-- End reviews tab -->
                        <!-- Ask a question tab -->
                        {{-- <div class="tab-content js-tab-content" data-id="4">
                            <!-- Row -->
                            <div class="row">
                                <div class="col-12 col-lg-6">
                                    <h3>Question guidelines</h3>
                                    <p>Include a title to your question and a more detailed description. The more
                                        unique and informative your question, the better the chance you have of
                                        tutors engaging with you.</p>
                                    <h3>Other tips</h3>
                                    <ul>
                                        <li>Keep your questions short and to the point</li>
                                        <li>Check for grammar or spelling errors</li>
                                        <li>Phrase it like a question</li>
                                    </ul>
                                </div>
                                <div class="col-12 col-lg-6">
                                    <h3>Ask a question</h3>
                                    <!-- Form -->
                                    <form class="contact-page__form">
                                        <!-- Form group -->
                                        <div class="form-group">
                                            <input type="text" name="subject" class="form-group__input"
                                                placeholder="Subject (optional)">
                                        </div>
                                        <!-- End form group -->
                                        <!-- Form group -->
                                        <div class="form-group">
                                            <textarea placeholder="Write your question here" class="form-group__textarea" rows="5"></textarea>
                                        </div>
                                        <!-- End form group -->
                                        <!-- Row -->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <!-- Form group -->
                                                <div class="form-group">
                                                    <input type="text" name="name" class="form-group__input"
                                                        placeholder="Full Name">
                                                </div>
                                                <!-- End form group -->
                                            </div>
                                            <div class="col-md-6">
                                                <!-- Form group -->
                                                <div class="form-group">
                                                    <input type="email" name="email" class="form-group__input"
                                                        placeholder="Your E-mail*">
                                                </div>
                                                <!-- End form group -->
                                            </div>
                                        </div>
                                        <!-- End row -->
                                        <!-- Action -->
                                        <div class="form__action">
                                            <button type="submit" class="second-button">Ask a question</button>
                                        </div>
                                        <!-- End action -->
                                    </form>
                                    <!-- End form -->
                                </div>
                            </div>
                            <!-- End row -->
                        </div> --}}
                        <!-- End ask a question tab -->
                    </div>
                </div>
                <!-- End desktop tabs -->
            </div>
            <!-- End product tabs -->
        </div>
        <!-- End container -->
    </div>
    <!-- End product -->


    @if (!empty($relatedProducts[0]))
        <!-- Related Products -->
        <div class="related-products">
            <!-- Container -->
            <div class="container container--type-2">
                <!-- Title -->
                <h3 class="related-products__title">{{ trans('messages.related').' '.trans('messages.products') }}</h3>
                <!-- End title -->
                <!-- Results -->
                <div class="js-related-products">
                
                        @foreach ($relatedProducts as $relProd)
                            @php
                                
                                $imageRel = $relProd->thumbnail_img;
                                if($imageRel == null){
                                    $imageRel = app('url')->asset('assets/img/placeholder.jpg');
                                }

                                $priceDataRel = getProductOfferPrice($relProd);
                            @endphp
                            <!-- Product -->
                            <div class="result-product">
                                <!-- Image -->
                                <div class="result-product__image">
                                    <a href="{{ route('product-detail',['slug' => $relProd->slug, 'sku' => $relProd->sku]) }}">
                                        <img alt="Image" data-sizes="auto"
                                            data-srcset="{{$imageRel}}"
                                            src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                                            class="lazyload" />
                                    </a>
                                </div>
                                <!-- End image -->
                                <!-- Product name -->
                                <div class="result-product__name"><a href="{{ route('product-detail',['slug' => $relProd->slug, 'sku' => $relProd->sku]) }}">{{ $relProd->getTranslation('name', $lang) }}</a></div>
                                <!-- End product name -->
                                <!-- Product price -->
                                {{-- <div class="result-product__price">$56.99</div> --}}
                                <span class="product-grid-item__price-new">{{ env('DEFAULT_CURRENCY').' '.$priceDataRel['discounted_price'] }}</span>
                                <!-- End price new -->
                                <!-- Price old -->
                                @if ($priceDataRel['discounted_price'] != $priceDataRel['original_price'])
                                    <span class="product-grid-item__price-old">{{ env('DEFAULT_CURRENCY').' '.$priceDataRel['original_price'] }}</span>
                                @endif
                                <!-- End product price -->
                            </div>
                            <!-- End product -->
                        @endforeach
                
                
                
                </div>
                <!-- End results -->
            </div>
            <!-- End container -->
        </div>
        <!-- End related products -->
    @endif
    @if (!empty($recentlyViewedProducts[0]))
        <!-- Recently viewed -->
        <div class="recently-viewed">
            <!-- Container -->
            <div class="container container--type-2">
                <!-- Title -->
                <h3 class="recently-viewed__title">{{ trans('messages.recently_viewed') }}</h3>
                <!-- End title -->
                <!-- Results -->
                <div class="search-popups__results-products d-flex">
                
                        @foreach ($recentlyViewedProducts as $recentProd)
                            <!-- Product -->
                            @php
                                
                                $imageRec = $recentProd->thumbnail_img;
                                if($imageRec == null){
                                    $imageRec = app('url')->asset('assets/img/placeholder.jpg');
                                }

                                $priceDataRec = getProductOfferPrice($recentProd);
                            @endphp
                            <div class="result-product">
                                <!-- Image -->
                                <div class="result-product__image">
                                    <a href="{{ route('product-detail',['slug' => $recentProd->slug, 'sku' => $recentProd->sku]) }}">
                                        <img alt="Image" data-sizes="auto"
                                            data-srcset="{{$imageRec}}"
                                            src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                                            class="lazyload" />
                                    </a>
                                </div>
                                <!-- End image -->
                                <!-- Product name -->
                                <div class="result-product__name"><a href="{{ route('product-detail',['slug' => $recentProd->slug, 'sku' => $recentProd->sku]) }}">{{ $recentProd->getTranslation('name', $lang) }}</a></div>
                                <!-- End product name -->
                                <!-- Product price -->
                                {{-- <div class="result-product__price">$56.99</div> --}}
                                <span class="product-grid-item__price-new">{{ env('DEFAULT_CURRENCY').' '.$priceDataRec['discounted_price'] }}</span>
                                <!-- End price new -->
                                <!-- Price old -->
                                @if ($priceDataRec['discounted_price'] != $priceDataRec['original_price'])
                                    <span class="product-grid-item__price-old">{{ env('DEFAULT_CURRENCY').' '.$priceDataRec['original_price'] }}</span>
                                @endif
                                <!-- End product price -->
                            </div>
                            <!-- End product -->
                        @endforeach
                
                
                
                </div>
                <!-- End results -->




            </div>
            <!-- End container -->
        </div>
    @endif
    <!-- End recently viewed -->



    <!-- Sticky add to cart -->
    {{-- <div class="sticky-add-to-cart js-sticky-add-to-cart">
        <!-- Container -->
        <div class="container container--type-2">
            <!-- D-flex -->
            <div class="sticky-add-to-cart__d-flex d-flex align-items-center">
                <!-- Product image -->
                <div class="sticky-add-to-cart__product-image">
                    <p>
                        <img alt="Image" src="assets/images/products/image2.jpg" />
                    </p>
                </div>
                <!-- End product image -->
                <!-- Product name -->
                <div class="sticky-add-to-cart__product-name">18K Yellow & White Gold Diamond Earrings
                </div>
                <!-- End product name -->
                <!-- Product price -->
                <div class="sticky-add-to-cart__product-price">AED 76579.59</div>
                <!-- End product price -->
                <!-- Product options -->
                <div class="sticky-add-to-cart__product-options d-flex align-items-center">
                    <!-- Color -->
                    <div class="sticky-add-to-cart__color">
                        <p style="background: #af957c"></p><span>Brown</span>
                    </div>
                    <!-- End color -->
                    <!-- Standard option -->
                    <div class="sticky-add-to-cart__standard-option">Choose your size</div>
                    <!-- End standard option -->
                </div>
                <!-- End product options -->
                <!-- Quantity -->
                <div class="sticky-add-to-cart__quantity">
                    <div class="sticky-add-to-cart-quantity__minus js-quantity-down"><a href="#"><i
                                class="lnil lnil-minus"></i></a></div>
                    <input type="text" value="2" class="sticky-add-to-cart-quantity__input js-quantity-field">
                    <div class="sticky-add-to-cart-quantity__plus js-quantity-up"><a href="#"><i
                                class="lnil lnil-plus"></i></a></div>
                </div>
                <!-- End quantity -->
                <!-- Add to cart -->
                <div class="sticky-add-to-cart__add-to-cart">
                    <a href="#" class="second-button">Add to cart</a>
                </div>
                <!-- End add to cart -->
            </div>
            <!-- End d-flex -->
        </div>
        <!-- End container -->
    </div> --}}
    <!-- End sticky add to cart -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
@endsection

@section('header')
<style>
    .attribute-item {
        cursor: pointer;
        padding: 5px 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        margin: 5px;
        display: inline-block;
        transition: all 0.3s;
    }

    .attribute-item.disabled {
        /* color: #ccc; */
        pointer-events: none !important;
        text-decoration: line-through !important;
        /* background-color: #f9f9f9; */
    }
</style>
@endsection

@section('script')
    <script>
    const currentAttribute = @json($response['current_attribute']);
    const productAttributes = @json($response['product_attributes']);
    const variantProducts = @json($response['varient_products']);


    var slug = '{{$response['slug']}}';
    $(document).ready(function () {

        let selectedAttributes = {}; // Tracks selected attributes.
        const firstAttributeId = productAttributes[0].id; // The ID of the first attribute.
        
        // Event handler for selecting an attribute value
        $('.attribute-item').click(function () {
            const attributeId = $(this).closest('.attribute-list').data('attribute-id');
            const valueId = $(this).data('value-id');
            
            // If the first attribute is selected, no need to filter it
            if (attributeId === firstAttributeId) {
                // Always update the first attribute selection
                selectedAttributes[attributeId] = valueId;
                $(this).siblings().removeClass('active');
                $(this).addClass('active');
                
                // Filter the remaining attributes based on this selection
                updateSubsequentAttributes(selectedAttributes);
                return;
            }

            // For other attributes, update selected value and filter
            selectedAttributes[attributeId] = valueId;

            // Mark the clicked value as selected
            $(this).siblings().removeClass('active');
            $(this).addClass('active');

            // Clear selections for attributes that come after the current one
            clearSubsequentAttributes(attributeId);

            // Filter valid combinations based on the selected attributes
            filterAttributes(selectedAttributes);

            // Check if all attributes are selected to display SKU
            if (Object.keys(selectedAttributes).length === productAttributes.length) {
                displaySKU(selectedAttributes);
            } else {
                $('#product-stock').html('<p>Select all attributes to see product details.</p>');
            }
        });

        // Filter the valid values for each attribute based on the selected attributes
        function filterAttributes(selectedAttributes) {
            const validCombinations = getValidCombinations(selectedAttributes);
            let validValues = {};

            validCombinations.forEach(variant => {
                const values = Object.values(variant)[0].map(value => parseInt(value)); // Convert to integers
                values.forEach(value => {
                    const attrId = getAttributeId(value);
                    if (!validValues[attrId]) validValues[attrId] = [];
                    if (!validValues[attrId].includes(value)) validValues[attrId].push(value);
                });
            });

            // Update UI for each attribute list
            $('.attribute-list').each(function () {
                const attrId = $(this).data('attribute-id');
                
                // Skip the first attribute from filtering (it stays always visible)
                if (attrId === firstAttributeId) {
                    $(this).find('.attribute-item').show().removeClass('disabled');
                    return;
                }

                $(this).find('.attribute-item').each(function () {
                    // Skip the item with class "firstItem_0" from getting disabled
                    if ($(this).hasClass('firstItem_0')) {
                        return; // Don't apply disabling logic to this item
                    }

                    const valueId = parseInt($(this).data('value-id')); // Convert to integer
                    if (validValues[attrId]?.includes(valueId)) {
                        $(this).removeClass('disabled').show();
                    } else {
                        $(this).addClass('disabled').hide();
                    }
                });
            });
        }

        // Automatically select valid combinations for subsequent attributes when the first attribute is changed
        function updateSubsequentAttributes(selectedAttributes) {
            const validCombinations = getValidCombinations(selectedAttributes);

            let validValues = {};
            validCombinations.forEach(variant => {
                const values = Object.values(variant)[0].map(value => parseInt(value)); // Convert to integers
                values.forEach(value => {
                    const attrId = getAttributeId(value);
                    if (!validValues[attrId]) validValues[attrId] = [];
                    if (!validValues[attrId].includes(value)) validValues[attrId].push(value);
                });
            });

            // Update the UI for each attribute list
            $('.attribute-list').each(function () {
                const attrId = $(this).data('attribute-id');
                
                // Skip the first attribute from filtering (it stays always visible)
                if (attrId === firstAttributeId) {
                    $(this).find('.attribute-item').show().removeClass('disabled');
                    return;
                }

                $(this).find('.attribute-item').each(function () {
                    const valueId = parseInt($(this).data('value-id')); // Convert to integer
                    if (validValues[attrId]?.includes(valueId)) {
                        $(this).removeClass('disabled').show();
                        // Auto-select the valid values
                        if (!selectedAttributes[attrId]) {
                            selectedAttributes[attrId] = valueId;
                            $(this).addClass('active');
                        }
                    } else {
                        $(this).addClass('disabled').hide();
                    }
                });
            });

            // Check if all attributes are selected to display SKU
            if (Object.keys(selectedAttributes).length === productAttributes.length) {
                displaySKU(selectedAttributes);
            }
        }

        // Get valid combinations based on the selected attributes
        function getValidCombinations(selectedAttributes) {
            console.log("Selected Attributes:", selectedAttributes);
            console.log("Variant Products:", variantProducts);

            return variantProducts.filter(variant => {
                const values = Object.values(variant)[0].map(value => parseInt(value)); // Convert to integers
                return Object.entries(selectedAttributes).every(([attrId, valueId]) => {
                    return values.includes(parseInt(valueId)); // Ensure both are integers
                });
            });
        }

        // Function to clear selections for subsequent attributes
        function clearSubsequentAttributes(attributeId) {
            // Clear selections for attributes following the current attribute
            const attributeIndex = productAttributes.findIndex(attr => attr.id == attributeId);
            productAttributes.slice(attributeIndex + 1).forEach(attr => {
                delete selectedAttributes[attr.id];
                $(`[data-attribute-id="${attr.id}"] .attribute-item`).removeClass('active');
            });
        }

        // Display the correct SKU once all attributes are selected
        function displaySKU(selectedAttributes) {
            const matchingVariant = variantProducts.find(variant => {
                const values = Object.values(variant)[0].map(value => parseInt(value)); // Convert to integers
                return Object.values(selectedAttributes).every(value => values.includes(value));
            });

            if (matchingVariant) {
                const sku = Object.keys(matchingVariant)[0];
                $('#product-stock').html(`<p>SKU: ${sku}</p>`);
                var url = '/product-detail?slug=' + encodeURIComponent(slug) + '&sku=' + encodeURIComponent(sku);

                // Redirect to the URL
                window.location.href = url;
            } else {
                $('#product-stock').html('<p>No matching product found.</p>');
            }
        }

        // Helper function to get the attribute ID based on value ID
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
