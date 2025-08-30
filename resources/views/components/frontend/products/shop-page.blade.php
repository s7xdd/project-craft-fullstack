<section class="shop-page-section pt_20 pb_120">
    <div class="large-container">
        <div class="row clearfix">
            <div class="col-lg-3 col-md-12 col-sm-12 sidebar-side">
                {{ $sidebar ?? '' }}
            </div>

            <div class="col-lg-9 col-md-12 col-sm-12 content-side">
                <div class="our-shop">
                    {{ $sorting ?? '' }}
                    
                    <!-- card-content start -->
                    <div class="wrapper grid ">
                        <div class="shop-grid-content">
                            <div class="clearfix product-list">
                                {{ $slot }}
                            </div>
                        </div>
                        <!-- card-content end-->
                    </div>

                    {{ $pagination ?? '' }}
                </div>
            </div>
        </div>
    </div>
</section>