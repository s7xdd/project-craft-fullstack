@extends('backend.layouts.app')

@section('content')
    <div class="aiz-titlebar text-left mt-2 mb-3">
        <h5 class="mb-0 h6">{{ 'Shipping Configuration' }}</h5>
    </div>

    <div class="row">
        <div class="col-xxl-10 col-md-10 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0 h6">{{ 'Shipping Configuration' }}</h5>
                </div>
                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('business_settings.update') }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf
                        <div class="form-group row">
                            <div class="col-md-4">
                                <label class="col-from-label">{{ 'Free Shipping Status' }}</label>
                            </div>
                            <div class="col-md-8">
                                <label class="aiz-switch aiz-switch-success mb-0">
                                    <input value="1" name="free_shipping_status" type="checkbox"
                                        @if (get_setting('free_shipping_status') == 1) checked @endif>
                                    <span class="slider round"></span>
                                </label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-4">
                                <label class="col-from-label">{{ 'Minimum Order Amount for Free Shipping' }}</label>
                            </div>
                            <div class="col-md-8">
                                <input type="number" lang="en" min="0" step="0.01"
                                    placeholder="{{ 'Minimum Order Amount for Free Shipping' }}"
                                    name="free_shipping_min_amount" class="form-control"
                                    value="{{ get_setting('free_shipping_min_amount') }}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <div class="col-md-4">
                                <label class="col-from-label">{{ 'Default Shipping Charge' }}</label>
                            </div>
                            <div class="col-md-8">
                                <input type="number" lang="en" min="0" step="0.01"
                                    placeholder="{{ 'Default Shipping Charge' }}" name="default_shipping_amount"
                                    class="form-control" value="{{ get_setting('default_shipping_amount') }}">
                            </div>
                        </div>
                        <div class="form-group mb-0 text-right">
                            <button type="submit" class="btn btn-sm btn-primary">{{ 'Save' }}</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
