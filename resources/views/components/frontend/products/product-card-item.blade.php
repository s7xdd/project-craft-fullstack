<div class="product-card">
    <a href="{!! $link !!}" class="product-image-link">
        <img class="product-image" src="{{ $image }}" alt="{{ $alt }}" />
        @if ($currentPrice < $originalPrice)
            @php
                $discountPercentage = (($originalPrice - $currentPrice) / $originalPrice) * 100;
                $discount = number_format($discountPercentage, 0);
            @endphp
            <span class="discount-badge">{{ $discount }}% OFF</span>
        @endif
    </a>
    <div class="product-info">
        <a href="{!! $link !!}">
            <span class="!text-xs !md:text-sm text-gray-500">
                {{ $category ?? "" }}
            </span>

            <h5 class="product-title !h-[50px] mt-1">
                {{ $title ?? ""}}
            </h5>
        </a>
        <div class="price-row">
            <p>
                <span class="current-price">{{ env('DEFAULT_CURRENCY') . ' ' . $currentPrice }}</span>
                @if ($currentPrice < $originalPrice)
                    <span class="original-price">{{ env('DEFAULT_CURRENCY') . ' ' . $originalPrice }}</span>
                @endif
            </p>
        </div>

        <a href="#" class="add-to-cart-btn" data-product-slug="{{ $slug }}"
            data-product-sku="{{ $sku }}">{{ trans('messages.add_to_cart') }}</a>

    </div>
</div>
