    <div class="fixed inset-0 z-50 lg:hidden">
        
        <!-- Close button -->
        <button class="absolute right-4 top-4 z-50 text-white">
            <i class="fas fa-times text-2xl"></i>
        </button>

        <!-- Menu container -->
        <nav class="fixed right-0 top-0 h-full w-[280px] transform overflow-y-auto bg-white shadow-xl">
            <!-- Logo -->
            <div class="p-4 border-b">
                <a href="/">
                    <img src="{{ uploaded_asset(get_setting('site_icon_light')) }}" 
                         alt="{{ get_setting('site_name') }}" 
                         class="h-10 w-auto"
                         title="{{ get_setting('site_name') }}" />
                </a>
            </div>

            <!-- Navigation items -->
            <div class="py-4">
                <ul>
                    @foreach ($menu_items as $item)
                        @include('frontend.parts.menu-item-mobile', ['item' => $item])
                    @endforeach
                </ul>
            </div>

            <!-- Contact info -->
            <div class="border-t px-4 py-6">
                <h4 class="text-lg font-semibold mb-4">Contact Info</h4>
                <ul class="space-y-3">
                    <li class="text-gray-600">{{ get_setting('address') }}</li>
                    <li>
                        <a href="tel:{{ get_setting('helpline_number') }}" 
                           class="text-blue-600 hover:text-blue-700">
                            {{ get_setting('helpline_number') }}
                        </a>
                    </li>
                    <li>
                        <a href="mailto:{{ get_setting('email') }}"
                           class="text-blue-600 hover:text-blue-700">
                            {{ get_setting('email') }}
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Social links -->
            <div class="border-t px-4 py-6">
                <ul class="flex space-x-4">
                    @if(get_setting('facebook_link'))
                    <li>
                        <a href="{{ get_setting('facebook_link') }}" 
                           target="_blank"
                           class="text-gray-600 hover:text-blue-600 transition-colors">
                            <span class="fab fa-facebook-f text-xl"></span>
                        </a>
                    </li>
                    @endif
                    @if(get_setting('twitter_link'))
                    <li>
                        <a href="{{ get_setting('twitter_link') }}" 
                           target="_blank"
                           class="text-gray-600 hover:text-blue-400 transition-colors">
                            <span class="fab fa-twitter text-xl"></span>
                        </a>
                    </li>
                    @endif
                    @if(get_setting('instagram_link'))
                    <li>
                        <a href="{{ get_setting('instagram_link') }}" 
                           target="_blank"
                           class="text-gray-600 hover:text-pink-600 transition-colors">
                            <span class="fab fa-instagram text-xl"></span>
                        </a>
                    </li>
                    @endif
                    @if(get_setting('youtube_link'))
                    <li>
                        <a href="{{ get_setting('youtube_link') }}" 
                           target="_blank"
                           class="text-gray-600 hover:text-red-600 transition-colors">
                            <span class="fab fa-youtube text-xl"></span>
                        </a>
                    </li>
                    @endif
                </ul>
            </div>
        </nav>
    </div>