@extends('frontend.layouts.app')

@section('content')
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 my-5 h-screen">
        <div class="flex justify-center">
            <div class="w-full max-w-4xl">
                <div class="bg-white rounded-lg shadow-md">
                    <div class="border-b border-gray-200 px-6 py-4 text-center">
                        <h3 class="text-2xl font-semibold">Order Successful!</h3>
                    </div>
                    <div class="p-6 text-center">
                        <div class="mb-4">
                            <i class="fas fa-check-circle text-green-500 text-6xl"></i>
                        </div>
                        <h4 class="text-xl font-semibold mb-2">Thank you for your order!</h4>
                        <p class="text-lg text-gray-600 mb-4">Your order has been placed successfully.</p>
                        <p class="mb-2">Order ID: <strong class="text-gray-900">{{ $order->code }}</strong></p>
                        <p class="mb-4">Order Total: <strong class="text-gray-900">₹{{ number_format($order->grand_total, 2) }}</strong></p>

                        <div class="mt-4 flex justify-center space-x-4">
                            <a href="{{ route('orders.index') }}" class="bg-blue-500 text-white px-6 py-2 rounded-md font-medium hover:bg-blue-600 transition-colors">Track Order</a>
                            <a href="{{ route('home') }}" class="bg-gray-500 text-white px-6 py-2 rounded-md font-medium hover:bg-gray-600 transition-colors">Continue Shopping</a>
                        </div>
                    </div>
                </div>

                <div class="bg-white rounded-lg shadow-md mt-6">
                    <div class="border-b border-gray-200 px-6 py-4">
                        <h4 class="text-xl font-semibold">Order Summary</h4>
                    </div>
                    <div class="p-6">
                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                            <div>
                                <h5 class="text-lg font-medium mb-2">Billing Address</h5>
                                @php
                                    $billingAddress = json_decode($order->billing_address, true);
                                @endphp
                                <p class="text-gray-700">
                                    {{ $billingAddress['name'] ?? '' }}<br>
                                    {{ $billingAddress['address'] ?? '' }}<br>
                                    {{ $billingAddress['city'] ?? '' }} - {{ $billingAddress['zipcode'] ?? '' }}<br>
                                    Phone: {{ $billingAddress['phone'] ?? '' }}<br>
                                    Email: {{ $billingAddress['email'] ?? '' }}
                                </p>
                            </div>
                            <div>
                                <h5 class="text-lg font-medium mb-2">Shipping Address</h5>
                                @php
                                    $shippingAddress = json_decode($order->shipping_address, true);
                                @endphp
                                <p class="text-gray-700">
                                    {{ $shippingAddress['name'] ?? '' }}<br>
                                    {{ $shippingAddress['address'] ?? '' }}<br>
                                    {{ $shippingAddress['city'] ?? '' }} - {{ $shippingAddress['zipcode'] ?? '' }}<br>
                                    Phone: {{ $shippingAddress['phone'] ?? '' }}<br>
                                    Email: {{ $shippingAddress['email'] ?? '' }}
                                </p>
                            </div>
                        </div>

                        <h5 class="text-lg font-medium mt-6 mb-4">Order Items</h5>
                        <div class="overflow-x-auto">
                            <table class="w-full border border-gray-300">
                                <thead class="bg-gray-50">
                                    <tr>
                                        <th class="border border-gray-300 px-4 py-2 text-left font-medium text-gray-700">Product</th>
                                        <th class="border border-gray-300 px-4 py-2 text-left font-medium text-gray-700">SKU</th>
                                        <th class="border border-gray-300 px-4 py-2 text-left font-medium text-gray-700">Price</th>
                                        <th class="border border-gray-300 px-4 py-2 text-left font-medium text-gray-700">Quantity</th>
                                        <th class="border border-gray-300 px-4 py-2 text-left font-medium text-gray-700">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php
                                        $subTotal = 0;
                                    @endphp
                                    @foreach ($order->orderDetails as $item)
                                        @php
                                            $productName = $item->product ? $item->product->name : 'Product';
                                            $sku = $item->product_stock ? $item->product_stock->sku : 'N/A';
                                            $price = $item->offer_price ?? ($item->price ?? 0);
                                            $quantity = $item->quantity ?? 0;
                                            $itemTotal = $price * $quantity;
                                            $subTotal += $itemTotal;
                                        @endphp
                                        <tr class="hover:bg-gray-50">
                                            <td class="border border-gray-300 px-4 py-2">{{ $productName }}</td>
                                            <td class="border border-gray-300 px-4 py-2">{{ $sku }}</td>
                                            <td class="border border-gray-300 px-4 py-2">₹{{ number_format($price, 2) }}</td>
                                            <td class="border border-gray-300 px-4 py-2">{{ $quantity }}</td>
                                            <td class="border border-gray-300 px-4 py-2">₹{{ number_format($itemTotal, 2) }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mt-6">
                            <div>
                                <h5 class="text-lg font-medium mb-2">Order Notes</h5>
                                <p class="text-gray-700">{{ $order->order_notes ?? 'N/A' }}</p>
                            </div>
                            <div class="md:text-right">
                                <div class="inline-block md:ml-auto">
                                    <table class="w-full max-w-xs border border-gray-300 text-sm">
                                        <tbody>
                                            <tr>
                                                <td class="border border-gray-300 px-3 py-1 font-medium">Subtotal:</td>
                                                <td class="border border-gray-300 px-3 py-1">₹{{ number_format($subTotal, 2) }}</td>
                                            </tr>
                                            <tr>
                                                <td class="border border-gray-300 px-3 py-1 font-medium">Tax:</td>
                                                <td class="border border-gray-300 px-3 py-1">₹{{ number_format($order->tax ?? 0, 2) }}</td>
                                            </tr>
                                            <tr>
                                                <td class="border border-gray-300 px-3 py-1 font-medium">Shipping Cost:</td>
                                                <td class="border border-gray-300 px-3 py-1">₹{{ number_format($order->shipping_cost ?? 0, 2) }}</td>
                                            </tr>
                                            @if ($order->coupon_code)
                                                <tr>
                                                    <td class="border border-gray-300 px-3 py-1 font-medium">Coupon ({{ $order->coupon_code }}):</td>
                                                    <td class="border border-gray-300 px-3 py-1">- ₹{{ number_format($order->coupon_discount ?? 0, 2) }}</td>
                                                </tr>
                                            @endif
                                            <tr class="bg-gray-50">
                                                <td class="border border-gray-300 px-3 py-1 font-bold">Grand Total:</td>
                                                <td class="border border-gray-300 px-3 py-1 font-bold">₹{{ number_format($order->grand_total, 2) }}</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
