<section class="py-16 md:py-20 lg:py-32">
    <div class="max-w-[1600px] mx-auto px-4 sm:px-6 lg:px-8">
        
        {{ $orderIdFilter ?? '' }}
        
        <div class="pt-16 md:pt-20 lg:pt-24" id="orderHistoryList">
            {{ $slot }}
        </div>
    </div>
</section>