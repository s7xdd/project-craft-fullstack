<div class="shop-block-one">
    <div class="inner-box">
        <div class="image-box">
            <figure class="image">
                <a href="{!! $link !!}"><img src="{{ $image }}" alt="{{ $alt }}" /></a>
            </figure>
        </div>
        <div class="lower-content" style="height: 150px">
            <span class="text">{{ $category }}</span>
            <h4>
                <a class="text-[16px] !h-[50px] line-clamp-2" href="{!! $link !!}">{{ $name }}</a>
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
