<div class="order-box">
    <h3>Order Summary</h3>
    <div class="order-info">
        <div class="title-box">
            <span class="text">Product</span>
            <span class="text">Total</span>
        </div>
        <div class="order-product">
            @if (!empty($response['products']))
                @foreach ($response['products'] as $prod)
                    <div class="single-item">
                        <div class="product-box">
                            <figure class="image-box">
                                <img src="{{ $prod['product']['image'] }}" alt="{{ $prod['product']['name'] }}">
                            </figure>
                            <h6><a
                                    href="{{ route('product-detail', ['slug' => $prod['product']['slug'], 'sku' => $prod['product']['sku']]) }}">{{ $prod['product']['name'] }}</a>
                            </h6>

                            @php
                                $attributeValue = '';
                            @endphp
                            @foreach ($prod['product']['attributes'] as $attribute)
                                @php
                                    $attributeValue .=
                                        ' <strong>' . $attribute['name'] . ':</strong> ' . $attribute['value'];
                                @endphp
                            @endforeach
                            @if ($attributeValue != '')
                                <div class="cart-product__variant">{!! $attributeValue !!}</div>
                            @endif
                        </div>
                        <h4>{{ $prod['quantity'] }} x {{ env('DEFAULT_CURRENCY') }} {{ $prod['total'] }}</h4>
                    </div>
                @endforeach
            @endif
        </div>

        <ul class="cost-box">
            <li>
                <h4><span>Subtotal</span></h4>
                <h4>{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['sub_total'] }}</h4>
            </li>
            <li>
                <h4><span>Tax</span></h4>
                <h4>{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['vat_amount'] }}</h4>
            </li>
            <li>
                <h4><span>Discount</span></h4>
                <h4>{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['discount'] }}</h4>
            </li>

            @if ($response['summary']['coupon_applied'] == 1)
                <li>
                    <h4><span>Coupon Discount</span></h4>
                    <h4>{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['coupon_discount'] }}</h4>
                </li>
            @endif

            <li>
                <h4><span>Shipping</span></h4>
                <h4>{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['shipping'] }}</h4>
            </li>
        </ul>

        <div class="total-box">
            <h4><span>Total</span></h4>
            <h4>{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['total'] }}</h4>
        </div>

        <div class="!mb-10">
            <x-frontend.cart.coupon :response="$response" />
        </div>


        <div class="payment-option">
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
        </div>

        <div class="privacy-policy-text">
            {{ trans('messages.checkout_msg') }} <a href="#">{{ trans('messages.privacy_policy') }}</a>.
        </div>

        <div class="btn-box pt_30">
            <button class="pink-button" type="button" id="submitCheckout">
                {{ trans('messages.place_order') }}
            </button>
        </div>
    </div>
</div>
