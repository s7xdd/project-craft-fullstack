<section class="py-16">
    <div class="container mx-auto px-4">
        <div class="text-center mb-8">
            <h2 class="text-3xl font-bold text-gray-900">Your <span class="text-blue-600">Cart</span></h2>
        </div>
        <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
            <div class="lg:col-span-2">
                {{ $cartItems }}
            </div>
            <div class="lg:col-span-1">
                {{ $cartTotals }}
            </div>
        </div>
    </div>
</section>