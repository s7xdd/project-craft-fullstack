@extends('backend.layouts.app')

@section('content')
    <div class="col-lg-8 mx-auto">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0 h6">Coupon Information Adding</h5>
            </div>
            <div class="card-body">
                <form class="form-horizontal" action="{{ route('coupon.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="form-group row">
                        <label class="col-lg-3 col-from-label" for="name">Coupon Type</label>
                        <div class="col-lg-9">
                            <select name="coupon_type" id="coupon_type" class="form-control aiz-selectpicker"
                                onchange="coupon_form()" required>
                                <option value="">Select One</option>
                                <option value="product_base">For Products</option>
                                <option value="cart_base">For Total Orders</option>
                            </select>
                        </div>
                    </div>
                    
                    <div id="coupon_form">
                    </div>

                    <div class="form-group row">
                        <label class="col-lg-3 col-from-label" for="name">Is one time use</label>
                        <div class="col-lg-9">
                            <select name="one_time_use" class="form-control aiz-selectpicker" required>
                                <option value="0">No</option>
                                <option value="1">Yes</option>
                            </select>
                        </div>
                    </div>

                    <div class="form-group mb-0 text-right">
                        <button type="submit" class="btn btn-sm btn-primary">Save</button>
                        <a href="{{ Session::has('coupon_last_url') ? Session::get('coupon_last_url') : route('coupon.index') }}" class="btn btn-sm btn-cancel">{{trans('messages.cancel')}}</a>
                        
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script type="text/javascript">
        function coupon_form() {
            var coupon_type = $('#coupon_type').val();
            $.post('{{ route('coupon.get_coupon_form') }}', {
                _token: '{{ csrf_token() }}',
                coupon_type: coupon_type
            }, function(data) {
                $('#coupon_form').html(data);
            });
        }
    </script>
@endsection
