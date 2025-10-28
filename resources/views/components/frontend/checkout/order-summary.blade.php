<div class="bg-white rounded-lg shadow-md p-6">
    <h3 class="text-2xl font-semibold mb-6">Order Summary</h3>
    <div>
        <div class="flex justify-between items-center border-b pb-2 mb-4">
            <span class="font-medium text-gray-700">Product</span>
            <span class="font-medium text-gray-700">Total</span>
        </div>
        <div class="space-y-4">
            @if (!empty($response['products']))
                @foreach ($response['products'] as $prod)
                    <div class="flex items-center justify-between border-b border-gray-200 pb-4 mb-4 last:border-b-0 last:pb-0 last:mb-0">
                        <div class="flex items-start space-x-4 flex-1">
                            <figure class="w-16 h-16 flex-shrink-0">
                                <img src="{{ $prod['product']['image'] }}" alt="{{ $prod['product']['name'] }}"
                                    class="w-full h-full object-cover rounded-md" />
                            </figure>
                            <div class="flex flex-col min-w-0 flex-1">
                                <h6 class="text-base font-semibold text-gray-900 mb-1 truncate">
                                    <a href="{{ route('product-detail', ['slug' => $prod['product']['slug'], 'sku' => $prod['product']['sku']]) }}"
                                        class="hover:text-blue-600 transition-colors">
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
                                    <div class="text-sm text-gray-600">
                                        {!! $attributeValue !!}
                                    </div>
                                @endif
                            </div>
                        </div>

                        <div class="text-sm font-semibold text-gray-900 ml-4">
                            {{ $prod['quantity'] }} &times; {{ env('DEFAULT_CURRENCY') }} {{ $prod['main_price'] }}
                        </div>
                    </div>
                @endforeach
            @endif
        </div>


        <div class="space-y-2 mb-4">
            <div class="flex justify-between items-center">
                <span class="text-sm font-medium text-gray-700">Subtotal</span>
                <span class="text-sm font-semibold text-gray-900">{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['sub_total'] }}</span>
            </div>
            <div class="flex justify-between items-center">
                <span class="text-sm font-medium text-gray-700">Tax</span>
                <span class="text-sm font-semibold text-gray-900">{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['vat_amount'] }}</span>
            </div>
            <div class="flex justify-between items-center">
                <span class="text-sm font-medium text-gray-700">Discount</span>
                <span class="text-sm font-semibold text-gray-900">{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['discount'] }}</span>
            </div>

            @if ($response['summary']['coupon_applied'] == 1)
                <div class="flex justify-between items-center text-green-600">
                    <span class="text-sm font-medium">Coupon Discount</span>
                    <span class="text-sm font-semibold">-{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['coupon_discount'] }}</span>
                </div>
            @endif

            <div class="flex justify-between items-center">
                <span class="text-sm font-medium text-gray-700">Shipping</span>
                <span class="text-sm font-semibold text-gray-900">{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['shipping'] }}</span>
            </div>
        </div>

        <div class="border-t border-gray-300 pt-4">
            <div class="flex justify-between items-center">
                <span class="text-lg font-bold text-gray-900">Total</span>
                <span class="text-lg font-bold text-gray-900">{{ env('DEFAULT_CURRENCY') }} {{ $response['summary']['total'] }}</span>
            </div>
        </div>

        {{-- <div class="payment-option">
            <h3>Payment Methods</h3>
            <ul class="other-payment !pl-0">
                <li>
                    <div class="check-box mb_12">
                        <input class="check" type="radio" id="payment1" name="payment_method" value="card">
                        <label for="payment1">Credit/Debit Cards</label>
                    </div>
                </li>
                <li>
                    <div class="check-box mb_12">
                        <input class="check" type="radio" id="payment3" name="payment_method" value="cod"
                            checked>
                        <label for="payment3">Cash on Delivery</label>
                    </div>
                </li>
            </ul>
        </div> --}}

        <div class="pt-8">
            <button class="w-full bg-pink-500 text-white py-3 px-6 rounded-md font-semibold hover:bg-pink-600 transition-colors" type="button" id="submitCheckout">
                {{ trans('messages.place_order') }}
            </button>
        </div>
    </div>
</div>
