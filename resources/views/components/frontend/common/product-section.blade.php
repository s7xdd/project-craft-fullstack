<section class="shop-style-nine {{ $class ?? 'pt_70 pb_90' }}">
    <div class="large-container">
        <div class="project-tab">
            <div class="title-box mb_60">
                <div class="sec-title">
                    <h2>{{ $title }}</h2>
                </div>
            </div>
            <div class="p-tabs-content inner-container">
                {{ $slot }}
            </div>
        </div>
    </div>
</section>
<!-- shop-style-nine end -->