<header class="w-full shadow-sm relative z-[150]">
    <!-- Top Bar -->
    <div class="w-full py-2 px-4" style="background-color: {{ get_setting('top_bar_base_color') }};">
        <div class="max-w-7xl mx-auto">
            <div class="flex items-center justify-between">
                @if (get_setting('helpline_title'))
                    <ul class="flex items-center space-x-2 m-0 p-0 list-none">
                        <li class="flex items-center justify-center text-sm md:text-base">
                            <i class="icon-1 mr-2"></i>
                            <span>{{ get_setting('helpline_title') }}</span>
                        </li>
                    </ul>
                @endif
                <div class="text-sm md:text-base">
                    <p class="m-0">{{ get_setting('helpline_number') }}</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Main Header -->
    <div class="w-full relative" style="background-color:{{ get_setting('header_base_color') }};">
        <div class="max-w-7xl mx-auto px-4">
            <div class="flex items-center justify-between py-4 gap-8">
                
                <!-- Logo -->

                <figure class="flex items-center w-32 m-0 flex-shrink-0">
                    <a href="/">
                        <img src="{{ uploaded_asset(get_setting('site_icon')) }}" alt="Logo" class="h-12 w-auto xl:h-14" />
                    </a>
                </figure>

                <!-- Desktop Navigation with Mega Menu -->
                <nav class="bg-green-300 hidden lg:block">
                        <div class="" id="navbarSupportedContent">
                           <div class="flex space-x-1 bg-blue-200">
                             @foreach ($menu_items as $item) 
                             <ul class="bg-red-200">
                                    @include('frontend.parts.menu-item', ['item' => $item]) 
                                </ul>
                                @endforeach
                           
                           </div>
                               
                        </div>
                </nav>

                    
                <!-- Right Side Menu -->
                <div class="flex items-center space-x-3 md:space-x-4 flex-shrink-0">
                    
                    <!-- Desktop Search -->
                    <div class="hidden lg:flex">
                        <form action="{{ route('products.index') }}" method="get" class="relative">
                            <div class="flex items-center">
                                <input 
                                    type="search" 
                                    name="search" 
                                    placeholder="Search Products"
                                    value="{{ request()->get('search') }}" 
                                    required 
                                    class="w-64 px-4 py-2 pr-10 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                                />
                                <button 
                                    type="submit"
                                    class="absolute right-2 p-1 text-gray-600 hover:text-blue-600 transition-colors"
                                >
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

                    <!-- Action Icons -->
                    <ul class="flex items-center space-x-2 md:space-x-4 m-0 p-0 list-none">
                        <!-- Mobile Search Icon -->
                        <li class="xl:hidden">
                            <a href="#" id="mobile-search-trigger" class="flex items-center justify-center p-2 hover:bg-gray-100 rounded-lg transition-colors">
                                <i class="icon-4 text-lg"></i>
                            </a>
                        </li>
                        
                        <!-- Cart -->
                        <li class="relative">
                            <a href="{{ route('cart.items') }}" class="flex items-center justify-center p-2 hover:bg-gray-100 rounded-lg transition-colors">
                                <i class="fas fa-cart-shopping text-lg"></i>
                                <span class="absolute -top-1 -right-1 bg-red-500 text-white text-xs font-bold rounded-full h-5 w-5 flex items-center justify-center" id="cart-count-header">{{ $cartCount }}</span>
                            </a>
                        </li>
                        
                        <!-- User -->
                        <li>
                            <a href="{{ route('orders.index') }}" class="flex items-center justify-center p-2 hover:bg-gray-100 rounded-lg transition-colors">
                                <i class="far fa-user text-lg"></i>
                            </a>
                        </li>
                    </ul>

                    <!-- Mobile Menu Toggle -->
                    <button 
                        id="mobile-nav-toggler"
                        class="lg:hidden flex flex-col justify-center items-center space-y-1 p-2 hover:bg-gray-100 rounded-md transition-colors ml-2"
                    >
                        <span class="block w-6 h-0.5 bg-gray-800"></span>
                        <span class="block w-6 h-0.5 bg-gray-800"></span>
                        <span class="block w-6 h-0.5 bg-gray-800"></span>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Mobile Menu -->
    <div id="mobile-menu" class="fixed inset-0 z-50 hidden">
        <!-- Backdrop -->
        <div class="fixed inset-0 bg-black bg-opacity-50 transition-opacity"></div>
        
        <!-- Menu Panel -->
        <div class="fixed inset-y-0 right-0 max-w-xs w-full bg-white shadow-xl overflow-y-auto">
            <!-- Close Button -->
            <button 
                id="close-mobile-menu"
                class="absolute top-4 right-4 p-2 text-gray-600 hover:text-gray-900 hover:bg-gray-100 rounded-full transition-colors z-10"
            >
                <i class="fas fa-times text-xl"></i>
            </button>

            <!-- Menu Content -->
            <div class="p-6">
                <!-- Logo -->
                <div class="mb-6 pr-12">
                    <a href="/">
                        <img src="{{ uploaded_asset(get_setting('site_icon_light')) }}" alt="{{ get_setting('site_name') }}" title="{{ get_setting('site_name') }}" class="h-12 w-auto" />
                    </a>
                </div>

                <!-- Navigation Links -->
                <div class="mb-6">
                    <ul class="space-y-1 m-0 p-0 list-none">
                        @foreach ($menu_items as $item)
                            @include('frontend.parts.menu-item-mobile', ['item' => $item])
                        @endforeach
                    </ul>
                </div>

                <!-- Contact Info -->
                <div class="pt-6 border-t">
                    <h4 class="text-lg font-semibold mb-4 text-gray-900">Contact Info</h4>
                    <ul class="space-y-3 m-0 p-0 list-none text-sm text-gray-600">
                        <li class="flex items-start">
                            <i class="fas fa-map-marker-alt mt-1 mr-3 text-gray-400"></i>
                            <span>{{ get_setting('address') }}</span>
                        </li>
                        <li>
                            <a href="tel:{{ get_setting('helpline_number') }}" class="flex items-center hover:text-blue-600 transition-colors">
                                <i class="fas fa-phone mt-1 mr-3 text-gray-400"></i>
                                <span>{{ get_setting('helpline_number') }}</span>
                            </a>
                        </li>
                        <li>
                            <a href="mailto:{{ get_setting('email') }}" class="flex items-center hover:text-blue-600 transition-colors">
                                <i class="fas fa-envelope mt-1 mr-3 text-gray-400"></i>
                                <span>{{ get_setting('email') }}</span>
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- Social Links -->
                <div class="pt-6 border-t mt-6">
                    <ul class="flex items-center space-x-4 m-0 p-0 list-none">
                        @if(get_setting('facebook_link'))
                        <li>
                            <a href="{{ get_setting('facebook_link') }}" target="_blank" class="flex items-center justify-center w-10 h-10 bg-gray-100 hover:bg-blue-600 hover:text-white rounded-full transition-all">
                                <span class="fab fa-facebook-f"></span>
                            </a>
                        </li>
                        @endif
                        @if(get_setting('twitter_link'))
                        <li>
                            <a href="{{ get_setting('twitter_link') }}" target="_blank" class="flex items-center justify-center w-10 h-10 bg-gray-100 hover:bg-blue-400 hover:text-white rounded-full transition-all">
                                <span class="fab fa-twitter"></span>
                            </a>
                        </li>
                        @endif
                        @if(get_setting('instagram_link'))
                        <li>
                            <a href="{{ get_setting('instagram_link') }}" target="_blank" class="flex items-center justify-center w-10 h-10 bg-gray-100 hover:bg-pink-600 hover:text-white rounded-full transition-all">
                                <span class="fab fa-instagram"></span>
                            </a>
                        </li>
                        @endif
                        @if(get_setting('youtube_link'))
                        <li>
                            <a href="{{ get_setting('youtube_link') }}" target="_blank" class="flex items-center justify-center w-10 h-10 bg-gray-100 hover:bg-red-600 hover:text-white rounded-full transition-all">
                                <span class="fab fa-youtube"></span>
                            </a>
                        </li>
                        @endif
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <!-- Mobile Search Popup -->
    <div id="mobile-search-popup" class="fixed inset-0 z-50 hidden">
        <!-- Overlay -->
        <div id="search-popup-overlay" class="fixed inset-0 bg-black bg-opacity-50"></div>
        
        <!-- Popup Content -->
        <div class="fixed inset-x-0 top-20 mx-4 bg-white rounded-lg shadow-2xl p-6 max-w-lg mx-auto transform transition-all">
            <!-- Header -->
            <div class="flex items-center justify-between mb-4">
                <h4 class="text-lg font-semibold text-gray-900">Search Products</h4>
                <button id="close-search-popup" class="text-gray-400 hover:text-gray-600 text-2xl leading-none">&times;</button>
            </div>
            
            <!-- Search Form -->
            <div>
                <form action="{{ route('products.index') }}" method="get">
                    <div class="relative">
                        <input 
                            type="search" 
                            name="search" 
                            placeholder="Search Products"
                            value="{{ request()->get('search') }}" 
                            required 
                            class="w-full px-4 py-3 pr-12 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
                        />
                        <button 
                            type="submit"
                            class="absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-600 hover:text-blue-600 transition-colors"
                        >
                            <i class="icon-4 text-xl"></i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>

<style>
/* Mega Menu Arrow */
.group:hover > a i.fa-chevron-down {
    transform: rotate(180deg);
    transition: transform 0.2s;
}

/* Ensure mega menu stays visible on hover */
.group:hover > div {
    visibility: visible;
    opacity: 1;
}

/* Smooth transitions for mega menu */
nav li > div {
    transition: visibility 0.2s, opacity 0.2s;
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const mobileNavToggler = document.getElementById('mobile-nav-toggler');
    const mobileMenu = document.getElementById('mobile-menu');
    const closeMobileMenu = document.getElementById('close-mobile-menu');
    const mobileSearchTrigger = document.getElementById('mobile-search-trigger');
    const mobileSearchPopup = document.getElementById('mobile-search-popup');
    const closeSearchPopup = document.getElementById('close-search-popup');
    const searchPopupOverlay = document.getElementById('search-popup-overlay');

    // Toggle mobile menu
    if (mobileNavToggler) {
        mobileNavToggler.addEventListener('click', function() {
            mobileMenu.classList.remove('hidden');
            document.body.style.overflow = 'hidden';
        });
    }

    if (closeMobileMenu) {
        closeMobileMenu.addEventListener('click', function() {
            mobileMenu.classList.add('hidden');
            document.body.style.overflow = '';
        });
    }

    // Close menu when clicking backdrop
    if (mobileMenu) {
        mobileMenu.addEventListener('click', function(e) {
            if (e.target === mobileMenu || e.target.classList.contains('bg-opacity-50')) {
                mobileMenu.classList.add('hidden');
                document.body.style.overflow = '';
            }
        });
    }

    // Mobile search popup
    if (mobileSearchTrigger) {
        mobileSearchTrigger.addEventListener('click', function(e) {
            e.preventDefault();
            mobileSearchPopup.classList.remove('hidden');
            document.body.style.overflow = 'hidden';
        });
    }

    if (closeSearchPopup) {
        closeSearchPopup.addEventListener('click', function() {
            mobileSearchPopup.classList.add('hidden');
            document.body.style.overflow = '';
        });
    }

    if (searchPopupOverlay) {
        searchPopupOverlay.addEventListener('click', function() {
            mobileSearchPopup.classList.add('hidden');
            document.body.style.overflow = '';
        });
    }

    // Close search popup on ESC key
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') {
            if (mobileSearchPopup && !mobileSearchPopup.classList.contains('hidden')) {
                mobileSearchPopup.classList.add('hidden');
                document.body.style.overflow = '';
            }
            if (mobileMenu && !mobileMenu.classList.contains('hidden')) {
                mobileMenu.classList.add('hidden');
                document.body.style.overflow = '';
            }
        }
    });
});
</script>