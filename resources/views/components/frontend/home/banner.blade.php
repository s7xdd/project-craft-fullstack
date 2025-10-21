<div class="relative z-[100] pt-1">
    <div class="relative z-[1] overflow-x-hidden touch-pan-y">
        <div class="max-w-[1280px] mx-auto">
            <div class="embla overflow-hidden touch-pan-y" id="hero-embla">
                <div class="embla__container flex">
                    {{ $slot }}
                </div>
            </div>
        </div>
        <div class="relative left-0 w-full text-center z-10 mt-3" id="hero-dots"></div>
    </div>
</div>