<section class="shop-details pt_70 pb_120">
    <div class="large-container">
        <div class="product-details-content mb_80">
            <div class="row clearfix">
                <div class="col-lg-6 col-md-12 col-sm-12 image-column">
                    <div class="bxslider">
                        {{ $slot }}
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-sm-12 content-column">
                    {{ $productDetails }}
                </div>
            </div>
        </div>
        {{ $productDescription ?? "" }}
    </div>
</section>