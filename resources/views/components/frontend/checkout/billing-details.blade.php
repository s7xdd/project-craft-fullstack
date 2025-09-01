@props([
    'countries' => [
        ['value' => '1', 'name' => 'Australia'],
        ['value' => '2', 'name' => 'Belgium'],
        ['value' => '3', 'name' => 'Canada'],
        ['value' => '4', 'name' => 'China'],
        ['value' => '5', 'name' => 'France'],
        ['value' => '6', 'name' => 'Germany'],
        ['value' => '7', 'name' => 'Malaysia'],
        ['value' => '8', 'name' => 'Mexico'],
        ['value' => '9', 'name' => 'Russia'],
        ['value' => '10', 'name' => 'Switzerland'],
        ['value' => '11', 'name' => 'Turkey'],
        ['value' => '12', 'name' => 'United Kingdom']
    ],
    'states' => [
        ['value' => '1', 'name' => 'Australia'],
        ['value' => '2', 'name' => 'Belgium'],
        ['value' => '3', 'name' => 'Canada'],
        ['value' => '4', 'name' => 'China'],
        ['value' => '5', 'name' => 'France'],
        ['value' => '6', 'name' => 'Germany'],
        ['value' => '7', 'name' => 'Malaysia'],
        ['value' => '8', 'name' => 'Mexico'],
        ['value' => '9', 'name' => 'Russia'],
        ['value' => '10', 'name' => 'Switzerland'],
        ['value' => '11', 'name' => 'Turkey'],
        ['value' => '12', 'name' => 'United Kingdom']
    ]
])

<div class="billing-content mr_30">
    <h3>Billing Details</h3>
    <div class="form-inner">
        <form id="checkoutForm" action="{{ route('checkout.process') }}" method="POST">
            @csrf
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 field-column">
                    <div class="form-group">
                        <label>Full Name<span>*</span></label>
                        <input type="text" id="billing_name" name="billing_name" class="form-group__input" value="{{ old('billing_name') }}">
                        @if ($errors->has('billing_name'))
                            <div class="alert alert-danger">{{ $errors->first('billing_name') }}</div>
                        @endif
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 field-column">
                    <div class="form-group">
                        <label>Email Address<span>*</span></label>
                        <input type="email" id="billing_email" name="billing_email" class="form-group__input" value="{{ old('billing_email') }}">
                        @if ($errors->has('billing_email'))
                            <div class="alert alert-danger">{{ $errors->first('billing_email') }}</div>
                        @endif
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 field-column">
                    <div class="form-group">
                        <label>Phone Number<span>*</span></label>
                        <input type="text" id="billing_phone" name="billing_phone" class="form-group__input" value="{{ old('billing_phone') }}">
                        @if ($errors->has('billing_phone'))
                            <div class="alert alert-danger">{{ $errors->first('billing_phone') }}</div>
                        @endif
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 field-column">
                    <div class="form-group">
                        <label>Address<span>*</span></label>
                        <input type="text" id="billing_address" name="billing_address" class="form-group__input" value="{{ old('billing_address') }}">
                        @if ($errors->has('billing_address'))
                            <div class="alert alert-danger">{{ $errors->first('billing_address') }}</div>
                        @endif
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 field-column">
                    <div class="form-group">
                        <label>Town / City<span>*</span></label>
                        <input type="text" id="billing_city" name="billing_city" class="form-group__input" value="{{ old('billing_city') }}">
                        @if ($errors->has('billing_city'))
                            <div class="alert alert-danger">{{ $errors->first('billing_city') }}</div>
                        @endif
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 field-column">
                    <div class="form-group">
                        <label>Postcode / ZIP<span>*</span></label>
                        <input type="text" id="billing_zipcode" name="billing_zipcode" class="form-group__input" value="{{ old('billing_zipcode') }}">
                        @if ($errors->has('billing_zipcode'))
                            <div class="alert alert-danger">{{ $errors->first('billing_zipcode') }}</div>
                        @endif
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 field-column">
                    <div class="form-group">
                        <div class="check-box-two">
                            <input class="check" type="checkbox" id="checkbox2" name="same_as_billing" @if(old('same_as_billing') == 'on') checked @endif>
                            <label for="checkbox2">Ship to a different address</label>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Shipping Address Fields -->
            <div class="shipping-address-fields" id="shippingAddressFields">
                <h3>Shipping Address</h3>
                <div class="row clearfix">
                    <div class="col-lg-12 col-md-12 col-sm-12 field-column">
                        <div class="form-group">
                            <label>Full Name<span>*</span></label>
                            <input type="text" id="shipping_name" name="shipping_name" class="form-group__input" value="{{ old('shipping_name') }}" @if(old('same_as_billing') == 'on') readonly @endif>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 field-column">
                        <div class="form-group">
                            <label>Address<span>*</span></label>
                            <input type="text" id="shipping_address" name="shipping_address" class="form-group__input" value="{{ old('shipping_address') }}" @if(old('same_as_billing') == 'on') readonly @endif>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 field-column">
                        <div class="form-group">
                            <label>Town / City<span>*</span></label>
                            <input type="text" id="shipping_city" name="shipping_city" class="form-group__input" value="{{ old('shipping_city') }}" @if(old('same_as_billing') == 'on') readonly @endif>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 field-column">
                        <div class="form-group">
                            <label>Postcode / ZIP<span>*</span></label>
                            <input type="text" id="shipping_zipcode" name="shipping_zipcode" class="form-group__input" value="{{ old('shipping_zipcode') }}" @if(old('same_as_billing') == 'on') readonly @endif>
                        </div>
                    </div>
                    <div class="col-lg-12 col-md-12 col-sm-12 field-column">
                        <div class="form-group">
                            <label>Phone Number<span>*</span></label>
                            <input type="text" id="shipping_phone" name="shipping_phone" class="form-group__input" value="{{ old('shipping_phone') }}" @if(old('same_as_billing') == 'on') readonly @endif>
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Order Notes -->
            <div class="col-lg-12 col-md-12 col-sm-12 field-column">
                <div class="form-group">
                    <label>Order Notes</label>
                    <textarea name="order_note" class="form-group__textarea" rows="5">{{ old('order_note') }}</textarea>
                </div>
            </div>
            
            <!-- Hidden fields for payment method -->
            <input type="hidden" name="payment_method" id="payment_method" value="cod">
        </form>
    </div>
</div>