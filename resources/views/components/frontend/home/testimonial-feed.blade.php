 <section class="py-20">
     <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="swiper testimonial-carousel overflow-visible py-4" data-items="4"
              data-tablet-items="3" data-mobile-items="2" data-margin="15" data-autoplay="true" data-loop="true">
              <div class="swiper-wrapper">
                  @foreach ($testimonials as $testimonial)
                      <div class="swiper-slide px-4">
                          <x-frontend.home.testimonial-item video="{{ $testimonial['video'] }}" />
                      </div>
                  @endforeach
              </div>
          </div>
     </div>
 </section>
