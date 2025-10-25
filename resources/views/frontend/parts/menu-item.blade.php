@php
    $hasChildren = isset($item->child) && count($item->child);
    $isMegamenu = $hasChildren ;
@endphp

@if ($isMegamenu)
    <li class="dropdown relative group">
    <a href="{{ $item->link }}">{{ $item->label }} <i class="fas fa-chevron-down menu-arrow"></i></a>
    <div class="megamenu absolute left-1/2 -translate-x-1/2 top-6 w-[450px] rounded-lg bg-blue-300 shadow-lg p-4 z-50 lg:hidden group-hover:lg:flex lg:justify-center lg:items-start hidden">
        <div class="grid grid-cols-3 gap-4">
        @foreach ($item->child as $group)
            <div class="bg-green-100 p-2 rounded-lg flex items-center justify-center">
            <ul class="megamenu-column">
                <li>
                <a href="{{ $group->link }}">{{ $group->label }}</a>
                </li>
                @if (isset($group->child) && count($group->child))
                @foreach ($group->child as $sub)
                    <li class="bg-red-100 text-xs px-1 mb-1 rounded-lg flex items-center justify-center">
                    <a href="{{ $sub->link }}">{{ $sub->label }}</a>
                    </li>
                @endforeach
                @endif
            </ul>
            </div>
        @endforeach
        </div>
    </div>
</li>

@elseif($hasChildren)
    <li class="dropdown">
        <a href="{{ $item->link }}">{{ $item->label }} <i class="fas fa-chevron-down menu-arrow"></i></a>
        <ul class="submenu">
            @foreach ($item->child as $child)
                @include('frontend.parts.menu-item', ['item' => $child])
            @endforeach
        </ul>
    </li>
@else
    <li>
        <a href="{{ $item->link }}">{{ $item->label }}</a>
    </li>
@endif
