@php
    $hasChildren = isset($item->child) && count($item->child);
    $isMegamenu = $hasChildren;
@endphp

@if ($isMegamenu)
    {{-- Mega Menu Item --}}
    <li class="relative group">
        <a href="{{ $item->link }}"
            class="flex items-center gap-1 py-2 text-gray-700 hover:text-blue-600 font-medium transition-colors">
            {{ $item->label }}
            <i class="fas fa-chevron-down text-xs transition-transform group-hover:rotate-180"></i>
        </a>

        {{-- Mega Menu Dropdown --}}
        <div
            class="absolute left-1/2 -translate-x-1/2 top-full pt-2 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50">
            <div class="bg-white rounded-lg shadow-xl border border-gray-200 p-6 w-[720px]">
                <div class="grid grid-cols-3 gap-6">
                    @foreach ($item->child as $group)
                        <div class="space-y-3">
                            {{-- Category Header --}}
                            <a href="{{ $group->link }}"
                                class="block font-semibold text-gray-900 hover:text-blue-600 transition-colors pb-2 border-b border-gray-200">
                                {{ $group->label }}
                            </a>

                            {{-- Subcategory Links --}}
                            @if (isset($group->child) && count($group->child))
                                <ul class="space-y-2">
                                    @foreach ($group->child as $sub)
                                        <li>
                                            <a href="{{ $sub->link }}"
                                                class="block text-sm text-gray-600 hover:text-blue-600 hover:translate-x-1 transition-all duration-200 py-1">
                                                {{ $sub->label }}
                                            </a>
                                        </li>
                                    @endforeach
                                </ul>
                            @endif
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </li>
@elseif($hasChildren)
    {{-- Simple Dropdown --}}
    <li class="relative group">
        <a href="{{ $item->link }}"
            class="flex items-center gap-1 py-2 text-gray-700 hover:text-blue-600 font-medium transition-colors">
            {{ $item->label }}
            <i class="fas fa-chevron-down text-xs transition-transform group-hover:rotate-180"></i>
        </a>
        <ul
            class="absolute left-0 top-full pt-2 min-w-[200px] opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-200 z-50">
            <div class="bg-white rounded-lg shadow-lg border border-gray-200 py-2">
                @foreach ($item->child as $child)
                    @include('frontend.parts.menu-item', ['item' => $child])
                @endforeach
            </div>
        </ul>
    </li>
@else
    {{-- Simple Link --}}
    <li>
        <a href="{{ $item->link }}"
            class="block py-2 text-gray-700 hover:text-blue-600 font-medium transition-colors">
            {{ $item->label }}
        </a>
    </li>
@endif
