<!DOCTYPE html>
<html dir="{{ getDirection() }}" lang="{{ getActiveLanguage() }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title></title>
    {!! SEO::generate() !!}
    <link href="{{ asset('assets/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css" />
    <link href="{{ asset('assets/css/theme.css?v=4') }}" rel="stylesheet" type="text/css" />
    <script src="{{ asset('assets/js/vendor.js') }}"></script>
    <script src="{{ asset('assets/js/theme.js') }}"></script>
    <link rel="stylesheet" href="{{ asset('assets/css/lineicons-regular.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/icon-font.min.css') }}">
    <link href="{{ asset('assets/css/custom-style.css') }}" rel="stylesheet" type="text/css" />

    <link href="{{ asset('dist/assets/app-97de3ed1.css') }}" rel="stylesheet">
    <link href="{{ asset('dist/assets/app-afc193cb.css') }}" rel="stylesheet">
    <script type="module" src="{{ asset('assets/js/app-f10b86b9.js') }}"></script>

    <script async src="https://www.googletagmanager.com/gtag/js?id=G-GJB4R99EX9"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'G-GJB4R99EX9');
    </script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>


    <link rel="stylesheet" href="https://cdn.form.io/formiojs/formio.full.min.css">
    <script src="https://cdn.form.io/formiojs/formio.full.min.js"></script>



    <link href="{{ asset('assets/css/flaticon.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/owl.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/bootstrap.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/jquery.fancybox.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/animate.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/nice-select.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/elpath.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/color.css" id="jssDefault') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/rtl.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/style.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/header.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/banner.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/shop.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/featured.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/category.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/ads.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/popular-product.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/highlights.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/collection.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/fluid.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/deals.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/news.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/subscribe.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/footer.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/responsive.css') }}" rel="stylesheet" />

    <link href="{{ asset('assets/css/module-css/page-title.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/shop-sidebar.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/shop-page.css') }}" rel="stylesheet" />

    <link href="{{ asset('assets/css/font-awesome-all.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/flaticon.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/owl.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/bootstrap.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/jquery.fancybox.min.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/animate.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/nice-select.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/elpath.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/jquery-ui.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/color.css" id="jssDefault') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/rtl.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/style.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/header.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/shop-details.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/shop.css') }}" rel="stylesheet" />

    <link href="{{ asset('assets/css/module-css/featured.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/popular-product.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/subscribe.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/footer.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/responsive.css') }}" rel="stylesheet" />

    <link href="{{ asset('assets/css/module-css/cart.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/module-css/checkout.css') }}" rel="stylesheet" />

    <link href="{{ asset('assets/css/module-css/popular-product.css') }}" rel="stylesheet" />

    <link href="{{ asset('assets/css/module-css/account.css') }}" rel="stylesheet" />

    <link href="{{ asset('assets/css/module-css/contact.css') }}" rel="stylesheet">
    <link href="{{ asset('assets/css/module-css/about.css') }}" rel="stylesheet">


    @vite(['resources/css/app.css', 'resources/js/app.js'])


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" />

    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap"
        rel="stylesheet">


    <style>
        .toast {
            background-color: #333 !important;
            color: #fff !important;
        }

        .toast-success {
            background-color: #51A351 !important;
        }

        .toast-error {
            background-color: #BD362F !important;
        }

        .toast-info {
            background-color: #2F96B4 !important;
        }

        .toast-warning {
            background-color: #F89406 !important;
        }


        #page-loader {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: #fff;
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
            transition: opacity 0s ease-out;
        }

        .loader-content {
            text-align: center;
        }

        .spinner {
            width: 50px;
            height: 50px;
            border: 5px solid #f3f3f3;
            border-top: 5px solid #000;
            border-radius: 50%;
            animation: spin 2s linear infinite;
            margin: 0 auto;
        }

        .loader-text {
            margin-top: 15px;
            font-size: 16px;
            color: #000;
            font-weight: 500;
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }

        .attribute-item {
            cursor: pointer;
            padding: 5px 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin: 5px;
            display: inline-block;
            transition: all 0.3s;
        }

        .attribute-item.disabled {
            pointer-events: none !important;
            text-decoration: line-through !important;
        }

        .page-loaded #page-loader {
            opacity: 0;
            pointer-events: none;
        }
    </style>
</head>

<body>
    {{-- <div id="page-loader">
        <div class="loader-content">
            <div class="spinner"></div>
            <div class="loader-text">Loading...</div>
        </div>
    </div> --}}

    <div id="main">
        @include('frontend.parts.header')
        @include('frontend.parts.mobile-menu')

        @yield('content')

        @include('frontend.parts.footer')
    </div>


    <style>
        .whatsapp-btn {
            background-color: #25d366;
            color: white;
            border: none;
            border-radius: 30px;
            padding: 20px 50px;
            font-size: 24px;
            font-weight: 600;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            box-shadow: 0 6px 14px rgba(37, 211, 102, 0.4);
            transition: background-color 0.3s ease, box-shadow 0.3s ease;
            min-width: 250px;
            min-height: 70px;
        }

        .whatsapp-btn i {
            margin-right: 16px;
            font-size: 32px;
            /* Larger icon */
        }

        .whatsapp-btn:hover {
            background-color: #128c7e;
            box-shadow: 0 8px 20px rgba(18, 140, 126, 0.6);
        }

        .pink-button {
            background-color: black;
            color: white;
            border: none;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        .pink-button:hover {
            background-color: #c2185b;
        }
        
     
    </style>

    <script>
        @if (session('message'))
            toastr.options = {
                "closeButton": true,
                "progressBar": true,
                "positionClass": "toast-top-right",
            };
            toastr["{{ session('alert-type', 'info') }}"]("{{ session('message') }}");
        @endif


        var productDetailRoute =
            "{{ route('product-detail', ['slug' => '__slug__', 'sku' => '__sku__']) }}"; // this will be a placeholder
        $(".js-open-canvas-cart").on("click", function() {

            $.get('{{ route('cart.index') }}', {
                _token: '{{ csrf_token() }}'
            }, function(data) {
                console.log();
                // location.reload();
                var productRow = '';
                $.each(data.products, function(index, product) {

                    var productLink = productDetailRoute.replace('__slug__', product.product.slug)
                        .replace('__sku__', product.product.sku);

                    var attributeHTML = '';

                    $.each(product.product.attributes, function(attrIndex, attribute) {
                        attributeHTML +=
                            `<span class="cart-item__variant">${attribute.name}, ${attribute.value || "Not specified"}</span>`;
                    });

                    productRow += `
                            <li class="cart-item d-flex">
                                    
                                    <p class="cart-item__image">
                                        <a href="${productLink}">
                                            <img alt="Image" data-sizes="auto"
                                                data-srcset="${product.product.image}"
                                                src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                                                class="lazyload" />
                                        </a>
                                    </p>
                                
                                    <p class="cart-item__details">
                                        <a href="" class="cart-item__title">${product.product.name}</a>
                                        ${attributeHTML}
                                        <span class="cart-ietm__price">${product.quantity} <i>x</i> AED ${product.main_price}</span>
                                    </p>
                                    <div class="cart-item__quantity">
                                       
                                    </div>
                                   
                                
                                    <p class="cart-item__delete">
                                        <a href="#" class="remove-cart-item" data-id="${product.id}" ><i class="lnr lnr-cross"></i></a>
                                    </p>
                                
                                </li>`;

                });

                $('.header-cart__items').html(productRow);

                $('.cart_sub_total').html(data.summary.after_discount);
            });



            $(".js-canvas-cart").addClass("active");
            $("body").css("overflow", "hidden");
            return false;
        });


        $(document).ready(function() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });


            $(document).on('click', '.add-to-cart-btn', function() {
                const productSlug = $(this).data('product-slug');
                const productSku = $(this).data('product-sku');
                var quantity = $('#product_quantity').val() ?? 1;

                $.ajax({
                    url: '/cart/add', // Laravel route
                    type: 'POST',
                    data: {
                        product_slug: productSlug,
                        sku: productSku,
                        quantity: quantity, // Default quantity
                    },
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content'),
                    },
                    success: function(response) {
                        $('.cart_count').text(response.cart_count);
                        $('#cart-count-header').text(response.cart_count);
                        $('#cart-count-sticky').text(response.cart_count);
                        if (response.status == true) {
                            toastr.success(response.message,
                                "{{ trans('messages.success') }}");
                        } else {
                            toastr.error(response.message, "{{ trans('messages.error') }}");
                        }
                    },
                    error: function(xhr, status, error) {
                        toastr.error("{{ trans('messages.product_add_cart_failed') }}",
                            'Error');
                    },
                });
            });

            $(document).on('click', '.remove-cart-item', function() {
                var cartItemId = $(this).data('id');
                var row = $(this).closest('li');

                $.ajax({
                    url: '/cart/' + cartItemId,
                    type: 'DELETE',
                    success: function(response) {
                      if (response.status === true) {
                            row.remove();
                            $('.row_' + cartItemId).remove();
                            $('.cart_sub_total').html(response.updatedCartSummary.sub_total)
                            toastr.success(response.message,
                                "{{ trans('messages.success') }}");
                            window.location.reload();
                        } else {
                            toastr.error(response.message, "{{ trans('messages.error') }}");
                        }
                    },
                    error: function(xhr, status, error) {
                        toastr.error("{{ trans('messages.cart_remove_error') }}",
                            "{{ trans('messages.error') }}");
                    }
                });
            });

            $(document).on('click', '.change_quantity', function() {
                var cartItemId = $(this).data('id');
                var action = $(this).data('action');
                var quantity = $('#quantity-field_' + cartItemId).val();
                if (action == 'plus') {
                    quantity = parseInt(quantity, 10) + 1;
                    $('#quantity-field_' + cartItemId).val(quantity);

                } else {
                    quantity = parseInt(quantity, 10) - 1;;
                    $('#quantity-field_' + cartItemId).val(quantity);
                }

                $.ajax({
                    url: '/cart/change_quantity',
                    type: 'POST',
                    data: {
                        cart_id: cartItemId,
                        action: action,
                        quantity: quantity
                    },
                    success: function(response) {
                        if (response.status === true) {
                            // Optionally, you can update the cart summary here
                            toastr.success(response.message,
                                "{{ trans('messages.success') }}");
                            window.location.reload();
                        } else {
                            toastr.error(response.message, "{{ trans('messages.error') }}");
                        }
                    },
                    error: function(xhr, status, error) {
                        toastr.error("{{ trans('messages.cart_remove_error') }}",
                            "{{ trans('messages.error') }}");
                    }
                });
            });

            $('#newsletterForm').on('submit', function(e) {
                e.preventDefault();

                $.ajax({
                    url: "{{ route('newsletter.subscribe') }}",
                    method: "POST",
                    data: $(this).serialize(),
                    success: function(response) {
                        $('#newsletterMessage').html('<p style="color: green;">' + response
                            .success + '</p>');
                        $('#newsletterForm')[0].reset();
                    },
                    error: function(xhr) {
                        let errors = xhr.responseJSON.errors;
                        if (errors && errors.email) {
                            $('#newsletterMessage').html('<p style="color: red;">' + errors
                                .email[0] + '</p>');
                        }
                    }
                });
            });

        });

        $('.proceedToCheckout').on('click', function() {
            window.location.href = '/checkout';
        });

        $(document).ajaxComplete(function() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
        });
    </script>

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
                    xhrFields: {
                        withCredentials: true
                    },
                    success: function(response) {
                        if (response.success) {
                            $('#couponMessage').html('<span style="color: green;">' + response
                                .message + '</span>');
                            // Reload the page to reflect changes
                            setTimeout(function() {
                                window.location.reload();
                            }, 1000);
                        } else {
                            $('#couponMessage').html('<span style="color: red;">' + response
                                .message + '</span>');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log('Coupon error:', xhr.responseText);
                        $('#couponMessage').html(
                            '<span style="color: red;">An error occurred. Please try again.</span>'
                        );
                    }
                });
            });


        });
    </script>

    @yield('script')

    <script src="{{ asset('assets/js/jquery.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('assets/js/owl.js') }}"></script>
    <script src="{{ asset('assets/js/wow.js') }}"></script>
    <script src="{{ asset('assets/js/validation.js') }}"></script>
    <script src="{{ asset('assets/js/jquery.fancybox.js') }}"></script>
    <script src="{{ asset('assets/js/appear.js') }}"></script>
    <script src="{{ asset('assets/js/isotope.js') }}"></script>
    <script src="{{ asset('assets/js/parallax-scroll.js') }}"></script>
    <script src="{{ asset('assets/js/jquery.nice-select.min.js') }}"></script>
    <script src="{{ asset('assets/js/scrolltop.min.js') }}"></script>
    <script src="{{ asset('assets/js/language.js') }}"></script>
    <script src="{{ asset('assets/js/countdown.js') }}"></script>
    <script src="{{ asset('assets/js/jquery-ui.js') }}"></script>
    <script src="{{ asset('assets/js/jquery.bootstrap-touchspin.js') }}"></script>

    <script src="{{ asset('assets/js/jquery.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.min.js') }}"></script>
    <script src="{{ asset('assets/js/owl.js') }}"></script>
    <script src="{{ asset('assets/js/wow.js') }}"></script>
    <script src="{{ asset('assets/js/validation.js') }}"></script>
    <script src="{{ asset('assets/js/jquery.fancybox.js') }}"></script>
    <script src="{{ asset('assets/js/appear.js') }}"></script>
    <script src="{{ asset('assets/js/isotope.js') }}"></script>
    <script src="{{ asset('assets/js/parallax-scroll.js') }}"></script>
    <script src="{{ asset('assets/js/jquery.nice-select.min.js') }}"></script>
    <script src="{{ asset('assets/js/scrolltop.min.js') }}"></script>
    <script src="{{ asset('assets/js/language.js') }}"></script>
    <script src="{{ asset('assets/js/jquery-ui.js') }}"></script>
    <script src="{{ asset('assets/js/jquery.bootstrap-touchspin.js') }}"></script>
    <script src="{{ asset('assets/js/countdown.js') }}"></script>
    <script src="{{ asset('assets/js/bxslider.js') }}"></script>

    <!-- main-js -->
    <script src="{{ asset('assets/js/script.js') }}"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="{{ asset('assets/js/script.js') }}"></script>

    <!-- Loader Script -->
    <script>
        window.addEventListener('load', function() {
            document.body.classList.add('page-loaded');
        });
    </script>

</body>

</html>
