<div class="flex flex-col gap-6">
    <div class="bg-white rounded-lg shadow-md p-4">
        <h2 class="text-lg font-semibold mb-4">{{ trans('messages.category') }}</h2>
        @if (!empty($categories))
            <ul class="space-y-2">
                @foreach ($categories as $cat)
                    <li>
                        <a href="{{ route('products.index', ['category' => $cat->getTranslation('slug', $lang)]) }}"
                           class="block text-gray-700 hover:text-blue-500 transition-colors {{ $category == $cat->getTranslation('slug', $lang) ? 'font-semibold text-blue-500' : '' }}">
                            {{ $cat->getTranslation('name', $lang) }}
                        </a>
                    </li>
                @endforeach
            </ul>
        @endif
    </div>
    {{-- Uncomment and convert brands/price if needed --}}
</div>
