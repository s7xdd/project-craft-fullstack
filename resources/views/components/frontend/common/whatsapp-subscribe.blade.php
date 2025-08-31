<section class="subscribe-section">
    <div class="bg-color"></div>
    <div class="large-container">
        <div class="inner-container relative bg-cover bg-center"
            style="background-image: url('{{ 'assets/images/whatsapp-bg.jpg' }}');">
            <div class="absolute inset-0 bg-black bg-opacity-80 pointer-events-none"></div>

            <div class="row align-items-center relative z-10">
                <div class="col-lg-6 col-md-12 col-sm-12 text-column">
                    <div class="text-box">
                        <h2>{{ "Order With WhatsApp" }}</h2>
                    </div>
                </div>
                <div class="col-lg-6 col-md-12 col-sm-12 form-column">
                    <div class="form-inner ml_130">
                        <button class="whatsapp-btn"
                            onclick="window.open('{{ 'https://wa.me/1234567890?text=Hello,%20I%20would%20like%20to%20place%20an%20order!' }}','_blank')">
                            <i class="fab fa-whatsapp"></i> {{ 'Order Now!' }}
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
