@php
    $hasChildren = isset($item->child) && count($item->child);
    $isMegamenu = $hasChildren && isset($item->child[0]->child) && count($item->child[0]->child) > 0;
@endphp

@if($hasChildren)
    <li class="relative group">
        <div class="font-bold flex items-center justify-between">
            <a href="{{ $item->link }}" class="flex-1">{{ $item->label }}</a>
            <svg class="w-4 h-4 ml-2 transition-transform group-hover:rotate-180" fill="currentColor" viewBox="0 0 20 20">
                <path fill-rule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clip-rule="evenodd"/>
            </svg>
        </div>
        <ul class="mt-2 min-w-[200px] px-4 bg-white shadow-lg rounded-lg py-2">
            @foreach ($item->child as $child)
            <div class="border-b border-gray-200">
                @include('frontend.parts.menu-item-mobile', ['item' => $child])
            </div>
                
            @endforeach
        </ul>
    </li>
@else
    <li class="py-2">
        <a href="{{ $item->link }}" class="block hover:text-blue-600 transition-colors">{{ $item->label }}</a>
    </li>
@endif
