<!DOCTYPE html>
<html>

<head>
    <title>Order Invoice - {{ $order->code }}</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f5f5f5;
        }
        
        .container {
            max-width: 800px;
            margin: 20px auto;
            background: #ffffff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        
        .header {
            background-color: #2d3748;
            color: white;
            padding: 20px;
            text-align: center;
        }
        
        .content {
            padding: 30px;
        }
        
        .section {
            margin-bottom: 30px;
        }
        
        .section-title {
            font-size: 18px;
            font-weight: bold;
            color: #2d3748;
            margin-bottom: 15px;
            border-bottom: 2px solid #e2e8f0;
            padding-bottom: 8px;
        }
        
        .info-row {
            margin-bottom: 10px;
            display: flex;
        }
        
        .info-label {
            font-weight: bold;
            width: 150px;
            color: #4a5568;
        }
        
        .info-value {
            flex: 1;
            color: #2d3748;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }
        
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #e2e8f0;
        }
        
        th {
            background-color: #edf2f7;
            font-weight: bold;
            color: #4a5568;
        }
        
        .text-right {
            text-align: right;
        }
        
        .summary-row {
            display: flex;
            justify-content: flex-end;
            margin-top: 10px;
        }
        
        .summary-table {
            width: 300px;
        }
        
        .total-row {
            background-color: #edf2f7;
            font-weight: bold;
        }
        
        .footer {
            background-color: #edf2f7;
            padding: 20px;
            text-align: center;
            color: #4a5568;
            font-size: 14px;
        }
        
        .btn {
            display: inline-block;
            padding: 12px 24px;
            background-color: #3182ce;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            margin-top: 20px;
        }
        
        .btn:hover {
            background-color: #2c5282;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="header">
            <h1>Order Confirmation</h1>
            <p>Thank you for your order!</p>
        </div>
        
        <div class="content">
            <div class="section">
                <h2 class="section-title">Order Details</h2>
                <div class="info-row">
                    <div class="info-label">Order ID:</div>
                    <div class="info-value">{{ $order->code }}</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Order Date:</div>
                    <div class="info-value">{{ date('d M Y, h:i A', $order->date) }}</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Payment Method:</div>
                    <div class="info-value">{{ ucfirst(str_replace('_', ' ', $order->payment_type)) }}</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Order Status:</div>
                    <div class="info-value">{{ ucfirst(str_replace('_', ' ', $order->delivery_status)) }}</div>
                </div>
            </div>
            
            <div class="section">
                <h2 class="section-title">Customer Information</h2>
                <div class="info-row">
                    <div class="info-label">Name:</div>
                    <div class="info-value">{{ json_decode($order->billing_address)->name ?? '' }}</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Email:</div>
                    <div class="info-value">{{ json_decode($order->billing_address)->email ?? '' }}</div>
                </div>
                <div class="info-row">
                    <div class="info-label">Phone:</div>
                    <div class="info-value">{{ json_decode($order->billing_address)->phone ?? '' }}</div>
                </div>
            </div>
            
            <div class="section">
                <h2 class="section-title">Addresses</h2>
                <div style="display: flex; gap: 30px;">
                    <div style="flex: 1;">
                        <h3 style="margin-top: 0; color: #4a5568;">Billing Address</h3>
                        @php 
                            $billingAddress = json_decode($order->billing_address);
                        @endphp
                        <p>
                            {{ $billingAddress->name ?? '' }}<br>
                            {{ $billingAddress->address ?? '' }}<br>
                            {{ $billingAddress->city ?? '' }} - {{ $billingAddress->zipcode ?? '' }}<br>
                        </p>
                    </div>
                    <div style="flex: 1;">
                        <h3 style="margin-top: 0; color: #4a5568;">Shipping Address</h3>
                        @php 
                            $shippingAddress = json_decode($order->shipping_address);
                        @endphp
                        <p>
                            {{ $shippingAddress->name ?? '' }}<br>
                            {{ $shippingAddress->address ?? '' }}<br>
                            {{ $shippingAddress->city ?? '' }} - {{ $shippingAddress->zipcode ?? '' }}<br>
                        </p>
                    </div>
                </div>
            </div>
            
            <div class="section">
                <h2 class="section-title">Order Items</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Product</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th class="text-right">Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($order->orderDetails as $key => $orderDetail)
                            <tr>
                                <td>
                                    <strong>{{ $orderDetail->product->name ?? 'Product' }}</strong>
                                    @if ($orderDetail->variation != null)
                                        @php
                                            $variations = json_decode($orderDetail->variation);
                                        @endphp
                                        @if(!empty($variations))
                                            <div style="font-size: 12px; color: #718096; margin-top: 5px;">
                                                @foreach($variations as $var)
                                                    <div>{{ $var->name ?? '' }}: {{ $var->value ?? '' }}</div>
                                                @endforeach
                                            </div>
                                        @endif
                                    @endif
                                </td>
                                <td>{{ single_price($orderDetail->price / $orderDetail->quantity) }}</td>
                                <td>{{ $orderDetail->quantity }}</td>
                                <td class="text-right">{{ single_price($orderDetail->price) }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
            
            <div class="section">
                <h2 class="section-title">Order Summary</h2>
                <div class="summary-row">
                    <table class="summary-table">
                        <tr>
                            <td>Subtotal:</td>
                            <td class="text-right">{{ single_price($order->orderDetails->sum('price')) }}</td>
                        </tr>
                        <tr>
                            <td>Tax:</td>
                            <td class="text-right">{{ single_price($order->orderDetails->sum('tax')) }}</td>
                        </tr>
                        <tr>
                            <td>Shipping:</td>
                            <td class="text-right">{{ single_price($order->shipping_cost) }}</td>
                        </tr>
                        @if($order->coupon_discount > 0)
                        <tr>
                            <td>Coupon Discount:</td>
                            <td class="text-right">- {{ single_price($order->coupon_discount) }}</td>
                        </tr>
                        @endif
                        <tr class="total-row">
                            <td>Grand Total:</td>
                            <td class="text-right">{{ single_price($order->grand_total) }}</td>
                        </tr>
                    </table>
                </div>
            </div>
            
            <div style="text-align: center;">
                <a href="{{ route('orders.index') }}" class="btn">View Order Details</a>
            </div>
        </div>
        
        <div class="footer">
            <p>Thank you for shopping with us!</p>
            <p>{{ env('APP_NAME') }} &copy; {{ date('Y') }}</p>
        </div>
    </div>
</body>

</html>