@extends('frontend.layouts.app')

@section('content')
    <div class="container my-5 h-[100vh]">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Order Successful!</h3>
                    </div>
                    <div class="card-body text-center">
                        <div class="mb-4">
                            <i class="fas fa-check-circle text-success" style="font-size: 4rem;"></i>
                        </div>
                        <h4>Thank you for your order!</h4>
                        <p class="lead">Your order has been placed successfully.</p>
                        <p>Order ID: <strong>{{ $order->code }}</strong></p>
                        <p>Order Total: <strong>₹{{ number_format($order->grand_total, 2) }}</strong></p>

                        <div class="mt-4">
                            <a href="{{ route('orders.index') }}" class="btn btn-primary">Track Order</a>
                            <a href="{{ route('home') }}" class="btn btn-secondary">Continue Shopping</a>
                        </div>
                    </div>
                </div>
                
                <div class="card mt-4">
                    <div class="card-header">
                        <h4>Order Summary</h4>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <h5>Billing Address</h5>
                                @php
                                    $billingAddress = json_decode($order->billing_address, true);
                                @endphp
                                <p>
                                    {{ $billingAddress['name'] ?? '' }}<br>
                                    {{ $billingAddress['address'] ?? '' }}<br>
                                    {{ $billingAddress['city'] ?? '' }} - {{ $billingAddress['zipcode'] ?? '' }}<br>
                                    Phone: {{ $billingAddress['phone'] ?? '' }}<br>
                                    Email: {{ $billingAddress['email'] ?? '' }}
                                </p>
                            </div>
                            <div class="col-md-6">
                                <h5>Shipping Address</h5>
                                @php
                                    $shippingAddress = json_decode($order->shipping_address, true);
                                @endphp
                                <p>
                                    {{ $shippingAddress['name'] ?? '' }}<br>
                                    {{ $shippingAddress['address'] ?? '' }}<br>
                                    {{ $shippingAddress['city'] ?? '' }} - {{ $shippingAddress['zipcode'] ?? '' }}<br>
                                    Phone: {{ $shippingAddress['phone'] ?? '' }}<br>
                                    Email: {{ $shippingAddress['email'] ?? '' }}
                                </p>
                            </div>
                        </div>
                        
                        <h5 class="mt-4">Order Items</h5>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>SKU</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
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
                                        <td>{{ $productName }}</td>
                                        <td>{{ $sku }}</td>
                                        <td>₹{{ number_format($price, 2) }}</td>
                                        <td>{{ $quantity }}</td>
                                        <td>₹{{ number_format($itemTotal, 2) }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        
                        <div class="row mt-4">
                            <div class="col-md-6">
                                <h5>Order Notes</h5>
                                <p>{{ $order->order_notes ?? 'N/A' }}</p>
                            </div>
                            <div class="col-md-6 text-right">
                                <table class="table table-sm" style="max-width: 300px; margin-left: auto;">
                                    <tr>
                                        <td><strong>Subtotal:</strong></td>
                                        <td>₹{{ number_format($subTotal, 2) }}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Tax:</strong></td>
                                        <td>₹{{ number_format($order->tax ?? 0, 2) }}</td>
                                    </tr>
                                    <tr>
                                        <td><strong>Shipping Cost:</strong></td>
                                        <td>₹{{ number_format($order->shipping_cost ?? 0, 2) }}</td>
                                    </tr>
                                    @if ($order->coupon_code)
                                        <tr>
                                            <td><strong>Coupon ({{ $order->coupon_code }}):</strong></td>
                                            <td>- ₹{{ number_format($order->coupon_discount ?? 0, 2) }}</td>
                                        </tr>
                                    @endif
                                    <tr>
                                        <td><strong>Grand Total:</strong></td>
                                        <td>₹{{ number_format($order->grand_total, 2) }}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
