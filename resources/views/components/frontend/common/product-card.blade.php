  {{-- Added background color to the card --}}
  {{-- Made the card more rounded --}}

<div class="shop-block-one" style="background-color: #FFFDF7; border-radius: 50px;">


  <div class="inner-box group relative block px-4 pt-4 pb-0 text-center transition-all duration-500 ease before:absolute before:border-r before:border-dashed before:border-gray-300 before:top-0 before:right-[-8px] before:h-full before:content-[''] " >
    <div class="image-box relative block">
      <figure class="image relative block max-w-[180px] w-full mx-auto overflow-hidden">
        <a href="{!! $link !!}">
          <img class="w-full transition-all duration-500 ease hover:scale-105" src="{{ $image }}" alt="{{ $alt }}" />
        </a>
      </figure>
    </div>
    <!-- Made inner content transparent so the card background is visible -->
    <div class="lower-content relative block bg-transparent pt-3 pb-3 transition-all duration-500 ease group-hover:pb-[60px] group-hover:-mt-[50px] h-[125px]">
      <span class="text relative block text-[10px] leading-4 mb-1 text-gray-500">{{ $category }}</span>
      <h4 class="block text-xs leading-4 mb-1">
        <a class="inline-block text-[var(--title-color)] text-[11px] leading-4 h-[40px] overflow-hidden line-clamp-2" href="{!! $link !!}">{!! $name !!}</a>
      </h4>
      <div class="price relative block text-[13px] leading-5 text-red-600 font-semibold mb-3">
        @if (!empty($originalPrice) && floatval($originalPrice) > floatval($price))
          <del class="text-[10px] leading-4 text-gray-600 font-normal mr-2">
            {{ env('DEFAULT_CURRENCY') . ' ' . number_format((float) $originalPrice, 2) }}
          </del>
        @endif
        <span class="text-[11px] leading-4">
          {{ env('DEFAULT_CURRENCY') . ' ' . number_format((float) $price, 2) }}
        </span>
      </div>
    </div>
  </div>
</div>
