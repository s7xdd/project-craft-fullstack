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

                // Get video from testimonial if available, otherwise use default placeholder
                $video = $testimonial->video ? asset('storage/' . $testimonial->video) : '';

                return [
                    'name' => $testimonial->name,
                    'title' => $testimonial->title,
                    'text' => $testimonial->comment,
                    'image' => $image,
                    'video' => $video,
                ];
            })
            : [];

    @endphp

    <style>
        .hide-scrollbar::-webkit-scrollbar {
            display: none;
        }
    </style>

<div class="px-3">
    
 <x-frontend.home.banner>
        @foreach ($data['slider'] as $slide)
            <x-frontend.home.banner-slide image="{{ uploaded_asset($slide['image']) }}" title="{{ $slide['name'] ?? '' }}"
                link="{{ $slide['link'] ?? '' }}" buttonText="{{ $slide['btn_text'] ?? '' }}" />
        @endforeach
    </x-frontend.home.banner>

</div>

   



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
        <div class="!pb-20 !pt-20">
            @foreach ($topCollections as $collectionKey => $collection)
                <x-frontend.common.product-section :title="$collection['collectiontitle']">
                     <div class="p-tab active-tab" id="tab-{{ $loop->index + 1 }}">
                         <div class="swiper homepageSwiper w-full max-w-7xl mx-auto">
                             <div class="swiper-wrapper">
                                 @foreach ($collection['products'] as $product)
                                     @php
                                         $priceData = getProductOfferPrice($product);
                                         $productUrl = route('product-detail', [
                                             'slug' => $product->slug,
                                             'sku' => $product->sku,
                                         ]);
                                     @endphp
                                     <div class="swiper-slide">
                                         <x-frontend.common.product-card image="{{ get_product_image($product->thumbnail_img) }}"
                                             alt="{{ $product->getTranslation('name', $lang) }}"
                                             category="{{ $product->category->getTranslation('name', $lang) ?? 'Product' }}"
                                             name="{{ $product->getTranslation('name', $lang) }}"
                                             originalPrice=" {{ $priceData['original_price'] }}"
                                             price=" {{ $priceData['discounted_price'] }}" link="{!! $productUrl !!}" />
                                     </div>
                                 @endforeach
                             </div>
                             <div class="swiper-button-next !bg-white !text-gray-800 !rounded-full !w-12 !h-12 !shadow-lg"></div>
                             <div class="swiper-button-prev !bg-white !text-gray-800 !rounded-full !w-12 !h-12 !shadow-lg"></div>
                         </div>

                     </div>
                </x-frontend.common.product-section>
            @endforeach
        </div>
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
        <div class="">
            @foreach ($middleCollections as $collectionKey => $collection)
                <x-frontend.common.product-section :title="$collection['collectiontitle']">
                     <div class="p-tab active-tab" id="tab-{{ $loop->index + 1 }}">
                         <div class="swiper homepageSwiper w-full max-w-7xl mx-auto">
                             <div class="swiper-wrapper">
                                 @foreach ($collection['products'] as $product)
                                     @php
                                         $priceData = getProductOfferPrice($product);
                                         $productUrl = route('product-detail', [
                                             'slug' => $product->slug,
                                             'sku' => $product->sku,
                                         ]);
                                     @endphp
                                     <div class="swiper-slide">
                                         <x-frontend.common.product-card image="{{ get_product_image($product->thumbnail_img) }}"
                                             alt="{{ $product->getTranslation('name', $lang) }}"
                                             category="{{ $product->category->getTranslation('name', $lang) ?? 'Product' }}"
                                             name="{{ $product->getTranslation('name', $lang) }}"
                                             originalPrice=" {{ $priceData['original_price'] }}"
                                             price=" {{ $priceData['discounted_price'] }}" link="{!! $productUrl !!}" />
                                     </div>
                                 @endforeach
                             </div>
                             <div class="swiper-button-next !bg-white !text-gray-800 !rounded-full !w-12 !h-12 !shadow-lg"></div>
                             <div class="swiper-button-prev !bg-white !text-gray-800 !rounded-full !w-12 !h-12 !shadow-lg"></div>
                         </div>
                     </div>
                </x-frontend.common.product-section>
            @endforeach
        </div>
     @endif

@section('script')
      <script>
          // Initialize Swiper for Homepage Carousels
          document.addEventListener('DOMContentLoaded', function () {
              new Swiper('.homepageSwiper', {
                  slidesPerView: 2,
                  spaceBetween: 10,
                  navigation: {
                      nextEl: '.swiper-button-next',
                      prevEl: '.swiper-button-prev',
                  },
                  autoplay: {
                      delay: 3000,
                      disableOnInteraction: false,
                  },
                  loop: true,
                  breakpoints: {
                      480: { slidesPerView: 2 },
                      768: { slidesPerView: 3 },
                      1024: { slidesPerView: 4 },
                      1280: { slidesPerView: 5 },
                      1536: { slidesPerView: 6 },
                  },
              });
          });
      </script>
      <script>
          // Initialize Embla Carousel for Hero Banner
          document.addEventListener('DOMContentLoaded', function () {
              const emblaNode = document.getElementById('hero-embla');
              const dotsNode = document.getElementById('hero-dots');
              if (!emblaNode || !dotsNode) return;

              const emblaApi = EmblaCarousel(emblaNode, {
                  loop: true,
                  autoplay: { delay: 3000, stopOnInteraction: false }
              });

              let selectedIndex = 0;

              const updateDots = () => {
                  dotsNode.innerHTML = '';
                  const slideCount = emblaNode.querySelectorAll('.embla__slide').length;
                  for (let i = 0; i < slideCount; i++) {
                      const button = document.createElement('button');
                      button.className = 'inline-block mx-1 h-2 rounded-full bg-neutral-500/50 transition-opacity ' +
                          (selectedIndex === i ? 'w-7 opacity-100' : 'w-2 opacity-20');
                      button.setAttribute('aria-label', `Go to slide ${i + 1}`);
                      button.addEventListener('click', () => emblaApi.scrollTo(i));
                      dotsNode.appendChild(button);
                  }
              };

              emblaApi.on('select', () => {
                  selectedIndex = emblaApi.selectedScrollSnap();
                  updateDots();
              });

              updateDots();
          });
      </script>
@endsection

     @if ($testimonials->count() > 0)
        <x-frontend.home.testimonial-feed title="{{ $data['testimonialsPageData']?->getTranslation('title') }}" description="{!! $data['testimonialsPageData']?->getTranslation('content1') !!}">
            @foreach ($testimonials as $t)
                <x-frontend.home.testimonial-item video="{{ $t['video'] }}" name="{{ $t['name'] }}"
                    title="{{ $t['title'] }}" text="{{ $t['text'] }}" />
            @endforeach
        </x-frontend.home.testimonial-feed>
    @endif

    <!-- WhatsApp Section -->
    <div class="!pb-10">
        <x-frontend.common.whatsapp-section />
    </div>

@endsection

@section('script')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            var loaderText = document.querySelector('#page-loader .loader-text');
        });
    </script>
@endsection
