<div class="bg-gray-50 p-1 max-w-[190px] md:max-w-[200px] lg:max-w-[300px] rounded-lg shadow-md border-1 border-gray-200 overflow-hidden hover:shadow-lg transition-all duration-300">

    <div class="relative p-1 lg:hidden" style="height: 180px; overflow: hidden;">
        <a href="{!! $link !!}" class="block" style="height: 100%; width: 100%;">
            <img src="{{ $image }}" alt="{{ $alt }}" style="width: 100%; height: 100%; object-fit: cover; display: block; border-radius: 0.5rem;">
        </a>
        @if ($currentPrice < $originalPrice)
            @php
                $discountPercentage = (($originalPrice - $currentPrice) / $originalPrice) * 100;
                $discount = number_format($discountPercentage, 0);
            @endphp
            <span class="absolute top-2 left-2 bg-red-500 text-white px-2 py-1 rounded text-sm font-semibold shadow-md" style="z-index: 10;">{{ $discount }}% OFF</span>
        @endif
    </div>


    <div class="relative p-1 hidden lg:block" style="height: 220px; overflow: hidden;">
        <a href="{!! $link !!}" class="block" style="height: 100%; width: 100%;">
            <img src="{{ $image }}" alt="{{ $alt }}" style="width: 100%; height: 100%; object-fit: cover; display: block; border-radius: 0.5rem;">
        </a>
        @if ($currentPrice < $originalPrice)
            @php
                $discountPercentage = (($originalPrice - $currentPrice) / $originalPrice) * 100;
                $discount = number_format($discountPercentage, 0);
            @endphp
            <span class="absolute top-2 left-2 bg-red-500 text-white px-2 py-1 rounded text-sm font-semibold shadow-md" style="z-index: 10;">{{ $discount }}% OFF</span>
        @endif
    </div>

    
    <div class="px-2 pb-1">
        <a href="{!! $link !!}" class="block h-[65px] md:h-[80px] hover:text-blue-600 transition-colors">
            <span class="text-[8px] md:text-xs text-gray-500 uppercase tracking-wide">{{ $category ?? "" }}</span>
            <div class="text-xs md:text-sm mt-1 line-clamp-2 text-gray-800">{{ $title ?? "" }}</div>
        </a>
        <div class="mt-1 flex items-center gap-2">
            <span class="text-sm md:text-md text-gray-500">{{ env('DEFAULT_CURRENCY') . ' ' . $currentPrice }}</span>
            @if ($currentPrice < $originalPrice)
                <span class="text-[8px] md:text-xs text-gray-500 line-through">{{ env('DEFAULT_CURRENCY') . ' ' . $originalPrice }}</span>
            @endif
        </div>
        <a href="#" class="add-to-cart-btn mt-1 block bg-black text-sm md:text-md text-white text-center py-1 lg:py-2 rounded-lg hover:bg-green-500 transition-colors font-medium shadow-sm hover:shadow-md"
           data-product-slug="{{ $slug }}" data-product-sku="{{ $sku }}">
            {{ trans('messages.add_to_cart') }}
        </a>
    </div>
</div>