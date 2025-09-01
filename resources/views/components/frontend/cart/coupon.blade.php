<div class="coupon-box" style="padding-top: 30px ">
    <form id="applyCouponForm" method="POST">
        <div class="form-group">
            <input type="text" id="couponCode" name="couponCode" placeholder="{{ $placeholder ?? 'Apply Coupon' }}"
                value="{{ $response['summary']['coupon_code'] }}" />
            <input type="hidden" name="coupon_action" id="coupon_action"
                value="@if ($response['summary']['coupon_applied'] == 1) remove @else add @endif ">
            <button type="submit">
                <i class="icon-18"></i>
                @if ($response['summary']['coupon_applied'] == 1)
                    {{ trans('messages.remove') }}
                @else
                    {{ trans('messages.apply') }}
                @endif
            </button>
        </div>
    </form>

    
</div>
