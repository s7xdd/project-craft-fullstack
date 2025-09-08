@extends('frontend.layouts.app')
@section('content')
    @php
        $topCollections = collect($data['collection_products'])->filter(
            fn($collection) => isset($collection['products']) &&
                count($collection['products']) > 0 &&
                isset($collection['page_reference']) &&
                $collection['page_reference'] === 'top',
        );
        $middleCollections = collect($data['collection_products'])->filter(
            fn($collection) => isset($collection['products']) &&
                count($collection['products']) > 0 &&
                isset($collection['page_reference']) &&
                $collection['page_reference'] === 'middle',
        );
        $testimonials = isset($data['testimonials'])
            ? $data['testimonials']->map(function ($testimonial) {
                $imageData = $testimonial->image ? json_decode($testimonial->image) : [];
                $image = isset($imageData[0]->url) ? $imageData[0]->url : '';
                // Get video from assets/Videos directory based on testimonial ID or use default
                $videoFiles = [
                    'VN20250904_035052.mp4',
                    'VN20250904_035542.mp4',
                    'VN20250904_124113.mp4',
                    'VN20250904_124131.mp4',
                    'VN20250904_124156.mp4',
                    'VN20250904_124335.mp4',
                    'VN20250904_124350.mp4',
                    'VN20250904_124402.mp4',
                    'VN20250904_124432.mp4',
                    'VN20250904_124444.mp4',
                ];
                // Use testimonial ID to select video, fallback to first video
                $videoIndex = ($testimonial->id - 1) % count($videoFiles);
                $video = asset('assets/Videos/' . $videoFiles[$videoIndex]);
                return [
                    'name' => $testimonial->name,
                    'text' => $testimonial->comment,
                    'image' => $image,
                    'video' => $video,
                ];
            })
            : [];
    @endphp

    {{-- New Responsive Banner Carousel --}}
    <section class="w-full pb-8">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            {{-- Banner Container with 3:1 Aspect Ratio --}}
            <div class="relative w-full aspect-[3/1] min-h-[220px] max-h-[500px] overflow-hidden rounded-lg shadow-lg">
                {{-- Carousel Container --}}
                <div id="bannerCarousel" class="relative w-full h-full">
                    {{-- Slides Container --}}
                    <div id="slidesContainer" class="flex w-full h-full transition-transform duration-500 ease-in-out">
                        @foreach ($data['slider'] as $index => $slide)
                            <div class="flex-shrink-0 w-full h-full relative">
                                {{-- Background Image --}}
                                <div class="absolute inset-0 bg-cover bg-center bg-no-repeat"
                                     style="background-image: url('{{ uploaded_asset($slide['image']) }}');">
                                </div>
                                
                                {{-- Overlay --}}
                                <div class="absolute inset-0 bg-black bg-opacity-40"></div>
                                
                                {{-- Content --}}
                                <div class="relative z-10 h-full flex items-center">
                                    <div class="w-full max-w-6xl mx-auto px-6 sm:px-8 lg:px-12">
                                        <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 items-center h-full">
                                            {{-- Content Column --}}
                                            <div class="space-y-6 text-center lg:text-left">
                                                {{-- Title --}}
                                                @if($slide['name'] ?? '')
                                                    <h2 class="text-white font-bold text-2xl sm:text-3xl md:text-4xl lg:text-5xl xl:text-6xl leading-tight">
                                                        {!! $slide['name'] !!}
                                                    </h2>
                                                @endif
                                                
                                                {{-- Button --}}
                                                @if($slide['btn_text'] ?? '')
                                                    <div class="pt-4">
                                                        <a href="{{ $slide['link'] ?? '#' }}" 
                                                           class="inline-flex items-center px-4 py-8 bg-white  text-black hover:text-red font-semibold rounded-lg shadow-lg transform transition-all duration-200 hover:scale-105 focus:outline-none focus:ring-4 focus:ring-blue-300 text-sm sm:text-base">
                                                            {!! $slide['btn_text'] !!}
                                                            <!-- <svg class="ml-2 h-4 w-4 sm:h-5 sm:w-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                                                            </svg> -->
                                                        </a>
                                                    </div>
                                                @endif
                                            </div>
                                            
                                            {{-- Empty column for spacing on larger screens --}}
                                            <div class="hidden lg:block"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                    
                    {{-- Navigation Arrows --}}
                    @if(count($data['slider']) > 1)
                        <button id="prevBtn" 
                                class="absolute left-4 top-1/2 transform -translate-y-1/2 z-20 bg-black bg-opacity-50 hover:bg-opacity-75 text-white p-2 sm:p-3 rounded-full transition-all duration-200 focus:outline-none focus:ring-4 focus:ring-white focus:ring-opacity-50">
                            <svg class="h-4 w-4 sm:h-6 sm:w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 19l-7-7 7-7"></path>
                            </svg>
                        </button>
                        
                        <button id="nextBtn" 
                                class="absolute right-4 top-1/2 transform -translate-y-1/2 z-20 bg-black bg-opacity-50 hover:bg-opacity-75 text-white p-2 sm:p-3 rounded-full transition-all duration-200 focus:outline-none focus:ring-4 focus:ring-white focus:ring-opacity-50">
                            <svg class="h-4 w-4 sm:h-6 sm:w-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5l7 7-7 7"></path>
                            </svg>
                        </button>
                    @endif
                    
                    {{-- Dots Indicator --}}
                    @if(count($data['slider']) > 1)
                        <div class="absolute bottom-4 left-1/2 transform -translate-x-1/2 z-20 flex space-x-2">
                            @foreach($data['slider'] as $index => $slide)
                                <button class="dot w-2 h-2 sm:w-3 sm:h-3 rounded-full transition-all duration-200 focus:outline-none {{ $index === 0 ? 'bg-white' : 'bg-white bg-opacity-50' }}" 
                                        data-slide="{{ $index }}"></button>
                            @endforeach
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </section>

    {{-- Rest of your existing content --}}
    @if ($page->getTranslation('image1', $lang) && is_array(json_decode($page->getTranslation('image1', $lang))))
        <x-frontend.home.highlights>
            @foreach (json_decode($page->getTranslation('image1', $lang), true) as $sectionData)
                <x-frontend.home.highlight-item
                    icon="{{ isset($sectionData['icon'][0]) ? $sectionData['icon'][0]['url'] ?? '' : '' }}"
                    text="{{ $sectionData['title'] ?? '' }}" />
            @endforeach
        </x-frontend.home.highlights>
    @endif

    @if ($topCollections->isNotEmpty())
        @foreach ($topCollections as $collectionKey => $collection)
            <x-frontend.common.product-section title="{{ $collection['collectiontitle'] }}">
                <div class="p-tab active-tab" id="tab-{{ $loop->index + 1 }}">
                    <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                        @foreach ($collection['products'] as $product)
                            @php
                                $priceData = getProductOfferPrice($product);
                            @endphp
                            <x-frontend.common.product-card image="{{ get_product_image($product->thumbnail_img) }}"
                                alt="{{ $product->getTranslation('name', $lang) }}"
                                category="{{ $product->category->getTranslation('name', $lang) ?? 'Product' }}"
                                name="{{ $product->getTranslation('name', $lang) }}"
                                originalPrice=" {{ $priceData['original_price'] }}"
                                price=" {{ $priceData['discounted_price'] }}"
                                link="{{ route('product-detail', ['slug' => $product->slug, 'sku' => $product->sku]) }}" />
                        @endforeach
                    </div>
                </div>
            </x-frontend.common.product-section>
        @endforeach
    @endif

    @if (!empty($data['banners']['home_mid_banner']))
        <x-frontend.home.featured-products>
            @foreach ($data['banners']['home_mid_banner'] as $midKey => $home_mid_banner)
                <div class="col-lg-4 col-md-6 col-sm-12 -block">
                    <x-frontend.home.featured-product image="{{ $home_mid_banner['image'] }}" alt="Featured Product 1"
                        link="{{ $home_mid_banner['link'] }}" buttonText="{{ $home_mid_banner['btn_text'] }}" />
                </div>
            @endforeach
        </x-frontend.home.featured-products>
    @endif

    @if ($middleCollections->isNotEmpty())
        @foreach ($middleCollections as $collectionKey => $collection)
            <x-frontend.common.product-section title="{{ $collection['collectiontitle'] }}">
                <div class="p-tab active-tab" id="tab-{{ $loop->index + 1 }}">
                    <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one ">
                        @foreach ($collection['products'] as $product)
                            @php
                                $priceData = getProductOfferPrice($product);
                                $productUrl = route('product-detail', [
                                    'slug' => $product->slug,
                                    'sku' => $product->sku,
                                ]);
                            @endphp
                            <x-frontend.common.product-card image="{{ get_product_image($product->thumbnail_img) }}"
                                alt="{{ $product->getTranslation('name', $lang) }}"
                                category="{{ $product->category->getTranslation('name', $lang) ?? 'Product' }}"
                                name="{{ $product->getTranslation('name', $lang) }}"
                                originalPrice=" {{ $priceData['original_price'] }}"
                                price=" {{ $priceData['discounted_price'] }}" link="{!! $productUrl !!}" />
                        @endforeach
                    </div>
                </div>
            </x-frontend.common.product-section>
        @endforeach
    @endif

    @if ($testimonials->count() > 0)
        <x-frontend.home.testimonial-feed>
            @foreach ($testimonials as $t)
                <x-frontend.home.testimonial-item
                    video="{{ $t['video'] }}"
                    name="{{ $t['name'] }}"
                    text="{{ $t['text'] }}" />
            @endforeach
        </x-frontend.home.testimonial-feed>
    @endif

    <x-frontend.common.whatsapp-subscribe />
@endsection

@section('script')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const carousel = document.getElementById('bannerCarousel');
            const slidesContainer = document.getElementById('slidesContainer');
            const prevBtn = document.getElementById('prevBtn');
            const nextBtn = document.getElementById('nextBtn');
            const dots = document.querySelectorAll('.dot');
            
            const totalSlides = {{ count($data['slider']) }};
            let currentSlide = 0;
            let autoSlideInterval;
            
            // Only initialize if there are multiple slides
            if (totalSlides <= 1) return;
            
            // Update slide position
            function updateSlide() {
                const translateX = -currentSlide * 100;
                slidesContainer.style.transform = `translateX(${translateX}%)`;
                
                // Update dots
                dots.forEach((dot, index) => {
                    if (index === currentSlide) {
                        dot.classList.remove('bg-opacity-50');
                        dot.classList.add('bg-white');
                    } else {
                        dot.classList.add('bg-opacity-50');
                        dot.classList.remove('bg-white');
                    }
                });
            }
            
            // Next slide
            function nextSlide() {
                currentSlide = (currentSlide + 1) % totalSlides;
                updateSlide();
            }
            
            // Previous slide
            function prevSlide() {
                currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
                updateSlide();
            }
            
            // Go to specific slide
            function goToSlide(slideIndex) {
                currentSlide = slideIndex;
                updateSlide();
            }
            
            // Event listeners
            if (nextBtn) {
                nextBtn.addEventListener('click', () => {
                    nextSlide();
                    resetAutoSlide();
                });
            }
            
            if (prevBtn) {
                prevBtn.addEventListener('click', () => {
                    prevSlide();
                    resetAutoSlide();
                });
            }
            
            dots.forEach((dot, index) => {
                dot.addEventListener('click', () => {
                    goToSlide(index);
                    resetAutoSlide();
                });
            });
            
            // Auto slide functionality
            function startAutoSlide() {
                autoSlideInterval = setInterval(nextSlide, 8000); // Change slide every 8 seconds (increased from 5)
            }
            
            function stopAutoSlide() {
                if (autoSlideInterval) {
                    clearInterval(autoSlideInterval);
                }
            }
            
            function resetAutoSlide() {
                stopAutoSlide();
                startAutoSlide();
            }
            
            // Pause auto slide on hover
            carousel.addEventListener('mouseenter', stopAutoSlide);
            carousel.addEventListener('mouseleave', startAutoSlide);
            
            // Handle visibility change (pause when tab is not active)
            document.addEventListener('visibilitychange', function() {
                if (document.hidden) {
                    stopAutoSlide();
                } else {
                    startAutoSlide();
                }
            });
            
            // Touch/swipe support for mobile
            let touchStartX = 0;
            let touchEndX = 0;
            let isSwiping = false;
            
            carousel.addEventListener('touchstart', (e) => {
                touchStartX = e.changedTouches[0].screenX;
                isSwiping = true;
                stopAutoSlide();
            });
            
            carousel.addEventListener('touchmove', (e) => {
                if (!isSwiping) return;
                e.preventDefault(); // Prevent scrolling
            });
            
            carousel.addEventListener('touchend', (e) => {
                if (!isSwiping) return;
                
                touchEndX = e.changedTouches[0].screenX;
                const swipeDistance = touchStartX - touchEndX;
                const minSwipeDistance = 50;
                
                if (Math.abs(swipeDistance) > minSwipeDistance) {
                    if (swipeDistance > 0) {
                        nextSlide(); // Swipe left - next slide
                    } else {
                        prevSlide(); // Swipe right - previous slide
                    }
                }
                
                isSwiping = false;
                resetAutoSlide();
            });
            
            // Keyboard navigation
            document.addEventListener('keydown', (e) => {
                if (e.key === 'ArrowLeft') {
                    prevSlide();
                    resetAutoSlide();
                } else if (e.key === 'ArrowRight') {
                    nextSlide();
                    resetAutoSlide();
                }
            });
            
            // Start auto slide
            startAutoSlide();

            // Original loader functionality
            var loaderText = document.querySelector('#page-loader .loader-text');
        });
    </script>
@endsection