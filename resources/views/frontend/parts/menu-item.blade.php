@php
    $hasChildren = isset($item->child) && count($item->child);
    $isMegamenu = $hasChildren ;
@endphp

@if ($isMegamenu)
    <li class="dropdown relative group">
    <a href="{{ $item->link }}">{{ $item->label }} <i class="fas fa-chevron-down menu-arrow"></i></a>
    <div class="megamenu absolute left-0 top-6 w-[450px] rounded-lg bg-gray-50 border border-gray-200 shadow-lg p-4 z-50 lg:hidden group-hover:lg:flex lg:justify-center lg:items-start hidden">
        <div class="grid grid-cols-3 gap-4">
        @foreach ($item->child as $group)
            <div class="bg-white p-2 rounded-lg shadow-lg border-1 border-gray-100 flex items-center justify-center hover:shadow-xl hover:bg-green-50 hover:scale-105 transition-all duration-300">
            <ul class="megamenu-column">
                <li>
                <a href="{{ $group->link }}">{{ $group->label }}</a>
                </li>
                @if (isset($group->child) && count($group->child))
                <div class = "bg-white rounded-lg shadow-lg border border-gray-200 p-2 mt-2">
                    @foreach ($group->child as $sub)
                    <li class="text-xs px-2 py-1 mb-1 flex items-center border-b border-gray-200 hover:text-blue-600 hover:bg-blue-50 transition-all duration-300">
                    <a href="{{ $sub->link }}">{{ $sub->label }}</a>
                    </li>
                @endforeach
            </div>
                
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
