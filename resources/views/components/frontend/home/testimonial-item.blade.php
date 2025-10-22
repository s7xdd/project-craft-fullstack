 <div class="group bg-white rounded-3xl transition-all duration-500 transform hover:-translate-y-2 overflow-hidden border border-gray-100 shadow-sm hover:shadow-md">
     <div class="relative">
         <div class="aspect-square overflow-hidden rounded-t-3xl">
             @if (!empty($video))
                 <video controls muted loop playsinline class="w-full h-full object-cover">
                     <source src="{{ $video }}">
                     Your browser does not support the video tag.
                 </video>
             @else
                 <div class="w-full h-full bg-gray-200 rounded-t-3xl flex items-center justify-center">
                     <span class="text-gray-500">No video available</span>
                 </div>
             @endif
         </div>
     </div>
     <div class="p-6">
         <blockquote class="text-gray-700 italic text-base leading-relaxed mb-4">
             "{{ $text }}"
         </blockquote>
         <div class="flex items-center">
             <div>
                 <h4 class="font-semibold text-gray-900 text-lg">{{ $name }}</h4>
                 @if($title)
                     <p class="text-gray-600 text-sm">{{ $title }}</p>
                 @endif
             </div>
         </div>
     </div>
 </div>
