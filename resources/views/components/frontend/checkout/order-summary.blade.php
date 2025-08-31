@props([
    'products' => [
        [
            'image' => 'assets/images/shop/checkout-1.png',
            'name' => 'Cute Soft Long Cat Plush Toys Stuffed',
            'price' => 'INR 11.99'
        ],
        [
            'image' => 'assets/images/shop/checkout-2.png',
            'name' => 'Avengers Action Figure figurine',
            'price' => 'INR 13.99'
        ],
        [
            'image' => 'assets/images/shop/checkout-3.png',
            'name' => 'Marvel Spider-Man Basic Superhero',
            'price' => 'INR 12.99'
        ]
    ],
    'subtotal' => 'INR 18.97',
    'shipping' => 'INR 1',
    'total' => 'INR 18.98'
])

<div class="order-box">
    <h3>Order Summary</h3>
    <div class="order-info">
        <div class="title-box">
            <span class="text">PROduct</span>
            <span class="text">total</span>
        </div>
        <div class="order-product">
            @foreach($products as $product)
            <div class="single-item">
                <div class="product-box">
                    <figure class="image-box"><img src="{{ $product['image'] }}" alt=""></figure>
                    <h6>{{ $product['name'] }}</h6>
                </div>
                <h4>{{ $product['price'] }}</h4>
            </div>
            @endforeach
        </div>
        <ul class="cost-box">
            <li>
                <h4><span>Subtotal</span></h4>
                <h4>{{ $subtotal }}</h4>
            </li>
            <li>
                <h4><span>Free Shipping</span></h4>
                <h4><span>{{ $shipping }}</span></h4>
            </li>
        </ul>
        <div class="total-box">
            <h4><span>Total</span></h4>
            <h4>{{ $total }}</h4>
        </div>
        <div class="payment-option">
            <ul class="other-payment">
                <li>
                    <div class="check-box mb_12">
                        <input class="check" type="radio" id="checkbox4" name="same">
                        <label for="checkbox4">Cash on Delivery</label>
                    </div>
                </li>
                <li>
                    <div class="check-box mb_12">
                        <input class="check" type="radio" id="checkbox5" name="same">
                        <label for="checkbox5">Credit/Debit Cards or Paypal</label>
                    </div>
                </li>
            </ul>
        </div>
        <div class="btn-box pt_30">
            <button class="pink-button" type="button">
                Make Payment
            </button>
        </div>
    </div>
</div>