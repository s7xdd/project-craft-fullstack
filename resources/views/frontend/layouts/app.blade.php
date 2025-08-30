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

    <link href="assets/css/font-awesome-all.css" rel="stylesheet" />
    <link href="assets/css/flaticon.css" rel="stylesheet" />
    <link href="assets/css/owl.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/jquery.fancybox.min.css" rel="stylesheet" />
    <link href="assets/css/animate.css" rel="stylesheet" />
    <link href="assets/css/nice-select.css" rel="stylesheet" />
    <link href="assets/css/elpath.css" rel="stylesheet" />
    <link href="assets/css/color.css" id="jssDefault" rel="stylesheet" />
    <link href="assets/css/rtl.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/module-css/header.css" rel="stylesheet" />
    <link href="assets/css/module-css/banner.css" rel="stylesheet" />
    <link href="assets/css/module-css/shop.css" rel="stylesheet" />
    <link href="assets/css/module-css/featured.css" rel="stylesheet" />
    <link href="assets/css/module-css/category.css" rel="stylesheet" />
    <link href="assets/css/module-css/ads.css" rel="stylesheet" />
    <link href="assets/css/module-css/popular-product.css" rel="stylesheet" />
    <link href="assets/css/module-css/highlights.css" rel="stylesheet" />
    <link href="assets/css/module-css/collection.css" rel="stylesheet" />
    <link href="assets/css/module-css/fluid.css" rel="stylesheet" />
    <link href="assets/css/module-css/deals.css" rel="stylesheet" />
    <link href="assets/css/module-css/news.css" rel="stylesheet" />
    <link href="assets/css/module-css/subscribe.css" rel="stylesheet" />
    <link href="assets/css/module-css/footer.css" rel="stylesheet" />
    <link href="assets/css/responsive.css" rel="stylesheet" />

    <link href="assets/css/font-awesome-all.css" rel="stylesheet" />
    <link href="assets/css/flaticon.css" rel="stylesheet" />
    <link href="assets/css/owl.css" rel="stylesheet" />
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
    <link href="assets/css/jquery.fancybox.min.css" rel="stylesheet" />
    <link href="assets/css/animate.css" rel="stylesheet" />
    <link href="assets/css/nice-select.css" rel="stylesheet" />
    <link href="assets/css/elpath.css" rel="stylesheet" />
    <link href="assets/css/jquery-ui.css" rel="stylesheet" />
    <link href="assets/css/color.css" id="jssDefault" rel="stylesheet" />
    <link href="assets/css/rtl.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
    <link href="assets/css/module-css/header.css" rel="stylesheet" />
    <link href="assets/css/module-css/shop-details.css" rel="stylesheet" />
    <link href="assets/css/module-css/shop.css" rel="stylesheet" />

    <link href="assets/css/module-css/featured.css" rel="stylesheet" />
    <link href="assets/css/module-css/popular-product.css" rel="stylesheet" />
    <link href="assets/css/module-css/subscribe.css" rel="stylesheet" />
    <link href="assets/css/module-css/footer.css" rel="stylesheet" />
    <link href="assets/css/responsive.css" rel="stylesheet" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />

    <link href="https://fonts.googleapis.com/css2?family=Nunito:ital,wght@0,200..1000;1,200..1000&display=swap"
        rel="stylesheet">


    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</head>

<body>
    <div id="main">
        @include('frontend.parts.header')

        @yield('content')

        @include('frontend.parts.footer')
    </div>

    <script>
        @if (session('message'))
            toastr.options = {
                "closeButton": true,
                "progressBar": true,
                "positionClass": "toast-top-right",
            };
            toastr["{{ session('alert-type', 'info') }}"]("{{ session('message') }}");
        @endif

        if ($('#lang-change').length > 0) {
            $('#lang-change').on('change', function(e) {
                e.preventDefault();
                var $this = $(this);
                var locale = $this.val();
                $.post('{{ route('language.change') }}', {
                    _token: '{{ csrf_token() }}',
                    locale: locale
                }, function(data) {
                    location.reload();
                });
            });
        }

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

            $(document).on('click', '.wishlist-btn', function() {
                const heartIcon = $(this).find('.lnr-heart');
                const productSlug = $(this).data('product-slug');
                const productSku = $(this).data('product-sku');
                const url = '/wishlist/store';

                $.ajax({
                    url: url,
                    type: 'POST',
                    data: {
                        productSlug: productSlug,
                        productSku: productSku,
                        _token: $('meta[name="csrf-token"]').attr('content')
                    },
                    success: function(response) {
                        if (response.status == true) {
                            $('.wishlist_count').text(response.wishlist_count);
                            toastr.success(response.message,
                                "{{ trans('messages.success') }}");
                            heartIcon.toggleClass('active');

                            if (response.wishlist_status == 1) {
                                $('.wishlist_msg').html(
                                    "{{ trans('messages.remove_wishlist') }}");
                            } else {
                                $('.wishlist_msg').html(
                                    "{{ trans('messages.add_wishlist') }}");
                            }
                        } else {
                            toastr.error(response.message, "{{ trans('messages.error') }}");
                        }
                    },
                    error: function(xhr, status, error) {
                        toastr.error("{{ trans('messages.wishlist_remove_error') }}",
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
            $.ajax({
                url: '/check-login-status', // Endpoint to check login status
                type: 'GET',
                success: function(response) {
                    if (response.is_logged_in) {
                        // Redirect to checkout page
                        window.location.href = '/checkout';
                    } else {
                        // Show alert if not logged in
                        toastr.error("{{ trans('messages.login_msg') }}",
                            "{{ trans('messages.error') }}");
                    }
                },
                error: function() {
                    toastr.error("{{ trans('messages.error_try_again') }}",
                        "{{ trans('messages.error') }}");
                }
            });
        });

        $(document).ajaxComplete(function() {
            $.ajaxSetup({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                }
            });
        });
    </script>

    @yield('script')

    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/owl.js"></script>
    <script src="assets/js/wow.js"></script>
    <script src="assets/js/validation.js"></script>
    <script src="assets/js/jquery.fancybox.js"></script>
    <script src="assets/js/appear.js"></script>
    <script src="assets/js/isotope.js"></script>
    <script src="assets/js/parallax-scroll.js"></script>
    <script src="assets/js/jquery.nice-select.min.js"></script>
    <script src="assets/js/scrolltop.min.js"></script>
    <script src="assets/js/language.js"></script>
    <script src="assets/js/countdown.js"></script>
    <script src="assets/js/jquery-ui.js"></script>
    <script src="assets/js/jquery.bootstrap-touchspin.js"></script>

    <script src="assets/js/jquery.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/owl.js"></script>
    <script src="assets/js/wow.js"></script>
    <script src="assets/js/validation.js"></script>
    <script src="assets/js/jquery.fancybox.js"></script>
    <script src="assets/js/appear.js"></script>
    <script src="assets/js/isotope.js"></script>
    <script src="assets/js/parallax-scroll.js"></script>
    <script src="assets/js/jquery.nice-select.min.js"></script>
    <script src="assets/js/scrolltop.min.js"></script>
    <script src="assets/js/language.js"></script>
    <script src="assets/js/jquery-ui.js"></script>
    <script src="assets/js/jquery.bootstrap-touchspin.js"></script>
    <script src="assets/js/countdown.js"></script>
    <script src="assets/js/bxslider.js"></script>

    <!-- main-js -->
    <script src="assets/js/script.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/script.js"></script>

</body>

</html>
