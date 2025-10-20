<div class="group bg-white rounded-3xl transition-all duration-500 transform hover:-translate-y-2 overflow-hidden border border-gray-100"
    style="background-color: #FFFDF7; border-radius: 50px;">
    <div class="relative">
        <div class="aspect-square overflow-hidden">
            @if (!empty($video))
                <video controls muted loop playsinline class="w-full h-full object-cover rounded-t-6xl">
                    <source src="{{ $video }}">
                    Your browser does not support the video tag.
                </video>
            @else
                <div class="w-full h-full bg-gray-200 rounded-t-6xl flex items-center justify-center">
                    <span class="text-gray-500">No video available</span>
                </div>
            @endif
        </div>

    </div>
</div>
