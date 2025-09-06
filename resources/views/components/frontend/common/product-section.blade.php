<section class="shop-style-nine relative {{ $class ?? 'pt-[70px] pb-[90px]' }}">
  <div class="large-container max-w-[1800px] px-4 mx-auto">
    <div class="project-tab">
      <div class="title-box flex items-center justify-center mb-[60px]">
        <div class="sec-title relative block z-[21]">
          <h2 class="relative block text-[48px] leading-[54px] text-center">
            {{ $title ?? "" }}
          </h2>
        </div>
      </div>
      <div class="p-tabs-content inner-container relative block">
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