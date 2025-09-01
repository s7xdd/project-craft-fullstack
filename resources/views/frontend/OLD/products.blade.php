@extends('frontend.layouts.app')
@section('content')
    <div class="shop-breadcrumb">
        <div class="container container--type-2">

            @if ($categoryData != null)
                {{ Breadcrumbs::render('category', $categoryData) }}
            @else
                {{ Breadcrumbs::render('home') }}
            @endif

        </div>
    </div>
    <div class="shop-list-area">
        <div class="container container--type-2">
            <div class="collection__top-filter clearfix">
                <div class="collection__founded-products collection__founded-products--type-2">
                    @if ($categoryData != null)
                        <h1 class="shop-list-name">{{ $categoryData->getTranslation('name', $lang) }}</h1>
                    @else
                        <h1 class="shop-list-name">{{ trans('messages.shop') }}</h1>
                    @endif

                </div>

                <div class="collection__sort-and-view d-flex align-items-center">
                    <div class="products-sort-by d-flex align-items-center">
                        <label for="sort-by">{{ trans('messages.sort_by') }}</label>
                        <div class="products-sort-by__select">
                            <i class="lnil lnil-chevron-down"></i>
                            <select id="sort-by">
                                <option value="name_asc" @if ($sort_by == 'name_asc') selected @endif>
                                    {{ trans('messages.a_z') }}</option>
                                <option value="name_desc" @if ($sort_by == 'name_desc') selected @endif>
                                    {{ trans('messages.z_a') }}</option>
                                <option value="latest" @if ($sort_by == 'latest') selected @endif>
                                    {{ trans('messages.latest') }}</option>
                                <option value="oldest" @if ($sort_by == 'oldest') selected @endif>
                                    {{ trans('messages.oldest') }}</option>
                                <option value="price_low" @if ($sort_by == 'price_low') selected @endif>
                                    {{ trans('messages.price_low_high') }}</option>
                                <option value="price_high" @if ($sort_by == 'price_high') selected @endif>
                                    {{ trans('messages.price_high_low') }}</option>
                            </select>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div class="collection our-products minimal-our-products">
        <div class="container container--type-2">
            <div class="open-mobile-top-filter js-open-mobile-filter">
                <i class="lnil lnil-control-panel"></i>
                <span>{{ trans('messages.show_filters') }}</span>
            </div>
            <div class="row">
                <div class="col-12 col-lg-3">
                    <div class="top-filter top-filter--left-column js-top-filter">
                        <div class="top-filter__close-background js-close-filter"></div>
                        <div class="top-filter__background">
                            <div class="top-filter__clo">
                                <a href="{{ route('products.index') }}"><i class="lnil lnil-close"></i>
                                    {{ trans('messages.clear_filter') }}</a>
                            </div>
                            <form action="" id="productfilters" method="GET">
                                <div class="row">
                                    <input type="hidden" name="sort_by" id="sort_by" value="{{ $sort_by }}">
                                    <input type="hidden" name="category" value="{{ $category }}">
                                    <div class="col-12 col-md-6 col-lg-25">
                                        <div class="top-filter__widget">
                                            <h2 class="widget__title">{{ trans('messages.category') }}</h2>
                                            @if (!empty($categories))
                                                <ul class="widget__collections">
                                                    @foreach ($categories as $cat)
                                                        <li><a class="@if ($category == $cat->getTranslation('slug', $lang)) active-category @endif"
                                                                href="{{ route('products.index', ['category' => $cat->getTranslation('slug', $lang)]) }}">{{ $cat->getTranslation('name', $lang) }}</a>
                                                        </li>
                                                    @endforeach

                                                </ul>
                                            @endif

                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 col-lg-25">
                                        <div class="top-filter__widget">
                                            <h2 class="widget__title">{{ trans('messages.brands') }}</h2>
                                            <ul class="widget__checkbox-options">
                                                @if (!empty($brands))
                                                    @foreach ($brands as $brnd)
                                                        <li>
                                                            <label>
                                                                <input type="checkbox" name="brand[]"
                                                                    @if (!empty($brand)) {{ in_array($brnd->getTranslation('slug', $lang), $brand) ? 'checked' : '' }} @endif
                                                                    value="{{ $brnd->getTranslation('slug', $lang) }}" />
                                                                <span>{{ $brnd->getTranslation('name', $lang) }}</span>
                                                            </label>
                                                        </li>
                                                    @endforeach
                                                @endif
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 col-lg-25">
                                        <div class="top-filter__widget">
                                            <h2 class="widget__title">{{ trans('messages.occasions') }}</h2>
                                            <ul class="widget__checkbox-options">
                                                @if (!empty($occasions))
                                                    @foreach ($occasions as $occ)
                                                        <li>
                                                            <label>
                                                                <input type="checkbox" name="occasion[]"
                                                                    value="{{ $occ->getTranslation('slug', $lang) }}"
                                                                    @if (!empty($occasion)) {{ in_array($occ->getTranslation('slug', $lang), $occasion) ? 'checked' : '' }} @endif>
                                                                <span>{{ $occ->getTranslation('name', $lang) }}</span>
                                                            </label>
                                                        </li>
                                                    @endforeach
                                                @endif
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-6 col-lg-25">
                                        <div class="top-filter__widget">
                                            <h2 class="widget__title">{{ trans('messages.price') }}</h2>
                                            <div class="widget__price-slider">
                                                <div class="js-price-slider"></div>
                                                <div class="price-slider__value">
                                                    <span>{{ trans('messages.from') }}</span>
                                                    <input type="text" class="js-price-slider-value" name="price"
                                                        value="{{ $price }}" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-lg-9">
                    <div class="row">

                        @if (!empty($products))
                            @foreach ($products as $prod)
                                @php
                                    $priceData = getProductOfferPrice($prod);
                                @endphp

                                <div class="col-6 col-md-4 col-xl-3">
                                    <div class="product-grid-item product-grid-item--type-2 product-grid-item--type-5">
                                        @if ($priceData['offer_tag'] != '')
                                            <div class="product-grid-item__tag">{{ $priceData['offer_tag'] }}</div>
                                        @endif

                                        @php
                                            $wishlisted = productWishlisted($prod->sku, $prod->slug);
                                        @endphp

                                        <div class="product-grid-item__wishlist-right-0 wishlist-btn"
                                            data-product-slug="{{ $prod->slug }}"
                                            data-product-sku="{{ $prod->sku }}"><i
                                                class="lnr lnr-heart {{ $wishlisted != 0 ? 'active' : '' }}"></i></div>
                                        <div class="product-grid-item__images product-grid-item__images--ratio-100-122 js-product-grid-images"
                                            data-current-image="0">
                                            <div class="product-grid-item__images-arrows">
                                                <div
                                                    class="product-grid-item__previous-image js-product-grid-previous-image">
                                                    <i class="lnr lnr-chevron-left"></i>
                                                </div>
                                                <div class="product-grid-item__next-image js-product-grid-next-image"><i
                                                        class="lnr lnr-chevron-right"></i></div>
                                            </div>

                                            @php
                                                $images = explode(',', $prod->photos);
                                                if ($prod->thumbnail_img != null) {
                                                    array_unshift($images, $prod->thumbnail_img);
                                                }
                                            @endphp

                                            @if (!empty($images))
                                                @foreach ($images as $imgkey => $img)
                                                    <div
                                                        class="product-grid-item__image js-product-grid-image @if ($imgkey == 0) active @endif">
                                                        <a
                                                            href="{{ route('product-detail', ['slug' => $prod->slug, 'sku' => $prod->sku]) }}">
                                                            <img alt="Image" data-sizes="auto"
                                                                data-srcset="{{ get_product_image($img, '300') }}"
                                                                src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                                                                class="lazyload" />
                                                        </a>
                                                    </div>
                                                @endforeach
                                            @endif
                                            <div class="product-grid-item__quick-shop">
                                                <a href="#" class="add-to-cart-btn"
                                                    data-product-slug="{{ $prod->slug }}"
                                                    data-product-sku="{{ $prod->sku }}">{{ trans('messages.add_to_cart') }}</a>
                                            </div>
                                        </div>
                                        <div class="product-grid-item__feature">
                                            {{ $prod->brand->getTranslation('name', $lang) }}</div>
                                        <div class="product-grid-item__name">
                                            <a
                                                href="{{ route('product-detail', ['slug' => $prod->slug, 'sku' => $prod->sku]) }}">{{ $prod->getTranslation('name', $lang) }}</a>
                                        </div>
                                        <div class="product__reviews" bis_skin_checked="1">
                                            <i class="lnr lnr-star lnir active"></i>
                                            <i class="lnr lnr-star lnir active"></i>
                                            <i class="lnr lnr-star lnir active"></i>
                                            <i class="lnr lnr-star lnir active"></i>
                                            <i class="lnr lnr-star lnir"></i>
                                            <span>3 reviews</span>
                                        </div>
                                        <div class="product-grid-item__price">
                                            <span
                                                class="product-grid-item__price-new">{{ env('DEFAULT_CURRENCY') . ' ' . $priceData['discounted_price'] }}</span>
                                            @if ($priceData['discounted_price'] != $priceData['original_price'])
                                                <span
                                                    class="product-grid-item__price-old">{{ env('DEFAULT_CURRENCY') . ' ' . $priceData['original_price'] }}</span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        @endif

                        <div class="loading-spin text-center">

                            <div class="standard-pagination">
                                {{ $products->appends(request()->input())->links('pagination::bootstrap-4') }}
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    @endsection

    @section('script')
        <script>
            const filterForm = document.getElementById('productfilters');
            document.addEventListener('DOMContentLoaded', function() {

                filterForm.addEventListener('change', function() {
                    filterForm.submit();
                });


                $(".js-price-slider-value").val('{{ $price }}');
            });

            $(".js-price-slider").on("slidechange", function(event, ui) {
                filterForm.submit();
            });


            $('#sort-by').on('change', function() {
                var sort = $(this).val();
                $('#sort_by').val(sort);
                $('#productfilters').submit();
            });
        </script>
    @endsection
