<!DOCTYPE html>
<html>
<head>
    <title>Order Success</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
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
                            <a href="{{ route('orders.index') }}" class="btn btn-primary">View Orders</a>
                            <a href="{{ route('home') }}" class="btn btn-secondary">Continue Shopping</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>