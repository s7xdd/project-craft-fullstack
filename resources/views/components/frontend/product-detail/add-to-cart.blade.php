<div class="addto-cart-box mb_40">
    <ul class="clearfix">
        <li class="item-quantity">
            <input class="quantity-spinner" type="text" value="{{ $quantity ?? '1' }}" name="quantity" />
        </li>
        <li class="cart-btn">
            <button class="pink-button" type="button">
                Add to cart
            </button>
        </li>
        <li>
            <a href="{{ $returnLink ?? '#' }}"><i class="far fa-reply"></i></a>
        </li>
        <li class="like-btn">
            <button>
                <i class="far fa-heart"></i>
            </button>
        </li>
    </ul>
</div>