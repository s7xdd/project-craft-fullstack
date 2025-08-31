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
        <form method="post" action="checkout.html">
            <div class="row clearfix">
                <div class="col-lg-6 col-md-6 col-sm-12 field-column">
                    <div class="form-group">
                        <label>First Name<span>*</span></label>
                        <input type="text" name="fname">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 field-column">
                    <div class="form-group">
                        <label>Last Name<span>*</span></label>
                        <input type="text" name="lname">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 field-column">
                    <div class="form-group">
                        <label>Email Address<span>*</span></label>
                        <input type="email" name="email">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 field-column">
                    <div class="form-group">
                        <label>Phone Number<span>*</span></label>
                        <input type="text" name="phone">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 field-column">
                    <div class="form-group">
                        <label>Country<span>*</span></label>
                        <div class="select-box">
                            <select class="wide">
                                <option data-display="Select Country">Select Country</option>
                                @foreach($countries as $country)
                                <option value="{{ $country['value'] }}">{{ $country['name'] }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 field-column">
                    <div class="form-group">
                        <label>State<span>*</span></label>
                        <div class="select-box">
                            <select class="wide">
                                <option data-display="Select State">Select State</option>
                                @foreach($states as $state)
                                <option value="{{ $state['value'] }}">{{ $state['name'] }}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 field-column">
                    <div class="form-group">
                        <label>Address<span>*</span></label>
                        <input type="text" name="address">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 field-column">
                    <div class="form-group">
                        <label>Town / City<span>*</span></label>
                        <input type="text" name="city">
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12 field-column">
                    <div class="form-group">
                        <label>Postcode / ZIP<span>*</span></label>
                        <input type="text" name="zip">
                    </div>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 field-column">
                    <div class="form-group">
                        <div class="check-box-two">
                            <input class="check" type="checkbox" id="checkbox1">
                            <label for="checkbox1">Create an account?</label>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <div class="other-address">
        <h3>Shipping Address</h3>
        <div class="check-box-two">
            <input class="check" type="checkbox" id="checkbox2">
            <label for="checkbox2">Ship to a different address</label>
        </div>
    </div>
</div>