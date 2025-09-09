@php
    $homePageContent = getHomePageContent();
@endphp

<section class="whatsapp-section py-8 sm:py-12 md:py-16" style="margin-bottom: 0px">
    <div class="large-container px-4 sm:px-6 lg:px-8 max-w-[1400px] mx-auto">
        <div class="inner-container relative bg-white rounded-xl sm:rounded-2xl shadow-lg sm:shadow-xl overflow-hidden">
            <!-- Background Pattern -->
            <div class="absolute inset-0 bg-cover bg-center opacity-5"
                 style="background-image: url('{{ asset('assets/images/whatsapp-bg.jpg') }}');">
            </div>

            <!-- Decorative Elements - Responsive positioning -->
            <div class="absolute top-0 left-0 w-16 h-16 sm:w-24 sm:h-24 lg:w-32 lg:h-32 bg-green-200 rounded-full -translate-x-8 -translate-y-8 sm:-translate-x-12 sm:-translate-y-12 lg:-translate-x-16 lg:-translate-y-16 opacity-20"></div>
            <div class="absolute bottom-0 right-0 w-12 h-12 sm:w-18 sm:h-18 lg:w-24 lg:h-24 bg-green-300 rounded-full translate-x-6 translate-y-6 sm:translate-x-9 sm:translate-y-9 lg:translate-x-12 lg:translate-y-12 opacity-30"></div>

            <div class="relative z-10 flex flex-col lg:flex-row items-center justify-between gap-6 sm:gap-8 p-4 sm:p-6 md:p-8 lg:p-12">
                <!-- Content Section -->
                <div class="text-center lg:text-left flex-1 w-full lg:w-auto">
                    <div class="inline-flex items-center gap-2 sm:gap-3 mb-3 sm:mb-4">
                        <div class="w-8 h-8 sm:w-10 sm:h-10 md:w-12 md:h-12 bg-green-500 rounded-full flex items-center justify-center flex-shrink-0">
                            <svg class="w-4 h-4 sm:w-5 sm:h-5 md:w-6 md:h-6 text-white" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893A11.821 11.821 0 0020.885 3.488"/>
                            </svg>
                        </div>
                        <h3 class="text-lg sm:text-xl md:text-2xl lg:text-3xl font-bold text-gray-800">Order Now</h3>
                    </div>
                    
                    <p class="text-gray-600 text-sm sm:text-base md:text-lg mb-4 sm:mb-6 max-w-full sm:max-w-md mx-auto lg:mx-0 leading-relaxed">
                        {{ $homePageContent->getTranslation('heading2', getActiveLanguage()) }}
                    </p>

                    <!-- WhatsApp Button Section - Moved inside content section -->
                    <div class="w-full text-center lg:text-left mt-4 sm:mt-6">
                        <a href="{{ $homePageContent->getTranslation('heading4', getActiveLanguage()) }}"
                           target="_blank"
                           rel="noopener noreferrer"
                           class="inline-flex items-center justify-center gap-2 sm:gap-3 bg-green-500 hover:bg-green-600 text-white font-semibold px-3 py-3 sm:px-4 sm:py-4 md:px-6 md:py-4 rounded-lg sm:rounded-xl transition-all duration-300 shadow-lg hover:shadow-xl transform hover:-translate-y-1 w-full sm:w-auto min-w-[200px] sm:min-w-[250px]">
                            <svg class="w-4 h-4 sm:w-5 sm:h-5 md:w-6 md:h-6 flex-shrink-0" fill="currentColor" viewBox="0 0 24 24">
                                <path d="M17.472 14.382c-.297-.149-1.758-.867-2.03-.967-.273-.099-.471-.148-.67.15-.197.297-.767.966-.94 1.164-.173.199-.347.223-.644.075-.297-.15-1.255-.463-2.39-1.475-.883-.788-1.48-1.761-1.653-2.059-.173-.297-.018-.458.13-.606.134-.133.298-.347.446-.52.149-.174.198-.298.298-.497.099-.198.05-.371-.025-.52-.075-.149-.669-1.612-.916-2.207-.242-.579-.487-.5-.669-.51-.173-.008-.371-.01-.57-.01-.198 0-.52.074-.792.372-.272.297-1.04 1.016-1.04 2.479 0 1.462 1.065 2.875 1.213 3.074.149.198 2.096 3.2 5.077 4.487.709.306 1.262.489 1.694.625.712.227 1.36.195 1.871.118.571-.085 1.758-.719 2.006-1.413.248-.694.248-1.289.173-1.413-.074-.124-.272-.198-.57-.347m-5.421 7.403h-.004a9.87 9.87 0 01-5.031-1.378l-.361-.214-3.741.982.998-3.648-.235-.374a9.86 9.86 0 01-1.51-5.26c.001-5.45 4.436-9.884 9.888-9.884 2.64 0 5.122 1.03 6.988 2.898a9.825 9.825 0 012.893 6.994c-.003 5.45-4.437 9.884-9.885 9.884m8.413-18.297A11.815 11.815 0 0012.05 0C5.495 0 .16 5.335.157 11.892c0 2.096.547 4.142 1.588 5.945L.057 24l6.305-1.654a11.882 11.882 0 005.683 1.448h.005c6.554 0 11.89-5.335 11.893-11.893A11.821 11.821 0 0020.885 3.488"/>
                            </svg>
                            <span class="text-sm sm:text-base md:text-lg font-medium truncate">{{ $homePageContent->getTranslation('heading3', getActiveLanguage()) }}</span>
                            <svg class="w-3 h-3 sm:w-4 sm:h-4 md:w-5 md:h-5 flex-shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"/>
                            </svg>
                        </a>

                        <p class="text-xs sm:text-sm text-gray-500 mt-2 sm:mt-3">Click to start a conversation</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
