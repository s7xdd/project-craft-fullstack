<div class="cart-item-card pb-2">
    <div class="cart-item-content">
        <div class="cart-item-image">
            <img src="{{ $prod['product']['image'] }}" alt="{{ $prod['product']['name'] }}"
                class="product-image" />
        </div>

        <div class="cart-item-details">
            <h4 class="product-title">
                <a href="{{ route('product-detail', ['slug' => $prod['product']['slug'], 'sku' => $prod['product']['sku']]) }}"
                    class="product-link">
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
                <div class="product-variants">
                    {!! $attributeValue !!}
                </div>
            @endif

            <!-- <div class="product-brand">
                {{ trans('messages.brand') }}: {{ $prod['product']['brand'] }}
            </div> -->
        </div>

        <div class="cart-item-price">
            <div class="price-label">{{ trans('messages.price') }}</div>
            <div class="price-value">{{ env('DEFAULT_CURRENCY') . ' ' . $prod['main_price'] }}</div>
        </div>

        <div class="cart-item-quantity">
            <div class="quantity-controls">
                <button class="quantity-btn quantity-minus change_quantity" data-action="minus"
                    data-id="{{ $prod['id'] }}">
                    <i class="fas fa-minus"></i>
                </button>
                <input type="text" value="{{ $prod['quantity'] }}" class="quantity-input"
                    id="quantity-field_{{ $prod['id'] }}" readonly />
                <button class="quantity-btn quantity-plus change_quantity" data-action="plus"
                    data-id="{{ $prod['id'] }}">
                    <i class="fas fa-plus"></i>
                </button>
            </div>
        </div>

        <div class="cart-item-total">
            <div class="total-label">{{ trans('messages.total') }}</div>
            <div class="total-value">{{ env('DEFAULT_CURRENCY') . ' ' . $prod['total'] }}</div>
        </div>

        <div class="cart-item-actions">
            <button data-id="{{ $prod['id'] }}" class="remove-btn remove-cart-item">
                <i class="fas fa-trash-alt"></i>
            </button>
        </div>
    </div>

    <!-- Mobile Layout -->
    <div class="cart-item-mobile-actions d-md-none">
        <div class="cart-item-mobile-price">
            <div class="price-label">{{ trans('messages.price') }}</div>
            <div class="price-value">{{ env('DEFAULT_CURRENCY') . ' ' . $prod['main_price'] }}</div>
        </div>

        <div class="cart-item-mobile-quantity">
            <div class="quantity-controls">
                <button class="quantity-btn quantity-minus change_quantity" data-action="minus"
                    data-id="{{ $prod['id'] }}">
                    <i class="fas fa-minus"></i>
                </button>
                <input type="text" value="{{ $prod['quantity'] }}" class="quantity-input"
                    id="quantity-field-mobile_{{ $prod['id'] }}" readonly />
                <button class="quantity-btn quantity-plus change_quantity" data-action="plus"
                    data-id="{{ $prod['id'] }}">
                    <i class="fas fa-plus"></i>
                </button>
            </div>
        </div>

        <div class="cart-item-mobile-total">
            <div class="total-label">{{ trans('messages.total') }}</div>
            <div class="total-value">{{ env('DEFAULT_CURRENCY') . ' ' . $prod['total'] }}</div>
        </div>

        <div class="cart-item-mobile-remove">
            <button data-id="{{ $prod['id'] }}" class="remove-btn remove-cart-item">
                <i class="fas fa-trash-alt"></i>
            </button>
        </div>
    </div>
</div>