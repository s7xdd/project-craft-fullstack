<footer class="main-footer home-3 footer-light " role="contentinfo">

    <div class="!flex md:!hidden">
        <div class="widget-section p_relative" style="padding-top: 20px;">
            <div class="large-container">
                <div class="row clearfix">
                    <!-- Logo Section -->
                    <div class="col-12 footer-column mb-4">
                        <div class="tp-footer-widget logo-widget">
                            <figure class="footer-logo">
                                <a href="/" aria-label="Home">
                                    <img src="{{ uploaded_asset(get_setting('site_icon_light')) }}" alt="Site Logo"
                                        class="mobile-logo" />
                                </a>
                            </figure>
                        </div>
                    </div>

                    <!-- Two Column Layout -->
                    <div class="col-12 footer-column">
                        <div class="row">
                            <!-- Left Column - Menu Items -->
                            <div class="col-6">
                                @if (isset($menu_items) && count($menu_items) > 0)
                                    @foreach ($menu_items as $menu)
                                        <div class="tp-footer-widget links-widget mb-4">
                                            <div class="widget-title" style="text-align: left;">
                                                <h4>{{ $menu->label }}</h4>
                                            </div>
                                            <div class="widget-content">
                                                <ul class="links-list clearfix" style="text-align: left;"
                                                    aria-label="{{ $menu->label }} links">
                                                    @if ($menu->child)
                                                        @foreach ($menu->child as $child)
                                                            <li style="text-align: left;">
                                                                <a href="{{ $child->link }}"
                                                                    aria-label="{{ $child->label }}">{{ $child->label }}</a>
                                                            </li>
                                                        @endforeach
                                                    @endif
                                                </ul>
                                            </div>
                                        </div>
                                    @endforeach
                                @endif
                            </div>

                            <!-- Right Column - Contact Info -->
                            <div class="col-6">
                                <div class="tp-footer-widget subscribe-widget">
                                    <div class="widget-title">
                                        <h4>Contact</h4>
                                    </div>
                                    <div class="widget-content">
                                        <ul class="info-list clearfix" aria-label="Contact information">
                                            <li>
                                                <i class="fas fa-map-marker-alt contact-icon" aria-hidden="true"></i>
                                                <span>{{ get_setting('footer_address') }}</span>
                                            </li>
                                            <li>
                                                <i class="fas fa-envelope contact-icon" aria-hidden="true"></i>
                                                <a href="mailto:{{ get_setting('footer_email') }}" class="contact-link"
                                                    aria-label="Email us">{{ get_setting('footer_email') }}</a>
                                            </li>
                                            <li>
                                                <i class="fas fa-phone-alt contact-icon" aria-hidden="true"></i>
                                                <a href="tel:{{ get_setting('footer_phone') }}" class="contact-link"
                                                    aria-label="Call us">{{ get_setting('footer_phone') }}</a>
                                            </li>
                                        </ul>

                                        <!-- Social Links -->
                                        <div class="social-links-container">
                                            @php
                                                $socialLinks = [
                                                    'facebook_link' => ['icon-14', 'fab fa-facebook-f', 'Facebook'],
                                                    'whatsapp_link' => ['icon-15', 'fab fa-whatsapp', 'Whatsapp'],
                                                    'instagram_link' => ['icon-16', 'fab fa-instagram', 'Instagram'],
                                                ];
                                            @endphp
                                            <div class="social-links-wrapper" aria-label="Social media links">
                                                @foreach ($socialLinks as $key => $icons)
                                                    @if (get_setting($key))
                                                        <a href="{{ get_setting($key) }}" class="social-link"
                                                            aria-label="{{ $icons[2] }}" target="_blank"
                                                            rel="noopener noreferrer">
                                                            <i class="{{ $icons[1] }}" aria-hidden="true"></i>
                                                        </a>
                                                    @endif
                                                @endforeach
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="!hidden md:!flex">
        <footer class="w-full bg-[#000000ff] px-4 py-5">

            <div class="max-w-screen-xl mx-auto flex flex-col justify-center items-center gap-2">

                <div class="tp-footer-widget logo-widget">
                    <figure class="footer-logo !mb-0">
                        <a href="/" aria-label="Home">
                            <img src="{{ uploaded_asset(get_setting('site_icon_light')) }}" alt="Site Logo"
                                class="mobile-logo" />
                        </a>
                    </figure>
                </div>

                <div class="flex items-center justify-between flex-col md:flex-row">
                    <ul class="flex flex-wrap gap-6 items-center text-base font-semibold text-black">
                        @if (isset($bottom_footer) && count($bottom_footer) > 0)
                            @foreach ($bottom_footer as $menu)
                                <li><a href="{{ $menu->link }}"
                                        class="text-white hover:underline">{{ $menu->label }}</a></li>
                            @endforeach
                        @endif
                </div>

                <div class="flex items-center gap-4">
                    @php
                        $socialLinks = [
                            'facebook_link' => ['icon-14', 'fab fa-facebook-f', 'Facebook'],
                            'whatsapp_link' => ['icon-15', 'fab fa-whatsapp', 'Whatsapp'],
                            'instagram_link' => ['icon-16', 'fab fa-instagram', 'Instagram'],
                        ];
                    @endphp
                    @foreach ($socialLinks as $key => $icons)
                        @if (get_setting($key))
                            <a href="{{ get_setting($key) }}" class="social-link" aria-label="{{ $icons[2] }}"
                                target="_blank" rel="noopener noreferrer">
                                <i class="{{ $icons[1] }}" aria-hidden="true"></i>
                            </a>
                        @endif
                    @endforeach
                </div>

            </div>

        </footer>
    </div>




    <!-- Copyright Section -->
    <div class="copyright-section"
        style="border-top: 1px solid #2b2b2bff; padding: 15px 0; background-color: #000000ff;">
        <div class="large-container">
            <div class="row">
                <div class="col-12">
                    <div class="copyright-content" style="text-align: center;">
                        <p style="margin: 0; color: #ffffffff; font-size: 14px;">
                            &copy; {{ date('Y') }} {{ get_setting('site_name') ?? 'Grostore' }}. All rights
                            reserved.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
