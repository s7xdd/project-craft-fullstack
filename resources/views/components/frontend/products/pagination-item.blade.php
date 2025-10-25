<li>
    <a href="{!! $link !!}"
       class="inline-flex items-center justify-center px-3 py-2 rounded-md text-sm font-medium transition-colors
              {{ isset($class) && $class == 'current' ? 'bg-blue-500 text-white' : 'text-gray-700 hover:bg-gray-100' }}
              {{ isset($class) && $class == 'disabled' ? 'text-gray-400 cursor-not-allowed' : '' }}">
        @if (isset($icon))
            <i class="{{ $icon }}"></i>
        @else
            {{ $text }}
        @endif
    </a>
</li>
