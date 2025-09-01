<tr class="border-b">
    <td class="product-column py-4">
        <div class="product-box flex space-x-4 items-start">
            <figure class="image-box w-20 flex-shrink-0">
                <img src="{{ $prod['product']['image'] }}" alt="{{ $prod['product']['name'] }}"
                    class="w-full h-auto object-cover rounded" />
            </figure>
            <div class="flex flex-col text-left">
                <h6 class="text-lg font-semibold mb-1">
                    <a href="{{ route('product-detail', ['slug' => $prod['product']['slug'], 'sku' => $prod['product']['sku']]) }}"
                        class="text-blue-600 hover:underline">
                        {{ $prod['product']['name'] }}
                    </a>
                </h6>

                @php
                    $attributeValue = '';
                    foreach ($prod['product']['attributes'] as $attribute) {
                        $attributeValue .=
                            ' <strong>' . $attribute['name'] . ':</strong> ' . $attribute['value'] . '<br />';
                    }
                @endphp

                @if ($attributeValue != '')
                    <div class="cart-product__variant text-sm text-gray-600 mb-1 leading-relaxed">
                        {!! $attributeValue !!}
                    </div>
                @endif

                <div class="cart-product__variant text-sm text-gray-600">
                    {{ trans('messages.brand') }}: {{ $prod['product']['brand'] }}
                </div>
            </div>
        </div>
    </td>

    <td class="py-4 text-center whitespace-nowrap">
        {{ env('DEFAULT_CURRENCY') . ' ' . $prod['main_price'] }}
    </td>

    <td class="qty" style="text-align: center; vertical-align: middle;">
        <div class="cart-product__quantity-field"
            style="display: inline-flex; align-items: center; justify-content: center;">
            <div class="quantity-field__minus change_quantity" style="cursor: pointer" data-action="minus"
                data-id="{{ $prod['id'] }}">-</div>
            <input type="text" value="{{ $prod['quantity'] }}" class="quantity-field__input"
                id="quantity-field_{{ $prod['id'] }}" />
            <div class="quantity-field__plus change_quantity" data-action="plus" style="cursor: pointer"
                data-id="{{ $prod['id'] }}">+</div>
        </div>
    </td>

    <td>{{ env('DEFAULT_CURRENCY') . ' ' . $prod['total'] }}</td>
    <td class="cart-product__delete">
        <button data-id="{{ $prod['id'] }}" class="cancel-btn remove-cart-item">
            <i class="far fa-times"></i>
        </button>
    </td>
</tr>
