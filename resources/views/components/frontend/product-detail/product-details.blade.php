 <div class="content-box relative block -mt-2 ml-[30px]">
     <span class="upper-text text-sm leading-7 mb-2">{{ $category }}</span>
     <h2 class="text-3xl leading-11 mb-3">{!! $title !!}</h2>
     <h3 class="text-3xl leading-10 text-red-600 mb-2">
         {{ env('DEFAULT_CURRENCY') . ' ' . $price }}
         @if ($originalPrice && floatval($originalPrice) > floatval($price))
             <del class="text-xl font-normal text-gray-500 ml-2.5">{{ env('DEFAULT_CURRENCY') . ' ' . $originalPrice }}</del>
         @endif
     </h3>

     {{-- @if (isset($description) && trim(strip_tags($description)) != '') --}}
         <div class="text-box mb-[30px]">
             {!! $description ?? "" !!}
         </div>
     {{-- @endif --}}

     <ul class="discription-box bg-gray-50 border-dashed border border-gray-300 rounded-lg p-5 pl-10 pr-10 mb-[30px]">
         {{ $details ?? '' }}
     </ul>
     {!! $colorOptions !!}
     <ul class="other-option pl-0">
         {{ $tags ?? '' }}
         {{ $socialLinks ?? '' }}
     </ul>

     <div>
         {{ $productDescription ?? '' }}
     </div>

     {{ $cartOptions ?? '' }}

 </div>
