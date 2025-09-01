@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title title="Order History" homeLink="/" />

    <div class="!px-10">
        <x-frontend.account.account-section>
            <x-slot name="orderIdFilter">
                <x-frontend.account.order-id-filter placeholder="Enter your Email ID" onclick="filterOrders()"
                    buttonText="Search" />
            </x-slot>

            <div id="orderResults">
                @if (isset($orderList) && count($orderList) > 0)
                    @foreach ($orderList as $order)
                        @if ($order->orderDetails && count($order->orderDetails) > 0)
                            @php
                                $firstItem = $order->orderDetails->first();
                                $product = $firstItem->product;
                            @endphp
                            <x-frontend.account.history-item orderId="{{ $order->code }}"
                                image="{{ $product ? get_product_image($product->thumbnail_img, '100') : 'assets/images/resource/history-1.png' }}"
                                alt="{{ $product->name ?? 'Product' }}"
                                link="{{ $product ? route('product-detail', ['slug' => $product->slug, 'sku' => $firstItem->product_stock->sku]) : '#' }}"
                                productName="{{ $product->name ?? 'Product' }}"
                                price="{{ env('DEFAULT_CURRENCY') }} {{ $order->grand_total }}"
                                status="{{ ucfirst(str_replace('_', ' ', $order->delivery_status)) }}" />
                        @endif
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

    <x-frontend.common.whatsapp-subscribe />
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
