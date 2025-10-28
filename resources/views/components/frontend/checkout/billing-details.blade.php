
<div class="bg-white p-6 rounded-lg shadow-md">
    <h3 class="text-2xl font-semibold mb-6">Billing Details</h3>
    <div>
        <form id="checkoutForm" action="{{ route('checkout.process') }}" method="POST">
            @csrf
            <div class="space-y-4">
                <div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-1">Full Name<span class="text-red-500">*</span></label>
                        <input type="text" id="billing_name" name="billing_name" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" value="{{ old('billing_name') }}">
                        @if ($errors->has('billing_name'))
                            <div class="mt-1 text-sm text-red-600">{{ $errors->first('billing_name') }}</div>
                        @endif
                    </div>
                </div>
                <div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-1">Email Address<span class="text-red-500">*</span></label>
                        <input type="email" id="billing_email" name="billing_email" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" value="{{ old('billing_email') }}">
                        @if ($errors->has('billing_email'))
                            <div class="mt-1 text-sm text-red-600">{{ $errors->first('billing_email') }}</div>
                        @endif
                    </div>
                </div>
                <div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-1">Phone Number<span class="text-red-500">*</span></label>
                        <input type="text" id="billing_phone" name="billing_phone" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" value="{{ old('billing_phone') }}">
                        @if ($errors->has('billing_phone'))
                            <div class="mt-1 text-sm text-red-600">{{ $errors->first('billing_phone') }}</div>
                        @endif
                    </div>
                </div>
                <div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-1">Address<span class="text-red-500">*</span></label>
                        <input type="text" id="billing_address" name="billing_address" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" value="{{ old('billing_address') }}">
                        @if ($errors->has('billing_address'))
                            <div class="mt-1 text-sm text-red-600">{{ $errors->first('billing_address') }}</div>
                        @endif
                    </div>
                </div>
                <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-1">Town / City<span class="text-red-500">*</span></label>
                        <input type="text" id="billing_city" name="billing_city" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" value="{{ old('billing_city') }}">
                        @if ($errors->has('billing_city'))
                            <div class="mt-1 text-sm text-red-600">{{ $errors->first('billing_city') }}</div>
                        @endif
                    </div>
                    <div class="mb-4">
                        <label class="block text-sm font-medium text-gray-700 mb-1">Postcode / ZIP<span class="text-red-500">*</span></label>
                        <input type="text" id="billing_zipcode" name="billing_zipcode" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" value="{{ old('billing_zipcode') }}">
                        @if ($errors->has('billing_zipcode'))
                            <div class="mt-1 text-sm text-red-600">{{ $errors->first('billing_zipcode') }}</div>
                        @endif
                    </div>
                </div>
            </div>
            
            <div class="shipping-address-fields" id="shippingAddressFields">
                <h3 class="text-xl font-semibold mb-4">Shipping Address</h3>
                <div class="space-y-4">
                    <div>
                        <div class="mb-4">
                            <label class="block text-sm font-medium text-gray-700 mb-1">Full Name<span class="text-red-500">*</span></label>
                            <input type="text" id="shipping_name" name="shipping_name" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" value="{{ old('shipping_name') }}" @if(old('same_as_billing') == 'on') readonly @endif>
                        </div>
                    </div>
                    <div>
                        <div class="mb-4">
                            <label class="block text-sm font-medium text-gray-700 mb-1">Address<span class="text-red-500">*</span></label>
                            <input type="text" id="shipping_address" name="shipping_address" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" value="{{ old('shipping_address') }}" @if(old('same_as_billing') == 'on') readonly @endif>
                        </div>
                    </div>
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <div class="mb-4">
                            <label class="block text-sm font-medium text-gray-700 mb-1">Town / City<span class="text-red-500">*</span></label>
                            <input type="text" id="shipping_city" name="shipping_city" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" value="{{ old('shipping_city') }}" @if(old('same_as_billing') == 'on') readonly @endif>
                        </div>
                        <div class="mb-4">
                            <label class="block text-sm font-medium text-gray-700 mb-1">Postcode / ZIP<span class="text-red-500">*</span></label>
                            <input type="text" id="shipping_zipcode" name="shipping_zipcode" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" value="{{ old('shipping_zipcode') }}" @if(old('same_as_billing') == 'on') readonly @endif>
                        </div>
                    </div>
                    <div>
                        <div class="mb-4">
                            <label class="block text-sm font-medium text-gray-700 mb-1">Phone Number<span class="text-red-500">*</span></label>
                            <input type="text" id="shipping_phone" name="shipping_phone" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" value="{{ old('shipping_phone') }}" @if(old('same_as_billing') == 'on') readonly @endif>
                        </div>
                    </div>
                </div>
            </div>
            
            <div>
                <div class="mb-4">
                    <label class="block text-sm font-medium text-gray-700 mb-1">Order Notes</label>
                    <textarea name="order_note" rows="5" class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500 resize-vertical">{{ old('order_note') }}</textarea>
                </div>
            </div>
            
            <input type="hidden" name="payment_method" id="payment_method" value="razorpay">
            {{-- <input type="hidden" name="payment_method" id="payment_method" value="cod"> --}}
        </form>
    </div>
</div>