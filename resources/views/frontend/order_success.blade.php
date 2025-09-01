@extends('frontend.layouts.app')

@section('content')
    <div class="container my-5 h-[80vh]">
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
                        {{-- <p>Order ID: <strong>{{ $order->code }}</strong></p>
                        <p>Order Total: <strong>₹{{ number_format($order->grand_total, 2) }}</strong></p> --}}

                        <div class="mt-4">
                            <a href="{{ route('orders.index') }}" class="btn btn-primary">Track Order</a>
                            <a href="{{ route('home') }}" class="btn btn-secondary">Continue Shopping</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
