<x-frontend.products.pagination>
    @if ($paginator->hasPages())
        {{-- Previous Page Link --}}
        @if ($paginator->onFirstPage())
            <x-frontend.products.pagination-item link="javascript:void(0)" icon="icon-29" class="disabled" />
        @else
            <x-frontend.products.pagination-item link="{{ $paginator->previousPageUrl() }}" icon="icon-29" />
        @endif

        {{-- Pagination Elements --}}
        @foreach ($elements as $element)
            {{-- "Three Dots" Separator --}}
            @if (is_string($element))
                <x-frontend.products.pagination-item link="javascript:void(0)" text="{{ $element }}" class="disabled" />
            @endif

            {{-- Array Of Links --}}
            @if (is_array($element))
                @foreach ($element as $page => $url)
                    @if ($page == $paginator->currentPage())
                        <x-frontend.products.pagination-item link="javascript:void(0)" text="{{ $page }}" class="current" />
                    @else
                        <x-frontend.products.pagination-item link="{{ $url }}" text="{{ $page }}" />
                    @endif
                @endforeach
            @endif
        @endforeach

        {{-- Next Page Link --}}
        @if ($paginator->hasMorePages())
            <x-frontend.products.pagination-item link="{{ $paginator->nextPageUrl() }}" icon="icon-30" />
        @else
            <x-frontend.products.pagination-item link="javascript:void(0)" icon="icon-30" class="disabled" />
        @endif
    @endif
</x-frontend.products.pagination>
