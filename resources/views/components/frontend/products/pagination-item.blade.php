<li>
    <a href="{!! $link !!}" class="{{ $class ?? '' }}">
        @if (isset($icon))
            <i class="{{ $icon ?? '' }}"></i>
        @else
            {{ $text }}
        @endif
    </a>
</li>
