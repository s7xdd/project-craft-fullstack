<style>
/* shop-style-nine styles */
.shop-style-nine {
    position: relative;
}

.shop-style-nine .title-box {
    position: relative;
    display: flex;
    align-items: center;
    justify-content: space-between;
}

/* project-tab styles */
.project-tab .p-tab {
    position: absolute;
    left: 0px;
    top: 0px;
    width: 100%;
    height: auto;
    opacity: 0;
    visibility: hidden;
}

.project-tab .p-tab.active-tab {
    position: relative;
    visibility: visible;
    opacity: 1;
    z-index: 5;
}

.project-tab .p-tabs-content {
    position: relative;
    display: block;
}

.project-tab .p-tab.active-tab .shop-block-one,
.project-tab .p-tab.active-tab .collection-block-one {
    -webkit-transform: scaleX(1);
    -ms-transform: scaleX(1);
    -o-transform: scaleX(1);
    -moz-transform: scaleX(1);
    transform: scaleX(1);
    -webkit-transition: all 700ms ease;
    -ms-transition: all 700ms ease;
    -o-transition: all 700ms ease;
    transition: all 700ms ease;
}

.project-tab .p-tab .shop-block-one,
.project-tab .p-tab .collection-block-one {
    position: relative;
    -webkit-transform: scaleX(0);
    -ms-transform: scaleX(0);
    -o-transform: scaleX(0);
    -moz-transform: scaleX(0);
    transform: scaleX(0);
}

/* large-container styles */
.large-container {
    max-width: 1800px;
    padding: 0px 15px;
    margin: 0 auto;
}

/* sec-title styles */
.sec-title {
    position: relative;
    display: block;
    z-index: 1;
}

.sec-title h2 {
    position: relative;
    display: block;
    font-size: 48px;
    line-height: 54px;
}

.sec-title h2 span {
    /* Empty as per original */
}

.sec-title.light h2 {
    color: #fff;
}

/* margin and padding utilities */
.mb_60 {
    margin-bottom: 60px;
}

.pt_70 {
    padding-top: 70px;
}

.pb_90 {
    padding-bottom: 90px;
}
</style>

<section class="shop-style-nine {{ $class ?? 'pt_70 pb_90' }}">
    <div class="large-container">
        <div class="project-tab">
            <div class="title-box mb_60">
                <div class="sec-title">
                    <h2>{{ $title ?? "" }}</h2>
                </div>
            </div>
            <div class="p-tabs-content inner-container">
                {{ $slot }}
            </div>
        </div>
    </div>
</section>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Product Tabs functionality
    if (document.querySelector('.project-tab')) {
        const tabButtons = document.querySelectorAll('.project-tab .product-tab-btns .p-tab-btn');
        tabButtons.forEach(button => {
            button.addEventListener('click', function(e) {
                e.preventDefault();
                const target = document.querySelector(this.getAttribute('data-tab'));

                if (target && target.classList.contains('active-tab')) {
                    return false;
                } else {
                    // Remove active class from all buttons
                    document.querySelectorAll('.project-tab .product-tab-btns .p-tab-btn').forEach(btn => {
                        btn.classList.remove('active-btn');
                    });
                    // Add active class to clicked button
                    this.classList.add('active-btn');

                    // Remove active class from all tabs
                    document.querySelectorAll('.project-tab .p-tabs-content .p-tab').forEach(tab => {
                        tab.classList.remove('active-tab');
                    });
                    // Add active class to target tab
                    if (target) {
                        target.classList.add('active-tab');
                    }
                }
            });
        });
    }
});
</script>

<!-- shop-style-nine end -->