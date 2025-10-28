<div class="py-6 sm:py-10">
    <form id="applyCouponForm" method="POST" class="">
        <div class="form-group flex flex-col sm:flex-row items-stretch sm:items-center space-y-2 sm:space-y-0 sm:space-x-2">
            <input type="text" id="couponCode" name="couponCode" placeholder="{{ $placeholder ?? 'Apply Coupon' }}"
                value="{{ $response['summary']['coupon_code'] }}"
                class="w-full sm:flex-grow border border-gray-300 rounded px-4 py-2 focus:outline-none focus:ring-2 focus:ring-blue-500" />
            <input type="hidden" name="coupon_action" id="coupon_action"
                value="@if ($response['summary']['coupon_applied'] == 1) remove @else add @endif" />
            <button type="submit"
                class="w-full sm:w-auto !bg-black text-white px-4 py-2 !rounded transition-colors flex items-center justify-center space-x-1 hover:!bg-gray-800">
                @if ($response['summary']['coupon_applied'] !== 1)
                    <i class="icon-18"></i>
                @endif
                <span>
                    @if ($response['summary']['coupon_applied'] == 1)
                        {{ trans('messages.remove') }}
                    @else
                        {{ trans('messages.apply') }}
                    @endif
                </span>
            </button>
        </div>
        <div id="couponMessage" class="mt-2"></div>
    </form>
</div>
