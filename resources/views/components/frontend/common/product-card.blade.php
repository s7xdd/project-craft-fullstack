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
                <a class="text-[16px]" href="{!! $link !!}">{{ $name }}</a>
            </h4>
            <div class="price">
                @if ($originalPrice)
                    <del class="!text-[14px]">{{ env('DEFAULT_CURRENCY') . ' ' . $originalPrice }}</del>
                @endif
                <span class="text-[14px]">
                    {{ env('DEFAULT_CURRENCY') . ' ' . $price }}
                </span>
            </div>
        </div>
    </div>
</div>
