<div class="bg-white border border-gray-200 rounded-lg shadow-sm hover:shadow-md transition-shadow duration-300 overflow-hidden">
    <!-- Desktop Layout -->
    <div class="hidden md:grid grid-cols-[100px_1fr_auto_auto_auto_auto] gap-5 items-center p-5">
        <div class="flex-shrink-0">
            <img src="{{ $prod['product']['image'] }}" alt="{{ $prod['product']['name'] }}"
                class="w-20 h-20 object-cover rounded-lg border border-gray-200" />
        </div>

        <div class="min-w-0 flex-1">
            <h4 class="text-lg font-semibold mb-2">
                <a href="{{ route('product-detail', ['slug' => $prod['product']['slug'], 'sku' => $prod['product']['sku']]) }}"
                    class="text-gray-900 hover:text-blue-600 no-underline transition-colors">
                    {{ $prod['product']['name'] }}
                </a>
            </h4>

            @php
                $attributeValue = '';
                foreach ($prod['product']['attributes'] as $attribute) {
                    $attributeValue .=
                        ' <strong>' . $attribute['name'] . ':</strong> ' . $attribute['value'] . '<br />';
                }
            @endphp

            @if ($attributeValue != '')
                <div class="text-sm text-gray-600 mb-1">
                    {!! $attributeValue !!}
                </div>
            @endif
        </div>

        <div class="text-center min-w-[100px]">
            <div class="text-xs uppercase font-semibold text-gray-600 mb-1">{{ trans('messages.price') }}</div>
            <div class="text-lg font-bold text-gray-900">{{ env('DEFAULT_CURRENCY') . ' ' . $prod['main_price'] }}</div>
        </div>

        <div class="flex items-center justify-center min-w-[120px]">
            <div class="flex items-center border border-gray-300 rounded-lg overflow-hidden">
                <button class="bg-gray-50 border-none w-8 h-8 flex items-center justify-center cursor-pointer hover:bg-gray-200 transition-colors text-gray-600 hover:text-gray-800 change_quantity" data-action="minus"
                    data-id="{{ $prod['id'] }}">
                    <i class="fas fa-minus text-xs"></i>
                </button>
                <input type="text" value="{{ $prod['quantity'] }}" class="w-12 h-8 border-none text-center text-sm font-semibold text-gray-900 bg-white border-l border-r border-gray-300"
                    id="quantity-field_{{ $prod['id'] }}" readonly />
                <button class="bg-gray-50 border-none w-8 h-8 flex items-center justify-center cursor-pointer hover:bg-gray-200 transition-colors text-gray-600 hover:text-gray-800 change_quantity" data-action="plus"
                    data-id="{{ $prod['id'] }}">
                    <i class="fas fa-plus text-xs"></i>
                </button>
            </div>
        </div>

        <div class="text-center min-w-[100px]">
            <div class="text-xs uppercase font-semibold text-gray-600 mb-1">{{ trans('messages.total') }}</div>
            <div class="text-lg font-bold text-gray-900">{{ env('DEFAULT_CURRENCY') . ' ' . $prod['total'] }}</div>
        </div>

        <div class="flex items-center justify-center min-w-[50px]">
            <button data-id="{{ $prod['id'] }}" class="bg-transparent border-none w-9 h-9 rounded-md flex items-center justify-center cursor-pointer transition-colors text-gray-600 hover:bg-red-50 hover:text-red-600 remove-cart-item">
                <i class="fas fa-trash-alt text-sm"></i>
            </button>
        </div>
    </div>

    <!-- Mobile Layout -->
    <div class="md:hidden p-4">
        <div class="flex gap-4 mb-4">
            <img src="{{ $prod['product']['image'] }}" alt="{{ $prod['product']['name'] }}"
                class="w-16 h-16 object-cover rounded-lg border border-gray-200 flex-shrink-0" />
            <div class="flex-1 min-w-0">
                <h4 class="text-base font-semibold mb-1">
                    <a href="{{ route('product-detail', ['slug' => $prod['product']['slug'], 'sku' => $prod['product']['sku']]) }}"
                        class="text-gray-900 hover:text-blue-600 no-underline transition-colors">
                        {{ $prod['product']['name'] }}
                    </a>
                </h4>

                @if ($attributeValue != '')
                    <div class="text-sm text-gray-600">
                        {!! $attributeValue !!}
                    </div>
                @endif
            </div>
        </div>

        <div class="flex items-center justify-between gap-1 pt-4 border-t border-gray-200">
            <div class="text-center flex-1">
                <div class="text-xs uppercase font-semibold text-gray-600 mb-1">{{ trans('messages.price') }}</div>
                <div class="text-sm md:text-md font-bold text-gray-900">{{ env('DEFAULT_CURRENCY') . ' ' . $prod['main_price'] }}</div>
            </div>

            <div class="flex items-center justify-center flex-1">
                <div class="flex items-center border border-gray-300 rounded-lg overflow-hidden">
                    <button class="bg-gray-50 border-none w-7 h-7 flex items-center justify-center cursor-pointer hover:bg-gray-200 transition-colors text-gray-600 hover:text-gray-800 change_quantity" data-action="minus"
                        data-id="{{ $prod['id'] }}">
                        <i class="fas fa-minus text-xs"></i>
                    </button>
                    <input type="text" value="{{ $prod['quantity'] }}" class="w-10 h-7 border-none text-center text-sm font-semibold text-gray-900 bg-white border-l border-r border-gray-300"
                        id="quantity-field-mobile_{{ $prod['id'] }}" readonly />
                    <button class="bg-gray-50 border-none w-7 h-7 flex items-center justify-center cursor-pointer hover:bg-gray-200 transition-colors text-gray-600 hover:text-gray-800 change_quantity" data-action="plus"
                        data-id="{{ $prod['id'] }}">
                        <i class="fas fa-plus text-xs"></i>
                    </button>
                </div>
            </div>

            <div class="text-center flex-1">
                <div class="text-xs uppercase font-semibold text-gray-600 mb-1">{{ trans('messages.total') }}</div>
                <div class="text-sm md:text-md font-bold text-gray-900">{{ env('DEFAULT_CURRENCY') . ' ' . $prod['total'] }}</div>
            </div>

            <div class="flex-shrink-0">
                <button data-id="{{ $prod['id'] }}" class="bg-transparent border-none w-8 h-8 rounded-md flex items-center justify-center cursor-pointer transition-colors text-gray-600 hover:bg-red-50 hover:text-red-600 remove-cart-item">
                    <i class="fas fa-trash-alt text-sm"></i>
                </button>
            </div>
        </div>
    </div>
</div>