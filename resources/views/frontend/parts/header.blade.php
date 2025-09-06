<header class="main-header header-style-two">
    <div class="header-top" style="background-color: black;">
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
    <div class="header-lower p_relative" style="background-color:rgb(255, 254, 243);">
        <div class="large-container">
            <div class="outer-box" style="padding-top: 16px; padding-bottom: 16px">
                <div class="search-inner">
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
                <div class="menu-area">
                    <div class="mobile-nav-toggler !rounded-md">
                        <i class="icon-bar"></i>
                        <i class="icon-bar"></i>
                        <i class="icon-bar"></i>
                    </div>
                    <nav class="main-menu navbar-expand-md navbar-light clearfix">
                        <div class="" id="navbarSupportedContent">
                            <ul class="navigation clearfix">
                                <li class="logo-box">
                                    <figure class="navbar-logo">
                                        <a href="/"><img src="{{ uploaded_asset(get_setting('site_icon')) }}"
                                                alt="" /></a>
                                    </figure>
                                </li>

                                @foreach ($menu_items as $item)
                                    @include('frontend.parts.menu-item', ['item' => $item])
                                @endforeach
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="menu-right-content">
                    <ul class="option-list">
                        <li class="shop-cart">
                            <button type="button">
                                <a href="{{ route('cart.items') }}">
                                    <i class="fas fa-cart-shopping"></i><span>3</span>
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
    <div class="sticky-header" style="background-color:rgb(255, 254, 243);">
        <div class="large-container">
            <div class="outer-box">
                <div class="search-inner">
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
                    <ul class="option-list">
                        <li class="shop-cart">
                            <button type="button">
                                <a href="{{ route('cart.items') }}">
                                    <i class="fas fa-cart-shopping"></i><span>3</span>
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
</header>
