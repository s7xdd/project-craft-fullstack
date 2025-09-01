<div class="shop-block-one">
    <div class="inner-box">
        <div class="image-box">
            <figure class="image">
                <a href="{!! $link !!}"><img src="{{ $image }}" alt="{{ $alt }}" /></a>
            </figure>
        </div>
        <div class="lower-content">
            <span class="text">{{ $category }}</span>
            <h4>
                <a href="{!! $link !!}">{{ $name }}</a>
            </h4>
            <div class="price">
                @if ($originalPrice)
                    <del>{{ env('DEFAULT_CURRENCY') . ' ' . $originalPrice }}</del>
                @endif
                {{ env('DEFAULT_CURRENCY') . ' ' . $price }}
            </div>
        </div>
    </div>
</div>
