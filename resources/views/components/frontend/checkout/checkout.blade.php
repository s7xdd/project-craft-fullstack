<section class="checkout-section pb_150">
    <div class="large-container">
        <div class="sec-title centred pb_30">
            <h2>The <span>Checkout</span></h2>
        </div>
        <div class="row clearfix">
            <div class="col-lg-8 col-md-12 col-sm-12 billing-column">
                @include('components.frontend.checkout.billing-details')
            </div>
            <div class="col-lg-4 col-md-12 col-sm-12 order-column">
                @include('components.frontend.checkout.order-summary')
            </div>
        </div>
    </div>
</section>

@push('scripts')
    <script>
        $(document).ready(function() {
            $('#applyCouponForm').on('submit', function(e) {
                e.preventDefault();

                var couponCode = $('#couponCode').val();
                var coupon_action = $('#coupon_action').val();
                coupon_action = coupon_action.trim();

                var url = '';
                if (String(coupon_action) === "add") {
                    url = "{{ route('coupon-apply') }}";
                } else {
                    url = "{{ route('coupon-remove') }}";
                }

                $.ajax({
                    url: url,
                    type: 'POST',
                    data: {
                        coupon: couponCode,
                        _token: $('meta[name="csrf-token"]').attr('content')
                    },
                    success: function(response) {
                        if (response.success) {
                            $('#couponMessage').html('<span style="color: green;">' + response
                                .message + '</span>');
                            window.location.reload();
                        } else {
                            $('#couponMessage').html('<span style="color: red;">' + response
                                .message + '</span>');
                        }
                    },
                    error: function(xhr, status, error) {
                        $('#couponMessage').html(
                            '<span style="color: red;">An error occurred. Please try again.</span>'
                        );
                    }
                });
            });

            $('#checkbox2').on('change', function() {
                if ($(this).is(':checked')) {
                    $('#shippingAddressFields').show();
                    $('#shipping_name').val('').prop('readonly', false);
                    $('#shipping_address').val('').prop('readonly', false);
                    $('#shipping_city').val('').prop('readonly', false);
                    $('#shipping_zipcode').val('').prop('readonly', false);
                    $('#shipping_phone').val('').prop('readonly', false);
                } else {
                    $('#shippingAddressFields').hide();
                    $('#shipping_name').val($('#billing_name').val()).prop('readonly', true);
                    $('#shipping_address').val($('#billing_address').val()).prop('readonly', true);
                    $('#shipping_city').val($('#billing_city').val()).prop('readonly', true);
                    $('#shipping_zipcode').val($('#billing_zipcode').val()).prop('readonly', true);
                    $('#shipping_phone').val($('#billing_phone').val()).prop('readonly', true);
                }
            });

            if ($('#checkbox2').is(':checked')) {
                $('#shippingAddressFields').show();
            } else {
                $('#shippingAddressFields').hide();
                $('#shipping_name').val($('#billing_name').val()).prop('readonly', true);
                $('#shipping_address').val($('#billing_address').val()).prop('readonly', true);
                $('#shipping_city').val($('#billing_city').val()).prop('readonly', true);
                $('#shipping_zipcode').val($('#billing_zipcode').val()).prop('readonly', true);
                $('#shipping_phone').val($('#billing_phone').val()).prop('readonly', true);
            }

            $('input[name="payment-method"]').click(function() {
                var selectedPaymentMethod = $(this).val();
                $('#payment_method').val(selectedPaymentMethod);
            });

            $('#submitCheckout').on('click', function() {
                $('#checkoutForm').submit();
            });

            $('#billing_name, #billing_address, #billing_city, #billing_zipcode, #billing_phone').on('input',
                function() {
                    if (!$('#checkbox2').is(':checked')) {
                        $('#shipping_name').val($('#billing_name').val());
                        $('#shipping_address').val($('#billing_address').val());
                        $('#shipping_city').val($('#billing_city').val());
                        $('#shipping_zipcode').val($('#billing_zipcode').val());
                        $('#shipping_phone').val($('#billing_phone').val());
                    }
                });
        });
    </script>
@endpush
