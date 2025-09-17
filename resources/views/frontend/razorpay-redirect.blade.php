<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Redirecting to Payment Gateway</title>
</head>
<body>
    <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
        <div style="text-align: center;">
            <h3>Redirecting to payment gateway...</h3>
            <p>Please wait while we redirect you to complete your payment.</p>
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
                window.location.href = "{{ $paymentLink }}";
            }
        }, 1000);
    </script>
</body>
</html>