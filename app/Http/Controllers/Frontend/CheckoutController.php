<?php


namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Frontend\CartController;
use App\Models\Coupon;
use App\Models\CouponUsage;
use App\Models\OrderTracking;
use App\Models\Product;
use App\Models\Order;
use App\Models\OrderDetail;
use App\Models\ProductStock;
use App\Models\OrderPayments;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Request as RequestFacade;
use App\Utility\NotificationUtility;
use App\Utility\SendSMSUtility;
use Illuminate\Support\Facades\Auth;
use App\Models\Cart;
use Illuminate\Support\Facades\Log;
use Razorpay\Api\Api;

class CheckoutController
{

    public function index()
    {
        $user = Auth::user();
        $cartController = new CartController();
        $response = $cartController->index();

        if ($response instanceof \Illuminate\Http\JsonResponse) {
            $response = $response->getData(true);
        }

        return view('frontend.checkout', compact('response', 'user'));
    }

    public function apply_coupon_code(Request $request)
    {
        $userId = auth()->user() ? auth()->user()->id : null;
        $tempUserId = null;

        if (!$userId) {
            $tempUserId = request()->cookie('guest_token') ?? uniqid('guest_', true);
            if (!$tempUserId) {
                return response()->json([
                    'success' => false,
                    'message' => trans('messages.user_not_found')
                ], 200);
            }
        }

        $cartItemsQuery = Cart::query();

        if ($userId) {
            $cartItemsQuery->where('user_id', $userId);
        } else {
            $cartItemsQuery->where('temp_user_id', $tempUserId);
        }

        $cart_items = $cartItemsQuery->get();
        $cartCount = $cart_items->count();

        if ($cartCount == 0) {
            return response()->json([
                'success' => false,
                'message' => trans('messages.cart_empty')
            ], 200);
        }

        $coupon = Coupon::where('code', $request->coupon)->first();
        if ($coupon == null) {
            return response()->json([
                'success' => false,
                'message' => trans('messages.invalid_coupon')
            ], 200);
        }

        $today = strtotime(date('d-m-Y'));
        if ($today < $coupon->start_date || $today > $coupon->end_date) {
            return response()->json([
                'success' => false,
                'message' => trans('messages.coupon_expired')
            ], 200);
        }

        if ($coupon->one_time_use == 1 && $userId) {
            $is_used = CouponUsage::where('user_id', $userId)
                ->where('coupon_id', $coupon->id)
                ->exists();
            if ($is_used) {
                return response()->json([
                    'success' => false,
                    'message' => trans('messages.already_used_coupon')
                ], 200);
            }
        }

        $coupon_details = json_decode($coupon->details);
        $coupon_discount = 0;

        if ($coupon->type == 'cart_base') {
            $subtotal = 0;
            $tax = 0;
            $shipping = 0;
            foreach ($cart_items as $cartItem) {
                $subtotal += $cartItem->offer_price * $cartItem->quantity;
                $tax += $cartItem->tax;
                $shipping += $cartItem->shipping_cost ?? 0;
            }
            $sum = $subtotal + $tax + $shipping;

            if ($sum < $coupon_details->min_buy) {
                return response()->json([
                    'success' => false,
                    'message' => trans('messages.coupon_cannot_applied')
                ], 200);
            }

            if ($coupon->discount_type == 'percent') {
                $coupon_discount = ($sum * $coupon->discount) / 100;
                if ($coupon_discount > $coupon_details->max_discount) {
                    $coupon_discount = $coupon_details->max_discount;
                }
            } elseif ($coupon->discount_type == 'amount') {
                $coupon_discount = $coupon->discount;
            }

            $discountPerItem = $coupon_discount / $cartCount;

            $updateQuery = Cart::query();
            if ($userId) {
                $updateQuery->where('user_id', $userId);
            } else {
                $updateQuery->where('temp_user_id', $tempUserId);
            }
            $updateQuery->update([
                'discount' => $discountPerItem,
                'coupon_code' => $request->coupon,
                'coupon_applied' => 1,
            ]);

            return response()->json([
                'success' => true,
                'message' => trans('messages.coupon_applied')
            ], 200);
        } elseif ($coupon->type == 'product_base') {
            foreach ($cart_items as $cartItem) {
                foreach ($coupon_details as $coupon_detail) {
                    if ($coupon_detail->product_id == $cartItem->product_id) {
                        if ($coupon->discount_type == 'percent') {
                            $coupon_discount += ($cartItem->offer_price * $coupon->discount / 100) * $cartItem->quantity;
                        } elseif ($coupon->discount_type == 'amount') {
                            $coupon_discount += $coupon->discount * $cartItem->quantity;
                        }
                    }
                }
            }

            if ($coupon_discount <= 0) {
                return response()->json([
                    'success' => false,
                    'message' => trans('messages.coupon_cannot_applied')
                ], 200);
            }

            $discountPerItem = $coupon_discount / $cartCount;

            $updateQuery = Cart::query();
            if ($userId) {
                $updateQuery->where('user_id', $userId);
            } else {
                $updateQuery->where('temp_user_id', $tempUserId);
            }
            $updateQuery->update([
                'discount' => $discountPerItem,
                'coupon_code' => $request->coupon,
                'coupon_applied' => 1,
            ]);

            return response()->json([
                'success' => true,
                'message' => trans('messages.coupon_applied')
            ], 200);
        }

        return response()->json([
            'success' => false,
            'message' => trans('messages.coupon_cannot_applied')
        ], 200);
    }

    public function remove_coupon_code(Request $request)
    {
        $userId = auth()->user() ? auth()->user()->id : null;
        $tempUserId = null;

        if (!$userId) {
            $tempUserId = request()->cookie('guest_token');
            if (!$tempUserId) {
                return response()->json([
                    'success' => false,
                    'message' => trans('messages.user_not_found')
                ], 200);
            }
        }

        $updateQuery = Cart::query();
        if ($userId) {
            $updateQuery->where('user_id', $userId);
        } else {
            $updateQuery->where('temp_user_id', $tempUserId);
        }

        $updated = $updateQuery->update([
            'discount' => 0.00,
            'coupon_code' => '',
            'coupon_applied' => 0,
        ]);

        return response()->json([
            'success' => true,
            'message' => trans('messages.coupon_removed')
        ], 200);
    }

    public function processOrder(Request $request)
    {
        $validatedData = $request->validate([
            'billing_name' => 'required|string|max:255',
            'billing_address' => 'required|string|max:255',
            'billing_city' => 'required|string|max:255',
            'billing_zipcode' => 'required|string|max:10',
            'billing_phone' => 'required|string|max:15',
            'billing_email' => 'required|email|max:255',
            'shipping_name' => 'nullable|string|max:255',
            'shipping_address' => 'nullable|string|max:255',
            'shipping_city' => 'nullable|string|max:255',
            'shipping_zipcode' => 'nullable|string|max:10',
            'shipping_phone' => 'nullable|string|max:15',
            'payment_method' => 'required|string|in:cod,razorpay',
        ], [
            'billing_name.required' => 'This field is required.',
            'billing_address.required' => 'This field is required.',
            'billing_city.required' => 'This field is required.',
            'billing_zipcode.required' => 'This field is required.',
            'billing_phone.required' => 'This field is required.',
            'billing_phone.max' => 'The phone number must not exceed 15 characters.',
            'billing_email.required' => 'This field is required.',
            'billing_email.email' => 'The email address must be a valid email.',
            'billing_email.max' => 'The email address must not exceed 255 characters.',
            'payment_method.required' => 'Payment method is required.',
        ]);

        $user_id = auth()->user() ? auth()->user()->id : null;
        $guest_id = RequestFacade::cookie('guest_token');

        $billing_shipping_same = $request->same_as_billing ?? null;

        $shipping_address = [];
        $billing_address = [];

        $billing_address['name']        = $request->billing_name;
        $billing_address['email']       = $request->billing_email;
        $billing_address['address']     = $request->billing_address;
        $billing_address['zipcode']     = $request->billing_zipcode;
        $billing_address['city']        = $request->billing_city;
        $billing_address['phone']       = $request->billing_phone;

        if ($billing_shipping_same != 'on') {
            $shipping_address['name']        = $request->shipping_name;
            $shipping_address['email']       = $request->billing_email;
            $shipping_address['address']     = $request->shipping_address;
            $shipping_address['zipcode']     = $request->shipping_zipcode;
            $shipping_address['city']        = $request->shipping_city;
            $shipping_address['phone']       = $request->shipping_phone;
        } else {
            $shipping_address = $billing_address;
        }

        $shipping_address_json = json_encode($shipping_address);
        $billing_address_json = json_encode($billing_address);

        $cartsQuery = Cart::query();
        if ($user_id) {
            $cartsQuery->where('user_id', $user_id);
        } else {
            $cartsQuery->where('temp_user_id', $guest_id);
        }

        $carts = $cartsQuery->orderBy('id', 'asc')->get();

        if ($carts->isEmpty()) {
            return redirect()->back()->with('error', 'Your cart is empty');
        }

        $carts->load(['product', 'product_stock']);

        $sub_total = $discount = $coupon_applied = $total_coupon_discount = $grand_total = $total_shipping = $total_tax = 0;
        $coupon_code = '';
        $productQuantities = [];

        foreach ($carts as $data) {
            $sub_total = $sub_total + ($data->price * $data->quantity);
            $total_tax = $total_tax + $data->tax;
            $total_shipping = $total_shipping + $data->shipping_cost;
            $discount = $discount + (($data->price * $data->quantity) - ($data->offer_price * $data->quantity)) + $data->offer_discount;
            $coupon_code = $data->coupon_code;
            $coupon_applied = $data->coupon_applied;
            if ($data->coupon_applied == 1) {
                $total_coupon_discount += $data->discount;
            }
            $productQuantities[$data->product_id] = $data->quantity;
        }

        $grand_total = ($sub_total + $total_tax + round($total_shipping))  - ($discount + $total_coupon_discount);

        $orderData = [
            'user_id' => $user_id ?? $guest_id,
            'email' => $request->billing_email,
            'is_guest' => $user_id ? 1 : 0,
            'shipping_address' => $shipping_address_json,
            'billing_address' => $billing_address_json,
            'order_notes' => $request->order_note ?? '',
            'shipping_type' => ($total_shipping == 0) ? 'free_shipping' : 'flat_rate',
            'shipping_cost' => round($total_shipping),
            'grand_total' => $grand_total,
            'tax' => $total_tax,
            'sub_total' => $sub_total,
            'offer_discount' => $discount,
            'coupon_discount' => $total_coupon_discount,
            'coupon_code' => $coupon_code,
            'product_quantities' => $productQuantities,
            'cart_items' => $carts,
            'code' => date('Ymd-His') . rand(10, 99),
        ];

        $pendingOrder = \App\Models\PendingOrder::create([
            'user_id' => $user_id,
            'temp_user_id' => $user_id ? null : $guest_id,
            'order_data' => $orderData,
            'payment_method' => $request->payment_method,
            'order_code' => $orderData['code'],
            'expires_at' => now()->addHours(24),
        ]);

        if ($request->payment_method == 'cod') {
            return $this->createOrder($orderData);
        } else if ($request->payment_method == 'razorpay') {
            $api = new Api(env('RAZORPAY_KEY_ID'), env('RAZORPAY_KEY_SECRET'));

            $billingAddress = json_decode($billing_address_json, true);
            $customerName = $billingAddress['name'] ?? 'Customer';
            $customerEmail = $billingAddress['email'] ?? '';
            $customerPhone = $billingAddress['phone'] ?? '';

            $paymentLink = $api->paymentLink->create([
                'amount' => round($grand_total * 100),
                'currency' => 'INR',
                'accept_partial' => false,
                'description' => 'Order Payment for Order #' . $orderData['code'],
                'reference_id' => $orderData['code'],
                'customer' => [
                    'name' => $customerName,
                    'contact' => $customerPhone,
                    'email' => $customerEmail
                ],
                'notify' => [
                    'sms' => true,
                    'email' => true
                ],
                'reminder_enable' => true,
                'notes' => [
                    'order_code' => $orderData['code']
                ],
                'callback_url' => route('razorpay.success') . '?order_code=' . $orderData['code'],
                'callback_method' => 'get'
            ]);

            $pendingOrder->update(['razorpay_payment_link_id' => $paymentLink['id']]);

            return redirect()->away($paymentLink['short_url']);
        } else {
            return redirect()->back()->with('error', 'Invalid payment method');
        }
    }

    public function cancelOrderRequest(Request $request)
    {
        $order_id = $request->order_id ?? '';
        $reason   = $request->reason ?? '';
        $user = getUser();
        if ($order_id != '') {
            $order = Order::find($order_id);
            if ($order) {
                if ($order->cancel_request == 0 && $order->delivery_status == "pending") {
                    $order->cancel_request = 1;
                    $order->cancel_request_date = date('Y-m-d H:i:s');
                    $order->cancel_reason = $reason;
                    $order->save();

                    return response()->json([
                        'status' => true,
                        'message' => trans('messages.request_success')
                    ], 200);
                } else {
                    return response()->json([
                        'status' => false,
                        'message' => trans('messages.request_already_send')
                    ], 200);
                }
            } else {
                return response()->json([
                    'status' => false,
                    'message' => trans('messages.not_found')
                ], 200);
            }
        } else {
            return response()->json([
                'status' => false,
                'message' => trans('messages.not_found')
            ], 200);
        }
    }

    public function returnOrderRequest(Request $request)
    {
        $order_id = $request->order_id ?? '';
        $reason   = $request->reason ?? '';
        $user = getUser();
        if ($order_id != '') {
            $order = Order::find($order_id);
            if ($order) {
                if ($order->return_request == 0 && $order->delivery_status == "delivered") {
                    $order->return_request = 1;
                    $order->return_request_date = date('Y-m-d H:i:s');
                    $order->return_reason = $reason;
                    $order->save();

                    return response()->json([
                        'status' => true,
                        'message' => trans('messages.request_success')
                    ], 200);
                } else {
                    return response()->json([
                        'status' => false,
                        'message' => trans('messages.request_already_send')
                    ], 200);
                }
            } else {
                return response()->json([
                    'status' => false,
                    'message' => trans('messages.not_found')
                ], 200);
            }
        } else {
            return response()->json([
                'status' => false,
                'message' => trans('messages.not_found')
            ], 200);
        }
    }

    public function success($order_id)
    {
        $order = Order::with(['orderDetails.product', 'orderDetails.product_stock'])->find($order_id);
        
        if (!$order) {
            return redirect()->route('home')->with('error', 'Order not found');
        }
        
        return view('frontend.order_success', compact('order'));
    }



    public function failed()
    {
        return view('frontend.order_failed');
    }

    public function razorpaySuccess(Request $request)
    {
        $orderCode = $request->order_code ?? $request->razorpay_payment_link_reference_id;

        $pendingOrder = \App\Models\PendingOrder::where('order_code', $orderCode)->first();

        if (!$pendingOrder) {
            return redirect()->route('order.failed')->with('error', 'Order data not found.');
        }

        $api = new Api(env('RAZORPAY_KEY_ID'), env('RAZORPAY_KEY_SECRET'));

        try {
            $attributes = [
                'razorpay_payment_id' => $request->razorpay_payment_id,
                'razorpay_payment_link_id' => $request->razorpay_payment_link_id,
                'razorpay_payment_link_reference_id' => $request->razorpay_payment_link_reference_id,
                'razorpay_payment_link_status' => $request->razorpay_payment_link_status,
                'razorpay_signature' => $request->razorpay_signature
            ];

            $api->utility->verifyPaymentSignature($attributes);

            if ($request->razorpay_payment_link_status !== 'paid') {
                return redirect()->route('order.failed')->with('error', 'Payment was not successful.');
            }

            $orderData = $pendingOrder->order_data;

            $orderData['payment_type'] = 'razorpay';
            $orderData['payment_status'] = 'paid';
            $orderData['razorpay_payment_id'] = $request->razorpay_payment_id;
            $orderData['razorpay_payment_link_id'] = $request->razorpay_payment_link_id;
            $orderData['razorpay_signature'] = $request->razorpay_signature;

            $pendingOrder->delete();

            return $this->createOrder($orderData);
        } catch (\Exception $e) {
            Log::error('Payment verification failed: ' . $e->getMessage());
            return redirect()->route('order.failed')->with('error', 'Payment verification failed.');
        }
    }

    public function razorpayFailed(Request $request)
    {
        $orderCode = $request->razorpay_payment_link_reference_id ?? $request->order_code;

        if ($orderCode) {
        }

        return redirect()->route('order.failed')->with('error', 'Payment was not successful. Please try again.');
    }

    public function createOrder($orderData)
    {

        $order = Order::create([
            'user_id' => $orderData['user_id'],
            'email' => $orderData['email'] ?? null,
            'is_guest' => $orderData['is_guest'],
            'shipping_address' => $orderData['shipping_address'],
            'billing_address' => $orderData['billing_address'],
            'order_notes' => $orderData['order_notes'],
            'shipping_type' => $orderData['shipping_type'],
            'shipping_cost' => $orderData['shipping_cost'],
            'delivery_status' => 'pending',
            'payment_type' => $orderData['payment_type'] ?? 'cod',
            'payment_status' => $orderData['payment_status'] ?? 'un_paid',
            'grand_total' => $orderData['grand_total'],
            'tax' => $orderData['tax'],
            'sub_total' => $orderData['sub_total'],
            'offer_discount' => $orderData['offer_discount'],
            'coupon_discount' => $orderData['coupon_discount'],
            'coupon_code' => $orderData['coupon_code'],
            'code' => $orderData['code'],
            'date' => strtotime('now'),
            'delivery_viewed' => 0
        ]);

        if (isset($orderData['razorpay_payment_id'])) {
            $order->razorpay_payment_id = $orderData['razorpay_payment_id'];
            $order->save();
        }

        $track = new OrderTracking;
        $track->order_id = $order->id;
        $track->status = 'pending';
        $track->description = "The order has been placed successfully";
        $track->status_date = date('Y-m-d H:i:s');
        $track->save();

        $orderItems = [];

        foreach ($orderData['cart_items'] as $data) {
            $productStock = $data['product_stock'] ?? null;
            $attributes = [];

            if ($productStock && isset($productStock['attributes'])) {
                $attributes = getProductAttributes($productStock['attributes']);
            }

            $orderItems[] = [
                'order_id' => $order->id,
                'product_id' => $data['product_id'] ?? null,
                'product_stock_id' => $productStock['id'] ?? null,
                'variation' => json_encode($attributes),
                'og_price' => $data['price'] ?? 0,
                'tax' => $data['tax'] ?? 0,
                'shipping_cost' => $data['shipping_cost'] ?? 0,
                'offer_price' => $data['offer_price'] ?? 0,
                'price' => ($data['offer_price'] ?? 0) * ($data['quantity'] ?? 0),
                'quantity' => $data['quantity'] ?? 0,
            ];

            $product = isset($data['product_id']) ? Product::find($data['product_id']) : null;
            if ($product) {
                $product->num_of_sale += $data['quantity'] ?? 0;
                $product->save();
            }
        }

        OrderDetail::insert($orderItems);

        if ($orderData['coupon_code'] != '') {
            $coupon_usage = new CouponUsage;
            $coupon_usage->user_id = $orderData['user_id'];
            $coupon_usage->coupon_id = Coupon::where('code', $orderData['coupon_code'])->first()->id;
            $coupon_usage->save();
        }

        if (isset($orderData['payment_status']) && $orderData['payment_status'] == 'paid') {
            if (isset($orderData['razorpay_payment_id'])) {
                $order->payment_details = json_encode([
                    'razorpay_payment_id' => $orderData['razorpay_payment_id'],
                    'razorpay_signature' => $orderData['razorpay_signature']
                ]);
                $order->save();
            }

            $orderDetails = $order->orderDetails;
            if (!empty($orderDetails)) {
                foreach ($orderDetails as $od) {
                    $od->payment_status = 'paid';
                    $od->save();

                    $product_stock = ProductStock::where('product_id', $od->product_id)->first();
                    if ($product_stock) {
                        $product_stock->qty -= ($od->quantity >= $product_stock->qty) ? 0 : ($product_stock->qty - $od->quantity);
                        $product_stock->save();
                    }
                }
            }

            $orderPayments = new OrderPayments();
            $orderPayments->order_id = $order->id;
            $orderPayments->payment_status = 'success';

            if (isset($orderData['razorpay_payment_id'])) {
                $orderPayments->payment_details = json_encode([
                    'razorpay_payment_id' => $orderData['razorpay_payment_id'],
                    'razorpay_signature' => $orderData['razorpay_signature']
                ]);
            }

            $orderPayments->save();

            // NotificationUtility::sendOrderPlacedNotification($order);
            // NotificationUtility::sendNotification($order, 'created');
        } else {
            reduceProductQuantity($orderData['product_quantities']);
        }

        $user_id = auth()->user() ? auth()->user()->id : null;
        $guest_id = RequestFacade::cookie('guest_token');

        if ($user_id) {
            Cart::where('user_id', $user_id)->delete();
        } else {
            Cart::where('temp_user_id', $guest_id)->delete();
        }

        return redirect()->route('order.success', $order->id);
    }


    public function redirectToWhatsApp(Request $request)
    {
        $validatedData = $request->validate([
            'billing_name' => 'required|string|max:255',
            'billing_address' => 'required|string|max:255',
            'billing_city' => 'required|string|max:255',
            'billing_zipcode' => 'required|string|max:10',
            'billing_phone' => 'required|string|max:15',
            'billing_email' => 'required|email|max:255',
            'shipping_name' => 'nullable|string|max:255',
            'shipping_address' => 'nullable|string|max:255',
            'shipping_city' => 'nullable|string|max:255',
            'shipping_zipcode' => 'nullable|string|max:10',
            'shipping_phone' => 'nullable|string|max:15',
        ]);

        $user_id = auth()->user() ? auth()->user()->id : null;
        $guest_id = RequestFacade::cookie('guest_token');

        $cartsQuery = Cart::query();
        if ($user_id) {
            $cartsQuery->where('user_id', $user_id);
        } else {
            $cartsQuery->where('temp_user_id', $guest_id);
        }

        $carts = $cartsQuery->orderBy('id', 'asc')->get();

        if ($carts->isEmpty()) {
            return redirect()->back()->with('error', 'Your cart is empty');
        }

        $carts->load(['product', 'product_stock']);

        $billing_shipping_same = $request->same_as_billing ?? null;

        $shipping_address = [];
        $billing_address = [];

        $billing_address['name']        = $request->billing_name;
        $billing_address['email']       = $request->billing_email;
        $billing_address['address']     = $request->billing_address;
        $billing_address['zipcode']     = $request->billing_zipcode;
        $billing_address['city']        = $request->billing_city;
        $billing_address['phone']       = $request->billing_phone;

        if ($billing_shipping_same != 'on') {
            $shipping_address['name']        = $request->shipping_name;
            $shipping_address['email']       = $request->billing_email;
            $shipping_address['address']     = $request->shipping_address;
            $shipping_address['zipcode']     = $request->shipping_zipcode;
            $shipping_address['city']        = $request->shipping_city;
            $shipping_address['phone']       = $request->shipping_phone;
        } else {
            $shipping_address = $billing_address;
        }

        $shipping_address_json = json_encode($shipping_address);
        $billing_address_json = json_encode($billing_address);

        $sub_total = $discount = $coupon_applied = $total_coupon_discount = $grand_total = $total_shipping = $total_tax = 0;
        $coupon_code = '';

        $order = Order::create([
            'user_id' => $user_id ?? $guest_id,
            'email' => $request->billing_email,
            'is_guest' => $user_id ? 1 : 0,
            'shipping_address' => $shipping_address_json,
            'billing_address' => $billing_address_json,
            'order_notes' => $request->order_note ?? '',
            'shipping_type' => 'free_shipping',
            'shipping_cost' => 0,
            'delivery_status' => 'pending',
            'payment_type' => 'whatsapp',
            'payment_status' => 'un_paid',
            'grand_total' =>  0,
            'tax' => 0,
            'sub_total' => 0,
            'offer_discount' => 0,
            'coupon_discount' => 0,
            'code' => date('Ymd-His') . rand(10, 99),
            'date' => strtotime('now'),
            'delivery_viewed' => 0
        ]);

        $track = new OrderTracking;
        $track->order_id = $order->id;
        $track->status = 'pending';
        $track->description = "The order has been placed successfully";
        $track->status_date = date('Y-m-d H:i:s');
        $track->save();

        $orderItems = $productQuantities = [];

        foreach ($carts as $data) {
            $sub_total = $sub_total + ($data->price * $data->quantity);
            $total_tax = $total_tax + $data->tax;
            $total_shipping = $total_shipping + $data->shipping_cost;
            $discount = $discount + (($data->price * $data->quantity) - ($data->offer_price * $data->quantity)) + $data->offer_discount;
            $coupon_code = $data->coupon_code;
            $coupon_applied = $data->coupon_applied;
            if ($data->coupon_applied == 1) {
                $total_coupon_discount += $data->discount;
            }
            $orderItems[] = [
                'order_id' => $order->id,
                'product_id' => $data->product_id,
                'product_stock_id' => $data->product_stock->id,
                'variation' => json_encode(getProductAttributes($data->product_stock->attributes)),
                'og_price' => $data->price,
                'tax' => $data->tax,
                'shipping_cost' => $data->shipping_cost,
                'offer_price' => $data->offer_price,
                'price' => $data->offer_price * $data->quantity,
                'quantity' => $data->quantity,
            ];
            $productQuantities[$data->product_id] = $data->quantity;

            $product = Product::find($data->product_id);
            $product->num_of_sale += $data->quantity;
            $product->save();
        }

        OrderDetail::insert($orderItems);
        $grand_total = ($sub_total + $total_tax + round($total_shipping))  - ($discount + $total_coupon_discount);

        $order->grand_total         = $grand_total;
        $order->sub_total           = $sub_total;
        $order->offer_discount      = $discount;
        $order->tax                 = $total_tax;
        $order->shipping_cost       = round($total_shipping);
        $order->shipping_type       = ($total_shipping == 0) ? 'free_shipping' : 'flat_rate';
        $order->coupon_discount     = $total_coupon_discount;
        $order->coupon_code         = $coupon_code;
        $order->save();

        if ($coupon_code != '') {
            $coupon_usage = new CouponUsage;
            $coupon_usage->user_id = $user_id ?? $guest_id;
            $coupon_usage->coupon_id = Coupon::where('code', $coupon_code)->first()->id;
            $coupon_usage->save();
        }

        $message = "I want to buy these products:

";

        $total = 0;
        foreach ($carts as $cart) {
            $productName = $cart->product->name ?? 'Unknown Product';
            $productPrice = $cart->offer_price ?? $cart->price;
            $quantity = $cart->quantity;
            $subtotal = $productPrice * $quantity;
            $total += $subtotal;

            $message .= "- {$productName}
";
            $message .= "  Quantity: {$quantity}
";
        }



        $message .= "Customer Details:
";
        $message .= "Name: {$validatedData['billing_name']}
";
        $message .= "Email: {$validatedData['billing_email']}
";
        $message .= "Phone: {$validatedData['billing_phone']}

";

        $message .= "Billing Address:
";
        $message .= "{$validatedData['billing_address']}
";
        $message .= "{$validatedData['billing_city']} - {$validatedData['billing_zipcode']}

";

        if (!empty($validatedData['shipping_address'])) {
            $message .= "Shipping Address:
";
            $message .= "{$validatedData['shipping_address']}
";
            $message .= "{$validatedData['shipping_city']} - {$validatedData['shipping_zipcode']}

";
        }

        $message .= "Order Code: {$order->code}
";

        $encodedMessage = urlencode($message);

        $whatsappNumber = env('WHATSAPP_BUSINESS_NUMBER', '');
        $whatsappUrl = "https://wa.me/{$whatsappNumber}?text={$encodedMessage}";

        if ($user_id) {
            Cart::where('user_id', $user_id)->delete();
        } else {
            Cart::where('temp_user_id', $guest_id)->delete();
        }

        return redirect()->away($whatsappUrl);
    }
}
