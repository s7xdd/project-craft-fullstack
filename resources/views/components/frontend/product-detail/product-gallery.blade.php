  <section class="py-16 lg:py-24">
      <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div class="mb-16">
              <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 lg:gap-12">
                  <div class="order-1 lg:order-2">
                      {{ $slot }}
                  </div>
                  <div class="order-2 lg:order-1">
                      {{ $productDetails }}
                  </div>
              </div>
          </div>
          {{ $productDescription ?? "" }}
      </div>
  </section>