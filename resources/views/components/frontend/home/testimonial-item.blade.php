 <div class="group rounded-3xl transition-all duration-500 transform hover:-translate-y-2 overflow-hidden border border-gray-100 shadow-sm hover:shadow-md">
     <div class="relative">
         <div class="aspect-rectangle overflow-hidden">
             @if (!empty($video))
                 <video controls muted loop playsinline class="w-full h-full object-cover rounded-3xl">
                     <source src="{{ $video }}">
                     Your browser does not support the video tag.
                 </video>
             @else
                 <div class="w-full h-full bg-gray-200 rounded-3xl flex items-center justify-center">
                     <span class="text-gray-500">No video available</span>
                 </div>
             @endif
         </div>
     </div>
 </div>
