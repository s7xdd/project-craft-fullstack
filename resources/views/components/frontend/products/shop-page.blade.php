<section class="py-8">
    <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 lg:grid-cols-4 gap-8">
            <div class="lg:col-span-1">
                {{ $sidebar ?? '' }}
            </div>
            <div class="lg:col-span-3">
                <div class="shop-content">
                    {{ $sorting ?? '' }}
                    <div class="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
                        {{ $slot }}
                    </div>
                    {{ $pagination ?? '' }}
                </div>
            </div>
        </div>
    </div>
</section>