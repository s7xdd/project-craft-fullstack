<footer class="w-full bg-black text-white" role="contentinfo">

    <!-- Mobile View -->
    <div class="!flex md:!hidden">
        <div class="relative w-full pt-5">
            <div class="max-w-7xl mx-auto px-4">
                <div class="flex flex-wrap -mx-4">
                    <!-- Logo Section -->
                    <div class="w-full px-4 mb-4">
                        <div class="flex justify-start">
                            <figure class="m-0">
                                <a href="/" aria-label="Home">
                                    <img src="{{ uploaded_asset(get_setting('site_icon_light')) }}" alt="Site Logo"
                                        class="w-32 h-auto object-contain" />
                                </a>
                            </figure>
                        </div>
                    </div>

                    <!-- Two Column Layout -->
                    <div class="w-full px-4">
                        <div class="flex flex-wrap -mx-4">
                            <!-- Left Column - Menu Items -->
                            <div class="w-1/2 px-4">
                                @if (isset($menu_items) && count($menu_items) > 0)
                                    @foreach ($menu_items as $menu)
                                        <div class="mb-4">
                                            <div class="text-left mb-3">
                                                <h4 class="text-lg font-semibold">{{ $menu->label }}</h4>
                                            </div>
                                            <div>
                                                <ul class="list-none p-0 m-0 text-left" aria-label="{{ $menu->label }} links">
                                                    @if ($menu->child)
                                                        @foreach ($menu->child as $child)
                                                            <li class="mb-2 text-left">
                                                                <a href="{{ $child->link }}"
                                                                    aria-label="{{ $child->label }}"
                                                                    class="text-gray-300 hover:text-white transition-colors">{{ $child->label }}</a>
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
                            <div class="w-1/2 px-4">
                                <div>
                                    <div class="mb-3">
                                        <h4 class="text-lg font-semibold">Contact</h4>
                                    </div>
                                    <div>
                                        <ul class="list-none p-0 m-0" aria-label="Contact information">
                                            <li class="mb-3 flex items-start gap-2">
                                                <i class="fas fa-map-marker-alt text-sm mt-1 flex-shrink-0" aria-hidden="true"></i>
                                                <span class="text-gray-300 text-sm">{{ get_setting('footer_address') }}</span>
                                            </li>
                                            <li class="mb-3 flex items-center gap-2">
                                                <i class="fas fa-envelope text-sm flex-shrink-0" aria-hidden="true"></i>
                                                <a href="mailto:{{ get_setting('footer_email') }}"
                                                    class="text-gray-300 hover:text-white transition-colors text-sm"
                                                    aria-label="Email us">{{ get_setting('footer_email') }}</a>
                                            </li>
                                            <li class="mb-3 flex items-center gap-2">
                                                <i class="fas fa-phone-alt text-sm flex-shrink-0" aria-hidden="true"></i>
                                                <a href="tel:{{ get_setting('footer_phone') }}"
                                                    class="text-gray-300 hover:text-white transition-colors text-sm"
                                                    aria-label="Call us">{{ get_setting('footer_phone') }}</a>
                                            </li>
                                        </ul>

                                        <!-- Social Links -->
                                        <div class="mt-6">
                                            @php
                                                $socialLinks = [
                                                    'facebook_link' => ['icon-14', 'fab fa-facebook-f', 'Facebook'],
                                                    'whatsapp_link' => ['icon-15', 'fab fa-whatsapp', 'Whatsapp'],
                                                    'instagram_link' => ['icon-16', 'fab fa-instagram', 'Instagram'],
                                                ];
                                            @endphp
                                            <div class="flex gap-3" aria-label="Social media links">
                                                @foreach ($socialLinks as $key => $icons)
                                                    @if (get_setting($key))
                                                        <a href="{{ get_setting($key) }}"
                                                            class="w-10 h-10 flex items-center justify-center bg-gray-800 hover:bg-gray-700 rounded-full transition-colors"
                                                            aria-label="{{ $icons[2] }}" target="_blank"
                                                            rel="noopener noreferrer">
                                                            <i class="{{ $icons[1] }} text-white" aria-hidden="true"></i>
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

    <!-- Desktop View -->
    <div class="!hidden md:!flex">
        <footer class="w-full bg-black px-4 py-5">

            <div class="max-w-screen-xl mx-auto flex flex-col justify-center items-center gap-2">

                <div class="flex flex-col">
                    <figure class="!mb-0 m-0">
                        <a href="/" aria-label="Home">
                            <img src="{{ uploaded_asset(get_setting('site_icon_light')) }}" alt="Site Logo"
                                class="w-40 h-auto object-contain" />
                        </a>
                    </figure>
                </div>

                <div class="flex items-center justify-between flex-col md:flex-row">
                    <ul class="flex flex-wrap gap-6 items-center text-base font-semibold text-black !pl-0 list-none p-0 m-0">
                        @if (isset($bottom_footer) && count($bottom_footer) > 0)
                            @foreach ($bottom_footer as $menu)
                                <li><a href="{{ $menu->link }}"
                                        class="text-white hover:underline transition-all">{{ $menu->label }}</a></li>
                            @endforeach
                        @endif
                    </ul>
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
                            <a href="{{ get_setting($key) }}"
                                class="w-10 h-10 flex items-center justify-center bg-gray-800 hover:bg-gray-700 rounded-full transition-colors"
                                aria-label="{{ $icons[2] }}"
                                target="_blank" rel="noopener noreferrer">
                                <i class="{{ $icons[1] }} text-white" aria-hidden="true"></i>
                            </a>
                        @endif
                    @endforeach
                </div>

            </div>

        </footer>
    </div>
</footer>





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
