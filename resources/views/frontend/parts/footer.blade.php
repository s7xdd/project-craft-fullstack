<footer class="main-footer home-3 footer-light" role="contentinfo">
    <div class="widget-section p_relative pt_60 pb_40">
        <div class="large-container">
            <div class="row clearfix">
                <!-- Logo and Motto - Full width on mobile -->
                <div class="col-12 col-md-6 col-lg-3 footer-column">
                    <div class="tp-footer-widget logo-widget">
                        <figure class="footer-logo">
                            <a href="/" aria-label="Home">
                                <img src="{{ uploaded_asset(get_setting('site_icon_light')) }}" alt="Site Logo" class="mobile-logo" />
                            </a>
                        </figure>
                        <div class="widget-content">
                            <ul class="info-list clearfix" aria-label="Site motto">
                                <li>
                                    {{ get_setting('site_motto') }}
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                
                <!-- Menu Items - 6 columns on mobile (half width) -->
                @if (isset($menu_items) && count($menu_items) > 0)
                    @foreach ($menu_items as $menu)
                        <div class="col-6 col-md-3 col-lg-2 footer-column">
                            <div class="tp-footer-widget links-widget">
                                <div class="widget-title">
                                    <h4>{{ $menu->label }}</h4>
                                </div>
                                <div class="widget-content">
                                    <ul class="links-list clearfix" aria-label="{{ $menu->label }} links">
                                        @if ($menu->child)
                                            @foreach ($menu->child as $child)
                                                <li>
                                                    <a href="{{ $child->link }}" aria-label="{{ $child->label }}">{{ $child->label }}</a>
                                                </li>
                                            @endforeach
                                        @endif
                                    </ul>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif
                
                <!-- Support Section - Full width on mobile -->
                <div class="col-12 col-md-6 col-lg-3 footer-column mt-4 mt-md-0">
                    <div class="tp-footer-widget subscribe-widget">
                        <div class="widget-title">
                            <h4>Support</h4>
                        </div>
                        <div class="widget-content">
                            <ul class="info-list clearfix" aria-label="Contact information">
                                <li>
                                    <i class="fas fa-map-marker-alt contact-icon" aria-hidden="true"></i>
                                    <span>{{ get_setting('footer_address') }}</span>
                                </li>
                                <li>
                                    <i class="fas fa-envelope contact-icon" aria-hidden="true"></i>
                                    <a href="mailto:{{ get_setting('footer_email') }}" class="contact-link" aria-label="Email us">{{ get_setting('footer_email') }}</a>
                                </li>
                                <li>
                                    <i class="fas fa-phone-alt contact-icon" aria-hidden="true"></i>
                                    <a href="tel:{{ get_setting('footer_phone') }}" class="contact-link" aria-label="Call us">{{ get_setting('footer_phone') }}</a>
                                </li>
                            </ul>
                            
                            <!-- Social Links -->
                            <div class="social-links-container">
                                @php
                                    $socialLinks = [
                                        'facebook_link' => ['icon-14', 'fab fa-facebook-f', 'Facebook'],
                                        'twitter_link' => ['icon-15', 'fab fa-twitter', 'Twitter'],
                                        'instagram_link' => ['icon-16', 'fab fa-instagram', 'Instagram'],
                                        'youtube_link' => ['icon-17', 'fab fa-youtube', 'YouTube'],
                                    ];
                                @endphp
                                <div class="social-links-wrapper" aria-label="Social media links">
                                    @foreach ($socialLinks as $key => $icons)
                                        @if (get_setting($key))
                                            <a href="{{ get_setting($key) }}" class="social-link" aria-label="{{ $icons[2] }}" target="_blank" rel="noopener noreferrer">
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
    
    <!-- Footer Bottom Section -->
    <div class="footer-bottom">
        <div class="large-container">
            <div class="bottom-inner">
                <div class="copyright">
                    <p>
                        Copyright &copy; {{ date('Y') }}
                        <span class="text-white">Grostore</span>, All
                        Rights Reserved
                    </p>
                </div>
                @if (get_setting('payment_method_images'))
                    <div class="payment-methods">
                        <ul class="footer-card" aria-label="Payment methods">
                            @php
                                $paymentMethods = explode(',', get_setting('payment_method_images'));
                            @endphp
                            @foreach ($paymentMethods as $key => $image)
                                <li>
                                    <img src="{{ uploaded_asset($image) }}" alt="Payment Method {{ $key + 1 }}" class="payment-icon" />
                                </li>
                            @endforeach
                        </ul>
                    </div>
                @endif
            </div>
        </div>
    </div>
</footer>