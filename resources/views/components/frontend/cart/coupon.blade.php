<div class="py-10">
    <form id="applyCouponForm" method="POST" class="">
        <div class="form-group flex items-center space-x-2">
            <input type="text" id="couponCode" name="couponCode" placeholder="{{ $placeholder ?? 'Apply Coupon' }}"
                value="{{ $response['summary']['coupon_code'] }}"
                class="flex-grow border border-gray-300 rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" />
            <input type="hidden" name="coupon_action" id="coupon_action"
                value="@if ($response['summary']['coupon_applied'] == 1) remove @else add @endif" />
            <button type="submit"
                class="!bg-black text-white px-4 py-2 !rounded transition-colors flex items-center space-x-1">
                <i class="icon-18"></i>
                <span>
                    @if ($response['summary']['coupon_applied'] == 1)
                        {{ trans('messages.remove') }}
                    @else
                        {{ trans('messages.apply') }}
                    @endif
                </span>
            </button>
        </div>
    </form>
</div>
