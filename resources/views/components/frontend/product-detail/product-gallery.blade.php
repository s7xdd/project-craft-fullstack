 <section class="shop-details relative pt-[70px] pb-[120px]">
     <div class="max-w-7xl mx-auto px-4">
         <div class="product-details-content relative block mb-20">
             <div class="flex flex-wrap">
                 <div class="lg:w-1/2 w-full image-column">
                     <div class="bxslider">
                         {{ $slot }}
                     </div>
                 </div>
                 <div class="lg:w-1/2 w-full content-column">
                     {{ $productDetails }}
                 </div>
             </div>
         </div>
         {{ $productDescription ?? "" }}
     </div>
 </section>