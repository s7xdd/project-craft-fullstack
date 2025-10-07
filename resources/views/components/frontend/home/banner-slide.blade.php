<div class="embla__slide flex-[0_0_100%] min-w-0 flex items-center justify-center">
    <div class="text-center w-full">
        <!-- <div class="flex items-center justify-center text-center">
            @if($title)
                <h1 class="bg-clip-text text-transparent h-auto bg-gradient-to-r from-red-500 to-yellow-400 text-[30px] md:text-[64px] lg:text-[80px] leading-[40px] md:leading-[52px] lg:leading-[60px] tracking-[2px] font-bold pb-7 whitespace-nowrap"
                    aria-label="{!! $title !!}">
                    {!! $title !!}
                </h1>
            @endif
        </div> -->
        <div class="relative text-center">
            <a href="{!! $link !!}" class="inline" aria-label="{!! $title !!}">
                <img src="{{ $image }}" alt="{!! $title !!}"
                     class="w-full h-full object-cover align-middle rounded-[40px]" loading="eager" />
            </a>
        </div>
        <!-- @if ($buttonText)
            <div class="mt-4">
                <a href="{!! $link !!}" class="inline-block bg-blue-600 hover:bg-blue-700 text-white font-semibold py-3 px-6 rounded-lg transition duration-300">
                    {!! $buttonText !!}
                </a>
            </div>
        @endif -->
    </div>
</div>
