<div class="shop-block-one">
    <div class="inner-box group relative block px-[30px] pt-[30px] pb-0 text-center transition-all duration-500 ease before:absolute before:border-r before:border-dashed before:border-gray-300 before:top-0 before:right-[-15px] before:h-full before:content-['']">
        <div class="image-box relative block">
            <figure class="image relative block max-w-[235px] w-full mx-auto overflow-hidden">
                <a href="{!! $link !!}"><img class="w-full transition-all duration-500 ease hover:scale-105" src="{{ $image }}" alt="{{ $alt }}" /></a>
            </figure>
        </div>
        <div class="lower-content relative block bg-white pt-[35px] pb-4 transition-all duration-500 ease group-hover:pb-[90px] group-hover:-mt-[73px] h-[150px]">
            <span class="text relative block text-sm leading-5 mb-1 text-gray-500">{{ $category }}</span>
            <h4 class="block text-xl leading-6 mb-1">
                <a class="inline-block text-[var(--title-color)] text-base h-[50px] overflow-hidden line-clamp-2" href="{!! $link !!}">{!! $name !!}</a>
            </h4>
            <div class="price relative block text-xl text-red-600 font-bold mb-[17px]">
                @if (!empty($originalPrice) && floatval($originalPrice) > floatval($price))
                    <del class="text-base leading-[28px] text-gray-600 font-normal mr-[10px] text-sm">{{ env('DEFAULT_CURRENCY') . ' ' . number_format((float) $originalPrice, 2) }}</del>
                @endif
                <span class="text-sm">
                    {{ env('DEFAULT_CURRENCY') . ' ' . number_format((float) $price, 2) }}
                </span>
            </div>
        </div>
    </div>
</div>