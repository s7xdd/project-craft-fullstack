<div class="single-history" data-order-id="{{ $orderId }}">
    <div class="product-box">
        <figure class="image-box">
            <img src="{{ $image }}" alt="{{ $alt }}" />
        </figure>
        <div class="product-info">
            <h6>
                <a href="{{ $link }}">{{ $productName }}</a>
            </h6>
            <span>#{{ $orderId }}</span>
            <h4>{{ $price }}</h4>
        </div>
    </div>
    <span class="text">{{ $status }}</span>
</div>