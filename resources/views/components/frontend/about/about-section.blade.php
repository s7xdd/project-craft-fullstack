<section class="py-20">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex flex-col lg:flex-row items-center gap-8 lg:gap-12">
            <div class="w-full lg:w-1/2">
                <div class="relative w-full h-96 lg:h-[650px] overflow-hidden rounded-lg">
                    <img src="{{ $image }}" alt="{{ $alt }}" class="w-full h-full object-cover">
                </div>
            </div>
            <div class="w-full lg:w-1/2">
                <div class="prose prose-lg max-w-none">
                    <div class="mb-8">
                        {{ $content ?? "" }}
                    </div>
                    {{ $funFacts ?? "" }}
                </div>
            </div>
        </div>
    </div>
</section>