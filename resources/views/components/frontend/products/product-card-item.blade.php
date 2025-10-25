<div class="bg-white rounded-lg shadow-md overflow-hidden hover:shadow-lg transition-all duration-300">
    <a href="{!! $link !!}" class="relative block">
        <img src="{{ $image }}" alt="{{ $alt }}" class="w-full h-48 object-cover">
        @if ($currentPrice < $originalPrice)
            @php
                $discountPercentage = (($originalPrice - $currentPrice) / $originalPrice) * 100;
                $discount = number_format($discountPercentage, 0);
            @endphp
            <span class="absolute top-2 left-2 bg-red-500 text-white px-2 py-1 rounded text-sm font-semibold">{{ $discount }}% OFF</span>
        @endif
    </a>
    <div class="p-4">
        <a href="{!! $link !!}">
            <span class="text-xs text-gray-500">{{ $category ?? "" }}</span>
            <h5 class="text-lg font-semibold mt-1 line-clamp-2">{{ $title ?? "" }}</h5>
        </a>
        <div class="mt-2">
            <span class="text-lg font-bold text-green-600">{{ env('DEFAULT_CURRENCY') . ' ' . $currentPrice }}</span>
            @if ($currentPrice < $originalPrice)
                <span class="text-sm text-gray-500 line-through ml-2">{{ env('DEFAULT_CURRENCY') . ' ' . $originalPrice }}</span>
            @endif
        </div>
        <a href="#" class="add-to-cart-btn mt-3 block bg-blue-500 text-white text-center py-2 rounded hover:bg-blue-600 transition-colors"
           data-product-slug="{{ $slug }}" data-product-sku="{{ $sku }}">
            {{ trans('messages.add_to_cart') }}
        </a>
    </div>
</div>
