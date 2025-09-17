@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title title="Order History" homeLink="/" />

    <div class="!px-10 min-h-[80vh]">
        <x-frontend.account.account-section>
            <x-slot name="orderIdFilter">
                <x-frontend.account.order-id-filter placeholder="Enter your Email ID" onclick="filterOrders()"
                    buttonText="Search" />
            </x-slot>

            <div id="orderResults">
                @if (isset($orderList) && $orderList->count() > 0)
                    @foreach ($orderList as $order)
                        <div class="order-summary border p-4 mb-8 rounded-lg shadow-sm">
                            <h3 class="text-lg font-semibold mb-2">
                                Order ID: {{ $order->code }} - <span
                                    class="font-normal">{{ ucfirst(str_replace('_', ' ', $order->delivery_status)) }}</span>
                            </h3>
                            <p>Placed on: {{ $order->created_at->format('d M Y, H:i') }}</p>
                            <p>Payment Type: {{ ucfirst($order->payment_type) }}</p>
                            <p>Coupon: {{ $order->coupon_code ?? 'None' }}</p>

                            <table class="w-full mt-4 border-collapse border border-gray-300">
                                <thead>
                                    <tr class="bg-gray-100">
                                        <th class="border border-gray-300 p-2 text-left">Product</th>
                                        <th class="border border-gray-300 p-2 text-left">SKU</th>
                                        <th class="border border-gray-300 p-2 text-right">Price</th>
                                        <th class="border border-gray-300 p-2 text-right">Quantity</th>
                                        <th class="border border-gray-300 p-2 text-right">Total</th>
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
                                        <tr>
                                            <td class="border border-gray-300 p-2">{{ $productName }}</td>
                                            <td class="border border-gray-300 p-2">{{ $sku }}</td>
                                            <td class="border border-gray-300 p-2 text-right">{{ env('DEFAULT_CURRENCY') }}
                                                {{ number_format($price, 2) }}</td>
                                            <td class="border border-gray-300 p-2 text-right">{{ $quantity }}</td>
                                            <td class="border border-gray-300 p-2 text-right">{{ env('DEFAULT_CURRENCY') }}
                                                {{ number_format($itemTotal, 2) }}</td>
                                        </tr>
                                    @endforeach
                                </tbody>
                            </table>

                            <div class="mt-4 text-right space-y-1">
                                <p>Subtotal: {{ env('DEFAULT_CURRENCY') }} {{ number_format($subTotal, 2) }}</p>
                                <p>Tax: {{ env('DEFAULT_CURRENCY') }} {{ number_format($order->tax ?? 0, 2) }}</p>
                                <p>Shipping Cost: {{ env('DEFAULT_CURRENCY') }}
                                    {{ number_format($order->shipping_cost ?? 0, 2) }}</p>
                                @if ($order->coupon_code)
                                    <p>Coupon Discount: - {{ env('DEFAULT_CURRENCY') }}
                                        {{ number_format($order->coupon_discount ?? 0, 2) }}</p>
                                @endif
                                <p class="font-semibold">Grand Total: {{ env('DEFAULT_CURRENCY') }}
                                    {{ number_format($order->grand_total, 2) }}</p>
                            </div>
                        </div>
                    @endforeach
                @elseif(isset($email) && $email != '')
                    <div class="text-center py-10">
                        <p>No orders found for email: {{ $email }}</p>
                    </div>
                @else
                    <div class="text-center py-10">
                        <p>Enter your email address above to search for your orders.</p>
                    </div>
                @endif
            </div>
        </x-frontend.account.account-section>
    </div>
@endsection

@section('script')
    <script>
        function filterOrders() {
            var email = document.getElementById('orderIdInput').value;

            if (email.trim() === '') {
                alert('Please enter your email address');
                return;
            }

            var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                alert('Please enter a valid email address');
                return;
            }

            window.location.href = '{{ route('orders.index') }}?email=' + encodeURIComponent(email);
        }

        document.getElementById('orderIdInput').addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                filterOrders();
            }
        });
    </script>
@endsection
