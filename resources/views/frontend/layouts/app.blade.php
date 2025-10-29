<!DOCTYPE html>
<html dir="{{ getDirection() }}" lang="{{ getActiveLanguage() }}">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    {!! SEO::generate() !!}
    <link rel="canonical" href="{{ url()->current() }}" />
    <script src="{{ asset('assets/js/vendor.js') }}" defer></script>
    <script src="{{ asset('assets/js/theme.js') }}" defer></script>
    <link rel="icon" type="image/svg" href="{{ uploaded_asset(get_setting('site_fav_icon')) }}">

    <script src="{{ asset('assets/js/jquery.js') }}"></script>

    <script src="{{ asset('js/hero-carousel.js') }}"></script>
    <script src="{{ asset('js/product-slider.js') }}"></script>

    <script async src="https://www.googletagmanager.com/gtag/js?id=G-GJB4R99EX9"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'G-GJB4R99EX9');
    </script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.css" />

    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>


    <script src="https://unpkg.com/embla-carousel@latest/embla-carousel.umd.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>

    <script src="https://cdn.form.io/formiojs/formio.full.min.js"></script>

    <link href="{{ asset('assets/css/flaticon.css') }}" rel="stylesheet" />
    <link href="{{ asset('assets/css/font-awesome-all.css') }}" rel="stylesheet" />

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


    <div id="main">

        @include('frontend.parts.navbar')

        <div style="background-color: {{ get_setting('base_color') }}; padding-top: 140px">
            @yield('content')
        </div>


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

        /* WhatsApp Section Styling */
        .whatsapp-section {
            margin: 4rem 0;
            position: relative;
        }

        .whatsapp-section .inner-container {
            position: relative;
            overflow: hidden;
        }

        .whatsapp-section .bg-cover {
            background-size: cover;
            background-position: center;
        }

        /* Ensure proper spacing from footer */
        .whatsapp-section+footer {
            margin-top: 0;
        }

        /* Enhanced button hover effects */
        .whatsapp-section a:hover {
            box-shadow: 0 10px 25px rgba(34, 197, 94, 0.3);
        }

        /* Responsive adjustments */
        @media (max-width: 768px) {
            .whatsapp-section {
                margin: 2rem 0;
                padding: 1rem;
            }

            .whatsapp-section .inner-container {
                padding: 1.5rem;
            }

            .whatsapp-section h3 {
                font-size: 1.5rem !important;
            }

            .whatsapp-section p {
                font-size: 1rem !important;
            }
        }
    </style>

    <script>
        @if (session('message'))
            toastr.options = {
                "closeButton": true,
                "progressBar": true,
                "positionClass": "toast-bottom-right",
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
                                        <span class="cart-ietm__price">${product.quantity} <i>x</i> INR ${product.main_price}</span>
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

    <script src="{{ asset('assets/js/bootstrap.min.js') }}"></script>

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

    <script src="{{ asset('assets/js/bxslider.js') }}"></script>

    <script src="{{ asset('assets/js/script.js') }}"></script>

    <script src="{{ asset('assets/js/mobile-search.js') }}"></script>

    <script>
        window.addEventListener('load', function() {
            document.body.classList.add('page-loaded');
        });
    </script>

</body>

</html>
