<section class="testimonial-section !py-20 ">
    <div class="container mx-auto px-4 sm:px-6 lg:px-8 !max-w-[1400px]">
        <div class="text-center mb-16">
            <h2 class="text-3xl sm:text-4xl lg:text-5xl font-bold text-gray-900 mb-4 bg-clip-text text-transparent">Customer Stories</h2>
            <p class="text-xl text-gray-600 max-w-3xl mx-auto">See what our customers are saying about their experiences</p>
            <div class="w-24 h-1  mx-auto mt-6 rounded-full"></div>
        </div>
        
        <div class="testimonial-carousel owl-carousel owl-theme owl-dots-none owl-nav-none" 
             data-items="4" data-tablet-items="3" data-mobile-items="2" data-margin="15" 
             data-autoplay="true" data-loop="true">
            {{ $slot }}
        </div>
    </div>
</section>