<section class="about-section pb_20">
    <div class="large-container">
        <div class="row align-items-center">
            <div class="col-lg-6 col-md-12 col-sm-12 image-column">
                <div class="image-box" style="width:780px; height:650px; overflow:hidden;">
                    <figure>
                        <img src="{{ $image }}" alt="{{ $alt }}" style="width:100%; object-fit:cover;">
                    </figure>
                </div>
            </div>
            <div class="col-lg-6 col-md-12 col-sm-12 content-column">
                <div class="content-box">
                    <div class="text-box mb_35">
                        {{ $content ?? "" }}
                    </div>
                    {{ $funFacts ?? "" }}
                </div>
            </div>
        </div>
    </div>
</section>