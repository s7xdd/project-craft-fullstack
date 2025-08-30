<tr>
    <td class="product-column">
        <div class="product-box">
            <figure class="image-box">
                <img src="{{ $image }}" alt="{{ $alt }}" />
            </figure>
            <h6>
                <a href="{{ $link }}">{{ $name }}</a>
            </h6>
        </div>
    </td>
    <td>{{ $price }}</td>
    <td class="qty">
        <div class="item-quantity">
            <input class="quantity-spinner" type="text" value="{{ $quantity }}" name="quantity" />
        </div>
    </td>
    <td>{{ $total }}</td>
    <td>
        <button class="cancel-btn">
            <i class="far fa-times"></i>
        </button>
    </td>
</tr>