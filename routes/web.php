<?php

use App\Http\Controllers\BuilderController;
use App\Http\Controllers\FormController;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\Frontend\FrontendController;
use App\Http\Controllers\Frontend\ProductController;
use App\Http\Controllers\Frontend\CartController;
use App\Http\Controllers\Frontend\CheckoutController;
use App\Http\Controllers\Frontend\UserController;
use App\Http\Controllers\Frontend\AuthController;
use App\Http\Controllers\Frontend\WishlistController;
use App\Http\Controllers\Frontend\ProfileController;
use App\Http\Controllers\Frontend\ForgotPasswordController;
use App\Http\Controllers\Frontend\VendorController;
use App\Http\Controllers\Frontend\SearchController;
use App\Http\Controllers\Frontend\TestimonialController;
use Laravel\Prompts\FormBuilder;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [FrontendController::class, 'home'])->name('home');
Route::get('/about', [FrontendController::class, 'about'])->name('about_us');

Route::get('/{dynamicpagetype}', [FrontendController::class, 'dynamicPage'])->name('dynamic-page');

Route::get('/contact', [FrontendController::class, 'contact'])->name('contact');
Route::post('/contact-us', [FrontendController::class, 'submitContactForm'])->name('contact.submit');

Route::get('/products', [ProductController::class, 'index'])->name('products.index');
Route::get('/product-detail', [ProductController::class, 'productDetails'])->name('product-detail');
Route::get('related-products', [ProductController::class, 'relatedProducts'])->name('related.products');

Route::get('/category/{category_slug}', [SearchController::class, 'listingByCategory'])->name('products.category');

Route::post('/cart/add', [CartController::class, 'addToCart'])->name('cart.add');
Route::get('cart/count', [CartController::class, 'getCount']);
Route::post('cart/change_quantity', [CartController::class, 'changeQuantity']);
Route::delete('/cart/{id}', [CartController::class, 'removeCartItem'])->name('cart.remove');
Route::apiResource('cart', CartController::class)->only('index', 'store', 'destroy');

Route::get('cart/items', [CartController::class, 'getCartDetails'])->name('cart.items');
Route::post('coupon-apply', [CheckoutController::class, 'apply_coupon_code'])->name('coupon-apply');
Route::post('coupon-remove', [CheckoutController::class, 'remove_coupon_code'])->name('coupon-remove');

Route::get('/check-login-status', [UserController::class, 'checkLoginStatus'])->name('check.login.status');

Route::get('/testimonials', [TestimonialController::class, 'index'])->name('testimonials.index');
Route::get('/testimonials/{id}', [TestimonialController::class, 'show'])->name('testimonials.show');

Route::get('/checkout', [CheckoutController::class, 'index'])->name('checkout');
Route::post('checkout.process', [CheckoutController::class, 'placeOrder'])->name('checkout.process');
Route::post('checkout.whatsapp', [CheckoutController::class, 'redirectToWhatsApp'])->name('checkout.whatsapp');

Route::post('/forgot-password', [ForgotPasswordController::class, 'sendResetLink'])->name('password.sendResetLink');
Route::get('/password/reset/{email}/{token}', [ForgotPasswordController::class, 'showResetPasswordForm'])->name('password.reset.form');
Route::post('/password/reset', [ForgotPasswordController::class, 'resetPassword'])->name('password.reset');


Route::get('/order/success/{order_id}', [CheckoutController::class, 'success'])->name('order.success');
Route::get('/order/failed', [CheckoutController::class, 'failed'])->name('order.failed');

Route::post('/razorpay-success', [CheckoutController::class, 'razorpaySuccess'])->name('razorpay.success');
Route::post('/razorpay-failed', [CheckoutController::class, 'razorpayFailed'])->name('razorpay.failed');

Route::get('logout', [AuthController::class, 'logout'])->name('logout');

Route::get('orders', [ProfileController::class, 'orderList'])->name('orders.index');
Route::get('order-details', [ProfileController::class, 'orderDetails'])->name('order-details');
Route::get('order/returns', [ProfileController::class, 'orderReturnList'])->name('orders.returns');

Route::get('account', [ProfileController::class, 'getUserAccountInfo'])->name('account');

Route::post('/subscribe', [FrontendController::class, 'subscribe'])->name('newsletter.subscribe');

Route::get('register', [AuthController::class, 'showRegistrationForm'])->name('register');
Route::post('register', [AuthController::class, 'register']);

Route::get('login', [AuthController::class, 'showLoginForm'])->name('login');
Route::post('login', [AuthController::class, 'login']);

Route::get('/test', [BuilderController::class, 'create']);
Route::post('/test-add', [BuilderController::class, 'store']);
Route::get('/get-form', [FormController::class, 'create']);
Route::post('/store-data', [FormController::class, 'store']);

Route::prefix('dynamic-forms')->name('dynamic-forms.')->group(function () {
    Route::get('/')->name('index');

    Route::post('storage/s3', [\App\Http\Controllers\DynamicFormsStorageController::class, 'storeS3'])
        ->withoutMiddleware([\Illuminate\Foundation\Http\Middleware\VerifyCsrfToken::class]);

    Route::get('storage/s3', [App\Http\Controllers\DynamicFormsStorageController::class, 'showS3'])->name('S3-file-download');
    Route::get('storage/s3/{fileKey}', [\App\Http\Controllers\DynamicFormsStorageController::class, 'showS3'])->name('S3-file-redirect');

    Route::post('storage/url', [\App\Http\Controllers\DynamicFormsStorageController::class, 'storeURL'])
        ->withoutMiddleware([\Illuminate\Foundation\Http\Middleware\VerifyCsrfToken::class]);

    Route::get('storage/url', [\App\Http\Controllers\DynamicFormsStorageController::class, 'showURL'])->name('url-file-download');
    Route::delete('storage/url', [\App\Http\Controllers\DynamicFormsStorageController::class, 'deleteURL']);
});
