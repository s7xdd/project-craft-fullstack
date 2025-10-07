<header class="main-header header-style-two">
    <div class="header-top" style="background-color: {{ get_setting('top_bar_base_color') }};">
        <div class="large-container">
            <div class="top-inner">
                @if (get_setting('helpline_title'))
                    <ul class="info-list" style="margin-bottom: 0px">
                        <li class="!flex !flex-row !items-center !text-center !justify-center">
                            <i class="icon-1"></i><span>{{ get_setting('helpline_title') }}</span>
                        </li>
                    </ul>
                @endif
                <div class="text">
                    <p style="margin-bottom: 0px">
                        {{ get_setting('helpline_number') }}
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="header-lower p_relative" style="background-color:{{ get_setting('header_base_color') }};">
        <div class="large-container">
            <div class="outer-box">

                <figure class="navbar-logo pt-1 !hidden xl:!flex">
                    <a href="/"><img src="{{ uploaded_asset(get_setting('site_icon')) }}" alt="" /></a>
                </figure>

                <div class="menu-area">
                    <div class="mobile-nav-toggler !rounded-md">
                        <i class="icon-bar"></i>
                        <i class="icon-bar"></i>
                        <i class="icon-bar"></i>
                    </div>
                    <div class="mobile-logo-box !bg-white">
                        <figure class="navbar-logo !mb-0">
                            <a href="/"><img src="{{ uploaded_asset(get_setting('site_icon')) }}"
                                    alt="" /></a>
                        </figure>
                    </div>
                    <nav class="main-menu navbar-expand-md navbar-light clearfix">
                        <div class="" id="navbarSupportedContent">
                            <ul class="navigation clearfix">

                                @foreach ($menu_items as $item)
                                    @include('frontend.parts.menu-item', ['item' => $item])
                                @endforeach
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="menu-right-content">

                    <div class="search-inner">
                        <form action="{{ route('products.index') }}" method="get" class="pt-3">
                            <div class="form-group">
                                <input type="search" name="search" placeholder="Search Products"
                                    value="{{ request()->get('search') }}" required />
                                <button type="submit">
                                    <i class="icon-4"></i>
                                </button>
                            </div>
                        </form>
                    </div>

                    @php
                        $user = getUser();
                        $cartCount = 0;

                        if ($user['users_id'] == null) {
                            $cartCount = 0;
                        } else {
                            $cartCount = cartCount();
                        }

                    @endphp

                    <ul class="option-list !gap-0 md:!gap-5 !flex !flex-row !items-center !pl-0 md:!pl-[2rem]">
                        <li class="search-icon-mobile">
                            <a href="#" id="mobile-search-trigger" style="display: flex"><i
                                    class="icon-4"></i></a>
                        </li>
                        <li class="shop-cart">
                            <button type="button">
                                <a href="{{ route('cart.items') }}">
                                    <i class="fas fa-cart-shopping"></i><span class="bg-red-500"
                                        id="cart-count-header">{{ $cartCount }}</span>
                                </a>
                            </button>
                        </li>
                        <li>
                            <a href="{{ route('orders.index') }}"><i class="far fa-user"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="sticky-header" style="background-color:{{ get_setting('header_base_color') }};">
        <div class="large-container">
            <div class="outer-box">

                <div class="menu-area">
                    <nav class="main-menu clearfix">
                        <ul class="navigation clearfix">


                            @foreach ($menu_items as $item)
                                @include('frontend.parts.menu-item', ['item' => $item])
                            @endforeach
                        </ul>
                    </nav>
                </div>
                <div class="menu-right-content">
                    <div class="search-inner !mt-3">
                        <form action="{{ route('products.index') }}" method="get">
                            <div class="form-group">
                                <input type="search" name="search" placeholder="Search Products"
                                    value="{{ request()->get('search') }}" required />
                                <button type="submit">
                                    <i class="icon-4"></i>
                                </button>
                            </div>
                        </form>
                    </div>

                    <ul class="option-list">
                        <li class="shop-cart">
                            <button type="button">
                                <a href="{{ route('cart.items') }}">
                                    <i class="fas fa-cart-shopping"></i><span class="bg-red-500"
                                        id="cart-count-sticky">{{ cartCount() }}</span>
                                </a>
                            </button>
                        </li>
                        <li>
                            <a href="{{ route('orders.index') }}"><i class="far fa-user"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Mobile Search Popup -->
    <div class="mobile-search-popup" id="mobile-search-popup" style="display: none;">
        <div class="search-popup-overlay" id="search-popup-overlay"></div>
        <div class="search-popup-content">
            <div class="search-popup-header">
                <h4>Search Products</h4>
                <span class="close-search-popup" id="close-search-popup">&times;</span>
            </div>
            <div class="search-popup-body">
                <form action="{{ route('products.index') }}" method="get">
                    <div class="form-group">
                        <input type="search" name="search" placeholder="Search Products"
                            value="{{ request()->get('search') }}" required />
                        <button type="submit"><i class="icon-4"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>
