 <section class="py-20 bg-gray-50">
     <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
         <div class="text-center mb-16">
             <h2 class="text-3xl sm:text-4xl lg:text-5xl font-bold text-gray-900 mb-4">
                 {{ $title }}</h2>
             <p class="text-xl text-gray-600 max-w-3xl mx-auto">{!! $description !!}
             </p>
             <div class="w-24 h-1 bg-blue-600 mx-auto mt-6 rounded-full"></div>
         </div>

          <div class="swiper testimonial-carousel overflow-visible py-4" data-items="4"
              data-tablet-items="3" data-mobile-items="2" data-margin="15" data-autoplay="true" data-loop="true">
              <div class="swiper-wrapper">
                  @foreach ($testimonials as $testimonial)
                      <div class="swiper-slide px-4">
                          <x-frontend.home.testimonial-item video="{{ $testimonial['video'] }}" name="{{ $testimonial['name'] }}"
                              title="{{ $testimonial['title'] }}" text="{{ $testimonial['text'] }}" />
                      </div>
                  @endforeach
              </div>
          </div>
     </div>
 </section>
