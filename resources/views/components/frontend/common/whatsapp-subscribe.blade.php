@php
    $homePageContent = getHomePageContent();
@endphp

<section class="subscribe-section">
    <div class="bg-color"></div>
    <div class="large-container">
        <div class="inner-container relative bg-cover bg-center"
            style="background-image: url('{{ asset('assets/images/whatsapp-bg.jpg') }}');">
            <div class="absolute inset-0 bg-black bg-opacity-80 pointer-events-none"></div>

            <div class="row align-items-center relative z-10">
                <div class="col-lg-6 col-md-12 col-sm-12 text-column">
                    <div class="text-box">
                        <h2>{{ $homePageContent->getTranslation('heading2', getActiveLanguage()) }}</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-sm-12 form-column">
                    <div class="form-inner ml_130">
                        <button class="whatsapp-btn"
                            onclick="window.open('{{ $homePageContent->getTranslation('heading4', getActiveLanguage()) }}','_blank')">
                            <i class="fab fa-whatsapp"></i>
                            {{ $homePageContent->getTranslation('heading3', getActiveLanguage()) }}
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
