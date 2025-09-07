       <div class="mobile-menu">
    <div class="menu-backdrop"></div>
    <div class="close-btn"><i class="fas fa-times"></i></div>
    <nav class="menu-box">
        <div class="nav-logo">
            <a href="/">
                <img src="{{ uploaded_asset(get_setting('site_icon_light')) }}" alt="{{ get_setting('site_name') }}" title="{{ get_setting('site_name') }}" />
            </a>
        </div>
        {{-- <div class="mobile-search-box" style="padding: 15px;">
            <form action="{{ route('products.index') }}" method="get">
                <div class="form-group" style="position: relative;">
                    <input type="search" name="search" placeholder="Search Products" value="{{ request()->get('search') }}" required style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px;" />
                    <button type="submit" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); background: none; border: none; cursor: pointer;">
                        <i class="icon-4"></i>
                    </button>
                </div>
            </form>
        </div> --}}
        <div class="menu-outer">
            <ul class="navigation clearfix">
                @foreach ($menu_items as $item)
                    @include('frontend.parts.menu-item-mobile', ['item' => $item])
                @endforeach
            </ul>
        </div>
        <div class="contact-info">
            <h4>Contact Info</h4>
            <ul>
                <li>{{ get_setting('address') }}</li>
                <li>
                    <a href="tel:{{ get_setting('helpline_number') }}">{{ get_setting('helpline_number') }}</a>
                </li>
                <li>
                    <a href="mailto:{{ get_setting('email') }}">{{ get_setting('email') }}</a>
                </li>
            </ul>
        </div>
        <div class="social-links">
            <ul class="clearfix">
                @if(get_setting('facebook_link'))
                <li>
                    <a href="{{ get_setting('facebook_link') }}" target="_blank">
                        <span class="fab fa-facebook-f"></span>
                    </a>
                </li>
                @endif
                @if(get_setting('twitter_link'))
                <li>
                    <a href="{{ get_setting('twitter_link') }}" target="_blank">
                        <span class="fab fa-twitter"></span>
                    </a>
                </li>
                @endif
                @if(get_setting('instagram_link'))
                <li>
                    <a href="{{ get_setting('instagram_link') }}" target="_blank">
                        <span class="fab fa-instagram"></span>
                    </a>
                </li>
                @endif
                @if(get_setting('youtube_link'))
                <li>
                    <a href="{{ get_setting('youtube_link') }}" target="_blank">
                        <span class="fab fa-youtube"></span>
                    </a>
                </li>
                @endif
            </ul>
        </div>
    </nav>
</div>