<div class="order-box ">
    <h3>Order Summary</h3>
    <div class="order-info !bg-white rounded-md">
        <div class="title-box">
            <span class="text">Product</span>
            <span class="text">Total</span>
        </div>
        <div class="order-product space-y-6 ">
            @if (!empty($response['products']))
                @foreach ($response['products'] as $prod)
                    <div class="single-item flex items-center justify-between border-b pb-4">
                        <div class="product-box flex items-start space-x-4">
                            <figure class="image-box w-20 flex-shrink-0">
                                <img src="{{ $prod['product']['image'] }}" alt="{{ $prod['product']['name'] }}"
                                    class="w-full h-auto object-cover rounded" />
                            </figure>
                            <div class="flex flex-col">
                                <h6 class="text-lg font-semibold text-gray-900 mb-1">
                                    <a href="{{ route('product-detail', ['slug' => $prod['product']['slug'], 'sku' => $prod['product']['sku']]) }}"
                                        class="hover:underline text-black">
                                        {{ $prod['product']['name'] }}
                                    </a>
                                </h6>

                                @php
                                    $attributeValue = '';
                                    foreach ($prod['product']['attributes'] as $attribute) {
                                        $attributeValue .=
                                            '<strong>' . $attribute['name'] . ':</strong> ' . $attribute['value'] . ' ';
                                    }
                                @endphp

                                @if ($attributeValue != '')
                                    <div class="cart-product__variant text-sm text-gray-600">
                                        {!! $attributeValue !!}
                                    </div>
                                @endif
                            </div>
                        </div>

                        <h4 class="!text-[16px] font-semibold text-gray-900">
                            {{ $prod['quantity'] }} &times; {{ env('DEFAULT_CURRENCY') }} {{ $prod['main_price'] }}
                        </h4>
                    </div>
                @endforeach
            @endif
        </div>


        <ul class="cost-box">
            <li>
                <h4><span class="!text-[16px]">Subtotal</span></h4>
                <h4 class="!text-[16px]">{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['sub_total'] }}</h4>
            </li>
            <li>
                <h4><span class="!text-[16px]">Tax</span></h4>
                <h4 class="!text-[16px]">{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['vat_amount'] }}</h4>
            </li>
            <li>
                <h4><span class="!text-[16px]">Discount</span></h4>
                <h4 class="!text-[16px]">{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['discount'] }}</h4>
            </li>

            @if ($response['summary']['coupon_applied'] == 1)
                <li>
                    <h4><span class="!text-[16px]">Coupon Discount</span></h4>
                    <h4 class="!text-[16px]">{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['coupon_discount'] }}</h4>
                </li>
            @endif

            <li>
                <h4><span class="!text-[16px]">Shipping</span></h4>
                <h4 class="!text-[16px]">{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['shipping'] }}</h4>
            </li>
        </ul>

        <div class="total-box">
            <h4><span class="!text-[16px]">Total</span></h4>
            <h4 class="!text-[16px]">{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['total'] }}</h4>
        </div>

        {{-- <div class="!mb-10">
            <x-frontend.cart.coupon :response="$response" />
        </div> --}}


        {{-- <div class="payment-option">
            <h3>Payment Method</h3>
            <ul class="other-payment !pl-0">
                <li>
                    <div class="check-box mb_12">
                        <input class="check" type="radio" id="payment1" name="payment-method" value="card">
                        <label for="payment1">Credit/Debit Cards or Paypal</label>
                    </div>
                </li>
                <li>
                    <div class="check-box mb_12">
                        <input class="check" type="radio" id="payment3" name="payment-method" value="cod"
                            checked>
                        <label for="payment3">Cash on Delivery</label>
                    </div>
                </li>
            </ul>
        </div> --}}

        <div class="btn-box pt_30">
            <button class="pink-button" type="button" id="submitCheckout">
                {{ trans('messages.place_order') }}
            </button>
        </div>
    </div>
</div>
