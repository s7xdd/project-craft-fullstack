<div class="shop-block-one"
    style="background-color: {{ get_setting('base_hov_color') }}; border-radius: 20px; max-width: 280px;">
    <div
        class="inner-box group relative block px-4 pt-4 pb-0 text-center transition-all duration-500 ease before:absolute before:border-r before:border-dashed before:border-gray-300 before:top-0 before:right-[-8px] before:h-full before:content-[''] ">
        <div class="image-box relative block">
            <figure class="image relative block max-w-[180px] sm:max-w-[120px] h-[160px] md:h-full w-full mx-auto overflow-hidden">
                <a href="{!! $link !!}">
                    <img class="w-full transition-all duration-500 ease hover:scale-105 object-cover" src="{{ $image }}"
                        alt="{{ $alt }}" />
                </a>
            </figure>
        </div>

        <div
            class="lower-content relative block bg-transparent !px-0 pt-3 pb-3 transition-all duration-500 ease group-hover:pb-[60px] group-hover:-mt-[50px] h-[125px]">
            <span class="text relative block text-[8px] leading-4 mb-1 text-gray-500">{{ $category }}</span>
            <h4 class="block text-xs leading-4 mb-1 !line-clamp-2">
                <a class="inline-block text-[var(--title-color)] text-[10px] leading-4 h-[30px] overflow-hidden !line-clamp-2"
                    href="{!! $link !!}">{!! $name !!}</a>
            </h4>
            <div class="price relative block text-[12px] leading-5 text-red-600 font-semibold mb-3">
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
