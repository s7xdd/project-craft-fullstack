<tr>
    <td class="product-column">
        <div class="product-box">
            <figure class="image-box">
                <img src="{{ $prod['product']['image'] }}" alt="{{ $prod['product']['name'] }}" />
            </figure>
            <div style="display: flex; flex-direction: column">
                <h6>
                    <a
                        href="{{ route('product-detail', ['slug' => $prod['product']['slug'], 'sku' => $prod['product']['sku']]) }}">{{ $prod['product']['name'] }}</a>
                </h6>
                <div style="display: flex; flex-direction: column; text-align: start">
                    @php
                        $attributeValue = '';
                    @endphp
                    @foreach ($prod['product']['attributes'] as $attribute)
                        @php
                            $attributeValue .=
                                ' <strong>' . $attribute['name'] . ':</strong>' . $attribute['value'] . '</p>';
                        @endphp
                    @endforeach
                    @if ($attributeValue != '')
                        <div class="cart-product__variant">{!! $attributeValue !!}</div>
                        &nbsp;&nbsp;&nbsp;
                    @endif

                    <div class="cart-product__variant">{{ trans('messages.brand') }}:
                        {{ $prod['product']['brand'] }}</div>
                </div>
            </div>

        </div>
    </td>
    <td>{{ env('DEFAULT_CURRENCY') . ' ' . $prod['main_price'] }}</td>
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
        <button  data-id="{{ $prod['id'] }}" class="cancel-btn remove-cart-item">
            <i class="far fa-times"></i>
        </button>
    </td>

</tr>
