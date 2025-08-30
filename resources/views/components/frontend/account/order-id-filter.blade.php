<div class="order-id-filter">
    <input type="text" id="orderIdInput" placeholder="{{ $placeholder ?? 'Enter your Email ID' }}" />
    <button type="button" onclick="{{ $onclick ?? 'filterOrders()' }}">
        {{ $buttonText ?? 'Search' }}
    </button>
</div>