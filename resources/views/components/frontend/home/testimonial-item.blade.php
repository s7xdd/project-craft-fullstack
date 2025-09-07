<div class="group bg-white rounded-3xl transition-all duration-500 transform hover:-translate-y-2 overflow-hidden border border-gray-100" style="background-color: #FFFDF7; border-radius: 50px;">
    <div class="relative">
        <div class="aspect-square overflow-hidden" >
            <video autoplay muted loop playsinline 
                   class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-700 rounded-t-6xl">
                <source src="{{ $video }}" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </div>
        
        <!-- Video overlay with play button -->
        <div class="absolute inset-0 bg-black bg-opacity-30 opacity-0 group-hover:opacity-100 transition-opacity duration-300 flex items-center justify-center rounded-t-3xl">
            <div class="w-16 h-16 bg-white bg-opacity-90 rounded-full flex items-center justify-center transform scale-75 group-hover:scale-100 transition-transform duration-300">
                <svg class="w-6 h-6 text-gray-800 ml-1" fill="currentColor" viewBox="0 0 20 20">
                    <path d="M8 5v10l8-5-8-5z"/>
                </svg>
            </div>
        </div>
        
        <!-- Customer badge -->
        <div class="absolute top-4 left-4 bg-white bg-opacity-95 backdrop-blur-sm px-3 py-2 rounded-full">
            <div class="flex items-center space-x-2">
                <div class="w-2 h-2 bg-green-500 rounded-full animate-pulse"></div>
                <!-- <span class="text-sm font-semibold text-gray-800">Customer Story</span> -->
            </div>
        </div>
    </div>
    
    <!-- Customer info (if name is provided) -->
    @if(!empty($name))
    <div class="p-6 text-center">
        <!-- <h4 class="font-semibold text-gray-900 text-lg group-hover:text-blue-600 transition-colors duration-300">{{ $name }}</h4>
        @if(!empty($text))
        <p class="text-gray-600 text-sm mt-2 line-clamp-2">"{{ $text }}"</p>
        @endif -->
    </div>
    @endif
</div>