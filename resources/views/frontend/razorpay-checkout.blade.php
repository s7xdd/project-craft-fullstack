<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Razorpay Payment Processing</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
    <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
        <div style="text-align: center;">
            <h3>Processing your payment...</h3>
            <p>Please wait while we redirect you to the payment gateway.</p>
            <p id="timer">Redirecting in 5 seconds...</p>
        </div>
    </div>

    <script>
        let seconds = 5;
        const timerElement = document.getElementById('timer');
        
        const countdown = setInterval(() => {
            seconds--;
            timerElement.textContent = `Redirecting in ${seconds} seconds...`;
            
            if (seconds <= 0) {
                clearInterval(countdown);
                initRazorpay();
            }
        }, 1000);

        function initRazorpay() {
            var options = {
                "key": "{{ env('RAZORPAY_KEY_ID') }}",
                "amount": "{{ $razorpayOrder['amount'] }}",
                "currency": "{{ $razorpayOrder['currency'] }}",
                "name": "{{ config('app.name') }}",
                "description": "Order Payment",
                "image": "{{ asset('frontend/images/logo.png') }}",
                "order_id": "{{ $razorpayOrder['id'] }}",
                "handler": function (response) {
                    document.getElementById('razorpay_payment_id').value = response.razorpay_payment_id;
                    document.getElementById('razorpay_order_id').value = response.razorpay_order_id;
                    document.getElementById('razorpay_signature').value = response.razorpay_signature;
                    document.getElementById('rzp-paymentform').submit();
                },
                "prefill": {
                    "name": "{{ auth()->user()->name ?? '' }}",
                    "email": "{{ auth()->user()->email ?? '' }}",
                    "contact": "{{ json_decode($order->billing_address)->phone ?? '' }}"
                },
                "notes": {
                    "address": "{{ json_decode($order->billing_address)->address ?? '' }}"
                },
                "theme": {
                    "color": "#F37254"
                }
            };
            
            var rzp = new Razorpay(options);
            rzp.open();
        }

        // window.onload = function() { initRazorpay(); };
    </script>

    <form id="rzp-paymentform" action="{{ route('razorpay.success') }}" method="POST">
        @csrf
        <input type="hidden" name="razorpay_payment_id" id="razorpay_payment_id">
        <input type="hidden" name="razorpay_order_id" id="razorpay_order_id">
        <input type="hidden" name="razorpay_signature" id="razorpay_signature">
        <input type="hidden" name="order_id" value="{{ $order->id }}">
    </form>
</body>
</html>