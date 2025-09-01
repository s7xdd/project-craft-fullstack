<div class="order-id-filter flex justify-center items-center space-x-2">
    <input
        type="text"
        id="orderIdInput"
        placeholder="{{ $placeholder ?? 'Enter your Email ID' }}"
        class="border border-gray-300 rounded px-4 py-2 w-64 focus:outline-none focus:ring-2 focus:ring-blue-500"
    />
    <button
        type="button"
        onclick="{{ $onclick ?? 'filterOrders()' }}"
        class="!bg-black text-white rounded px-4 py-2 transition-colors"
    >
        {{ $buttonText ?? 'Search' }}
    </button>
</div>
