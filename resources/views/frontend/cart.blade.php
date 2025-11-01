@extends('frontend.layouts.app')

@section('content')
    <style>
        .swiper-button-next::before,
        .swiper-button-prev::before,
        .swiper-button-next::after,
        .swiper-button-prev::after {
            display: none !important;
            content: none !important;
        }
        .swiper-button-next,
        .swiper-button-prev {
            background-image: none !important;
            font-size: 0 !important;
        }
    </style>
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
                <div class="space-y-4">
                    @foreach ($response['products'] as $prod)
                        <x-frontend.cart.cart-item :prod="$prod" />
                    @endforeach
                </div>
            </x-slot>

            <x-slot name="cartTotals">
                <x-frontend.cart.cart-totals>
                     <x-slot name="slot">
                         <div class="space-y-3">
                             <div class="flex justify-between items-center py-2">
                                 <span class="text-gray-700 font-medium">{{ trans('messages.subtotal') }}</span>
                                 <span class="text-gray-900 font-semibold">{{ env('DEFAULT_CURRENCY') }}
                                     {{ $response['summary']['sub_total'] }}</span>
                             </div>

                             <div class="flex justify-between items-center py-2">
                                 <span class="text-gray-700 font-medium">{{ trans('messages.tax') }}</span>
                                 <span class="text-gray-900 font-semibold">{{ env('DEFAULT_CURRENCY') }}
                                     {{ $response['summary']['vat_amount'] }}</span>
                             </div>

                             <div class="flex justify-between items-center py-2">
                                 <span class="text-gray-700 font-medium">{{ trans('messages.discount') }}</span>
                                 <span class="text-gray-900 font-semibold">{{ env('DEFAULT_CURRENCY') }}
                                     {{ $response['summary']['discount'] }}</span>
                             </div>

                             @if ($response['summary']['coupon_applied'] == 1)
                                 <div class="flex justify-between items-center py-2 text-green-600">
                                     <span class="font-medium">{{ trans('messages.coupon') . ' ' . trans('messages.discount') }}</span>
                                     <span class="font-semibold">-{{ env('DEFAULT_CURRENCY') }}
                                         {{ $response['summary']['coupon_discount'] }}</span>
                                 </div>
                             @endif

                             <div class="flex justify-between items-center py-2">
                                 <span class="text-gray-700 font-medium">{{ trans('messages.shipping_charge') }}</span>
                                 <span class="text-gray-900 font-semibold">{{ env('DEFAULT_CURRENCY') }}
                                     {{ $response['summary']['shipping'] }}</span>
                             </div>

                             <div class="border-t border-gray-300 pt-3 mt-4">
                                 <div class="flex justify-between items-center">
                                     <span class="text-lg font-bold text-gray-900">{{ trans('messages.total') }}</span>
                                     <span class="text-lg font-bold text-gray-900">{{ env('DEFAULT_CURRENCY') }}
                                         {{ $response['summary']['total'] }}</span>
                                 </div>
                             </div>
                         </div>

                         <div class="mt-6">
                             <x-frontend.cart.coupon :response="$response" />
                         </div>

                     </x-slot>

                    <x-slot name="checkoutButton">
                        <x-frontend.cart.checkout-button link="{{ route('checkout') }}" text="Proceed to Checkout" />
                    </x-slot>

                </x-frontend.cart.cart-totals>
            </x-slot>
        </x-frontend.cart.cart-section>
    @else
        <div class="text-center py-16 px-4">
            <h2 class="text-2xl font-bold text-gray-900 mb-4">{{ trans('messages.no_products_cart') }}</h2>
            <p class="text-lg text-gray-600 mb-8">Your cart is currently empty. Browse our products and add items to your cart.</p>
            <a href="{{ route('products.index') }}" class="inline-block bg-black text-white px-8 py-3 rounded-lg font-semibold hover:bg-gray-800 transition-colors border-2 border-black">
                Continue Shopping
            </a>
        </div>
    @endif



    @if ($middleCollections->isNotEmpty())
        <div class="!pb-20 ">
            @foreach ($middleCollections as $collectionKey => $collection)
                <x-frontend.common.product-section title="{{ $collection['collectiontitle'] }}">
                     <div class="p-tab active-tab" id="tab-{{ $loop->index + 1 }}">
                         <div class="swiper cartSwiper w-full max-w-7xl mx-auto">
                             <div class="swiper-wrapper">
                                 @foreach ($collection['products'] as $product)
                                     @php
                                         $priceData = getProductOfferPrice($product);
                                         $productUrl = route('product-detail', [
                                             'slug' => $product->slug,
                                             'sku' => $product->sku,
                                         ]);
                                     @endphp
                                     <div class="swiper-slide">
                                         <x-frontend.common.product-card image="{{ get_product_image($product->thumbnail_img) }}"
                                             alt="{{ $product->getTranslation('name', $lang) }}"
                                             category="{{ $product->category->getTranslation('name', $lang) ?? 'Product' }}"
                                             name="{{ $product->getTranslation('name', $lang) }}"
                                             originalPrice=" {{ $priceData['original_price'] }}"
                                             price=" {{ $priceData['discounted_price'] }}" link="{!! $productUrl !!}" />
                                     </div>
                                 @endforeach
                              </div>
                              <div class="swiper-button-next !bg-white !text-gray-800 !rounded-full !w-12 !h-12 !shadow-lg !flex !items-center !justify-center">
                                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                                  </svg>
                              </div>
                              <div class="swiper-button-prev !bg-white !text-gray-800 !rounded-full !w-12 !h-12 !shadow-lg !flex !items-center !justify-center">
                                  <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                      <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                                  </svg>
                              </div>
                          </div>
                      </div>
                 </x-frontend.common.product-section>
             @endforeach
         </div>
      @endif

     <div class="h-[100px] w-full "></div>

@section('script')
     <script>
         // Initialize Swiper for Cart Carousel
         document.addEventListener('DOMContentLoaded', function () {
             new Swiper('.cartSwiper', {
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
     </script>
@endsection

 @endsection


