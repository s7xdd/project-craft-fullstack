@extends('frontend.layouts.app')

@section('content')
    @php
        $middleCollections = collect($collectionProducts)->filter(
            fn($collection) => isset($collection['products']) &&
                count($collection['products']) > 0 &&
                isset($collection['page_reference']) &&
                $collection['page_reference'] === 'middle',
        );
    @endphp

    <x-frontend.common.page-title title="Cart" homeLink="/" />

    @if ($response['products'] && !empty($response['products']))
        <x-frontend.cart.cart-section>
            <x-slot name="cartItems">
                <div class="table-outer mb_30">
                    <table class="cart-table">
                        <thead class="cart-header">
                            <tr>
                                <th>product</th>
                                <th>price</th>
                                <th>quantity</th>
                                <th>total</th>
                                <th>&nbsp;</th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($response['products'] as $prod)
                                <x-frontend.cart.cart-item :prod="$prod" />
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </x-slot>

            <x-slot name="cartTotals">
                <x-frontend.cart.cart-totals>
                    <x-slot name="slot">
                        <div class="order-summary__subtotal">
                            <div class="summary-subtotal__title">{{ trans('messages.subtotal') }}</div>
                            <div class="summary-subtotal__price">{{ env('DEFAULT_CURRENCY') }}
                                {{ $response['summary']['sub_total'] }}</div>
                        </div>

                        <div class="order-summary__subtotal">
                            <div class="summary-subtotal__title">{{ trans('messages.tax') }}</div>
                            <div class="summary-subtotal__price">{{ env('DEFAULT_CURRENCY') }}
                                {{ $response['summary']['vat_amount'] }}</div>
                        </div>

                        <div class="order-summary__subtotal">
                            <div class="summary-subtotal__title">{{ trans('messages.discount') }}</div>
                            <div class="summary-subtotal__price">{{ env('DEFAULT_CURRENCY') }}
                                {{ $response['summary']['discount'] }}</div>
                        </div>

                        @if ($response['summary']['coupon_applied'] == 1)
                            <div class="order-summary__subtotal">
                                <div class="summary-subtotal__title">
                                    {{ trans('messages.coupon') . ' ' . trans('messages.discount') }}</div>
                                <div class="summary-subtotal__price">{{ env('DEFAULT_CURRENCY') }}
                                    {{ $response['summary']['coupon_discount'] }}</div>
                            </div>
                        @endif


                        <div class="order-summary__subtotal">
                            <div class="summary-subtotal__title">{{ trans('messages.shipping_charge') }}</div>
                            <div class="summary-subtotal__price">{{ env('DEFAULT_CURRENCY') }}
                                {{ $response['summary']['shipping'] }}</div>
                        </div>

                        <div class="order-summary__total">
                            <div class="summary-total__title">{{ trans('messages.total') }}</div>
                            <div class="summary-total__price">{{ env('DEFAULT_CURRENCY') }}
                                {{ $response['summary']['total'] }}</div>
                        </div>

                    </x-slot>

                    <x-slot name="checkoutButton">
                        <x-frontend.cart.checkout-button link="{{ route('checkout') }}" text="Proceed to Checkout" />
                    </x-slot>

                </x-frontend.cart.cart-totals>
            </x-slot>
        </x-frontend.cart.cart-section>
    @else
        <div class="empty-cart-container" style="text-align: center; padding: 50px 20px;">
            <h2 style="margin-bottom: 20px;">{{ trans('messages.no_products_cart') }}</h2>
            <p style="margin-bottom: 30px; font-size: 18px; color: #666;">Your cart is currently empty. Browse our products
                and add items to your cart.</p>
            <a href="{{ route('products.index') }}" class="theme-btn btn-one"
                style="display: inline-block; padding: 12px 30px; background-color: #000; color: #fff; text-decoration: none; border-radius: 4px; transition: all 0.3s ease; font-weight: 600; border: 2px solid #000;">
                <span>Continue Shopping</span>
            </a>
        </div>
    @endif



    @if ($middleCollections->isNotEmpty())
        @foreach ($middleCollections as $collectionKey => $collection)
            <x-frontend.common.product-section title="{{ $collection['collectiontitle'] }}">
                <div class="p-tab active-tab" id="tab-{{ $loop->index + 1 }}">
                    <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                        @foreach ($collection['products'] as $product)
                            @php
                                $priceData = getProductOfferPrice($product);
                                $productUrl = route('product-detail', [
                                    'slug' => $product->slug,
                                    'sku' => $product->sku,
                                ]);
                            @endphp
                            <x-frontend.common.product-card image="{{ get_product_image($product->thumbnail_img) }}"
                                alt="{{ $product->getTranslation('name', $lang) }}"
                                category="{{ $product->category->getTranslation('name', $lang) ?? 'Product' }}"
                                name="{{ $product->getTranslation('name', $lang) }}"
                                originalPrice=" {{ $priceData['original_price'] }}"
                                price=" {{ $priceData['discounted_price'] }}" link="{!! $productUrl !!}" />
                        @endforeach
                    </div>
                </div>
            </x-frontend.common.product-section>
        @endforeach
    @endif

    <x-frontend.common.whatsapp-subscribe />
@endsection

<style>
    .theme-btn {
        display: inline-block;
        padding: 12px 30px;
        background-color: #000;
        color: #fff;
        text-decoration: none;
        border-radius: 4px;
        transition: all 0.3s ease;
        font-weight: 600;
        border: 2px solid #000;
    }

    .theme-btn:hover {
        background-color: #fff;
        color: #000;
    }
</style>
