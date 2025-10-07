@props([
    'name' => '',
    'image' => '',
    'price' => 0,
    'oldPrice' => null,
    'off' => null,
    'category' => null,
    'link' => null,
])

@php
    $href = $link;

    $priceNum = is_numeric($price) ? (float) $price : 0;
    $oldPriceNum = is_numeric($oldPrice) ? (float) $oldPrice : null;

    $showOld = !empty($oldPriceNum) && $oldPriceNum > $priceNum;

    $currency = env('DEFAULT_CURRENCY', '₹');

    if ($off !== null && $off !== '') {
        $offText = (string) $off;
    } elseif ($showOld && $oldPriceNum > 0) {
        $offText = number_format((1 - $priceNum / $oldPriceNum) * 100, 0);
    } else {
        $offText = null;
    }
@endphp

<a href="{!! $href !!}">
    <div style="background-color: {{ get_setting('base_hov_color') }};"
        class="w-full max-w-[350px] p-2 md:max-w-md mx-auto  border border-gray-200 rounded-xl shadow-[0_4px_6px_-1px_rgba(0,0,0,0.1),0_2px_2px_-2px_rgba(0,0,0,0.1)] cursor-pointer hover:shadow-lg transition-shadow">
        <div
            class="flex flex-col items-center w-full h-fit gap-2 overflow-hidden relative text-left p-1 sm:p-2 md:p-3 lg:p-4">
            <div class="flex items-center justify-center w-full">
                <img src="{{ $image }}" alt="{{ $name }}" class="w-full h-auto min-h-[150px] md:min-h-[230px] rounded-lg object-cover"
                    loading="eager" />
            </div>

            <div class="flex justify-start w-full">
                <div class="flex flex-col flex-wrap w-full pt-2">
                    @if ($category)
                        <span class="text-[10px] sm:text-xs text-gray-500 mb-1">{{ $category }}</span>
                    @endif

                    <h3
                        class="text-gray-800 font-medium !text-[14px] sm:!text-sm lg:!text-md overflow-hidden text-ellipsis line-clamp-2 min-h-[50px]">
                        {!! $name !!}
                    </h3>

                    <div class="flex items-baseline gap-1 sm:gap-2 mt-1 mb-2 sm:mb-3 md:mb-5">
                        <div
                            class="!text-[14px] sm:!text-base md:!text-md font-semibold text-gray-800 flex items-center gap-1">
                            <span class="align-middle">{{ $currency }}</span>
                            <span>{{ number_format($priceNum, 2) }}</span>
                        </div>

                        @if ($showOld)
                            <div class="text-[14px] sm:text-sm text-slate-500 line-through">
                                <span>{{ $currency }}</span>
                                <span>{{ number_format($oldPriceNum, 2) }}</span>
                            </div>
                        @endif

                        @if ($offText !== null)
                            <div
                                class="rounded-md text-emerald-600 font-bold tracking-wide px-1 text-[10px] sm:text-sm">
                                <span>{{ $offText }}</span>
                                <span>%OFF</span>
                            </div>
                        @endif
                    </div>

                </div>
            </div>
        </div>
    </div>
</a>
