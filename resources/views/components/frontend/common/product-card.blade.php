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
                <a class="text-[16px] !h-[50px] line-clamp-2" href="{!! $link !!}">{!! $name !!}</a>
            </h4>
            <div class="price">
                @if (!empty($originalPrice) && floatval($originalPrice) > floatval($price))
                    <del class="!text-[14px]">{{ env('DEFAULT_CURRENCY') . ' ' . number_format((float) $originalPrice, 2) }}</del>
                @endif
                <span class="text-[14px]">
                    {{ env('DEFAULT_CURRENCY') . ' ' . number_format((float) $price, 2) }}
                </span>
            </div>
        </div>
    </div>
</div>
