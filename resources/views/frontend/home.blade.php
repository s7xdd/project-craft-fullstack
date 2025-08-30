@extends('frontend.layouts.app')

@section('content')
    <x-frontend.banner>
        <x-frontend.banner-slide 
            image="assets/images/banner/banner-img-1.jpg"
            title="Premium Art & Crafts Supplies"
            link="index.html"
            buttonText="View Shop" />
        
        <x-frontend.banner-slide 
            image="assets/images/banner/banner-img-2.jpg"
            title="Premium Art & Crafts Supplies"
            link="index.html"
            buttonText="View Shop" />
    </x-frontend.banner>

    <x-frontend.highlights>
        <x-frontend.highlight-item 
            icon="assets/images/icons/fast-delivery.png"
            text="Same day Product Delivery" />
        
        <x-frontend.highlight-item 
            icon="assets/images/icons/rating.png"
            text="100% Customer Satisfaction" />
        
        <x-frontend.highlight-item 
            icon="assets/images/icons/peace.png"
            text="Help and access is our mission" />
        
        <x-frontend.highlight-item 
            icon="assets/images/icons/high-quality.png"
            text="100% quality Art Supplies" />
        
        <x-frontend.highlight-item 
            icon="assets/images/icons/customer-service.png"
            text="24/7 Support for Clients" />
    </x-frontend.highlights>

    <x-frontend.product-section title="Top <span>Selling Products</span>">
        <div class="p-tab active-tab" id="tab-1">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Premium Epoxy Resin Kit"
                    category="Resins"
                    name="Premium Epoxy Resin Kit"
                    originalPrice="₹899"
                    price="₹799"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="UV Resin Art Set"
                    category="Pigments"
                    name="UV Resin Art Set"
                    originalPrice="₹499"
                    price="₹399"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-2.webp"
                    alt="Clear Casting Resin"
                    category="Resins"
                    name="Clear Casting Resin"
                    originalPrice="₹299"
                    price="₹199"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-3.webp"
                    alt="Colored Pigment Set"
                    category="Pigments"
                    name="Colored Pigment Set"
                    originalPrice="₹799"
                    price="₹699"
                    link="shop-details.html" />
            </div>
        </div>
        
        <div class="p-tab" id="tab-2">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.product-card
                    image="assets/images/product-2.webp"
                    alt="Premium Epoxy Resin Kit"
                    category="Resins"
                    name="Premium Epoxy Resin Kit"
                    originalPrice="₹899"
                    price="₹799"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-6.webp"
                    alt="UV Resin Art Set"
                    category="Pigments"
                    name="UV Resin Art Set"
                    originalPrice="₹499"
                    price="₹399"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-7.webp"
                    alt="Clear Casting Resin"
                    category="Resins"
                    name="Clear Casting Resin"
                    originalPrice="₹299"
                    price="₹199"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-8.webp"
                    alt="Colored Pigment Set"
                    category="Pigments"
                    name="Colored Pigment Set"
                    originalPrice="₹799"
                    price="₹699"
                    link="shop-details.html" />
            </div>
        </div>
        
        <div class="p-tab" id="tab-3">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Premium Epoxy Resin Kit"
                    category="Resins"
                    name="Premium Epoxy Resin Kit"
                    originalPrice="₹899"
                    price="₹799"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="UV Resin Art Set"
                    category="Pigments"
                    name="UV Resin Art Set"
                    originalPrice="₹499"
                    price="₹399"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Clear Casting Resin"
                    category="Resins"
                    name="Clear Casting Resin"
                    originalPrice="₹299"
                    price="₹199"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Colored Pigment Set"
                    category="Pigments"
                    name="Colored Pigment Set"
                    originalPrice="₹799"
                    price="₹699"
                    link="shop-details.html" />
            </div>
        </div>
        
        <div class="p-tab" id="tab-4">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Premium Epoxy Resin Kit"
                    category="Resins"
                    name="Premium Epoxy Resin Kit"
                    originalPrice="₹899"
                    price="₹799"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="UV Resin Art Set"
                    category="Pigments"
                    name="UV Resin Art Set"
                    originalPrice="₹499"
                    price="₹399"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Clear Casting Resin"
                    category="Resins"
                    name="Clear Casting Resin"
                    originalPrice="₹299"
                    price="₹199"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Colored Pigment Set"
                    category="Pigments"
                    name="Colored Pigment Set"
                    originalPrice="₹799"
                    price="₹699"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Art Brush Collection"
                    category="Brushes"
                    name="Art Brush Collection"
                    originalPrice="₹1299"
                    price="₹1099"
                    link="shop-details.html" />
            </div>
        </div>
        
        <div class="p-tab" id="tab-5">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Premium Epoxy Resin Kit"
                    category="Resins"
                    name="Premium Epoxy Resin Kit"
                    originalPrice="₹899"
                    price="₹799"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="UV Resin Art Set"
                    category="Pigments"
                    name="UV Resin Art Set"
                    originalPrice="₹499"
                    price="₹399"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Clear Casting Resin"
                    category="Resins"
                    name="Clear Casting Resin"
                    originalPrice="₹299"
                    price="₹199"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Colored Pigment Set"
                    category="Pigments"
                    name="Colored Pigment Set"
                    originalPrice="₹799"
                    price="₹699"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Art Brush Collection"
                    category="Brushes"
                    name="Art Brush Collection"
                    originalPrice="₹1299"
                    price="₹1099"
                    link="shop-details.html" />
            </div>
        </div>
    </x-frontend.product-section>

    <x-frontend.featured-products>
        <div class="col-lg-4 col-md-6 col-sm-12 -block">
            <x-frontend.featured-product
                image="assets/images/arts-and-crafts-1867323_1920.jpg"
                alt="Featured Product 1"
                link="shop.html"
                buttonText="Shop now" />
        </div>
        
        <div class="col-lg-4 col-md-6 col-sm-12 -block">
            <x-frontend.featured-product
                image="assets/images/resource/feature-17.jpg"
                alt="Featured Product 2"
                link="shop.html"
                buttonText="Shop now" />
        </div>
        
        <div class="col-lg-4 col-md-6 col-sm-12 featured-block">
            <x-frontend.featured-product
                image="assets/images/resource/feature-18.jpg"
                alt="Featured Product 3"
                link="shop.html"
                buttonText="Shop now"
                imagePosition="p_absolute b_0 r_0" />
        </div>
    </x-frontend.featured-products>

    <x-frontend.product-section title="Top <span>Selling Products</span>" class="pb_90">
        <div class="p-tab active-tab" id="tab-1">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Premium Epoxy Resin Kit"
                    category="Resins"
                    name="Premium Epoxy Resin Kit"
                    originalPrice="₹899"
                    price="₹799"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-2.webp"
                    alt="UV Resin Art Set"
                    category="Pigments"
                    name="UV Resin Art Set"
                    originalPrice="₹499"
                    price="₹399"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-3.webp"
                    alt="Clear Casting Resin"
                    category="Resins"
                    name="Clear Casting Resin"
                    originalPrice="₹299"
                    price="₹199"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-2.webp"
                    alt="Colored Pigment Set"
                    category="Pigments"
                    name="Colored Pigment Set"
                    originalPrice="₹799"
                    price="₹699"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-2.webp"
                    alt="Art Brush Collection"
                    category="Brushes"
                    name="Art Brush Collection"
                    originalPrice="₹1299"
                    price="₹1099"
                    link="shop-details.html" />
            </div>
        </div>
        
        <div class="p-tab" id="tab-2">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.product-card
                    image="assets/images/product-6.webp"
                    alt="Premium Epoxy Resin Kit"
                    category="Resins"
                    name="Premium Epoxy Resin Kit"
                    originalPrice="₹899"
                    price="₹799"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="UV Resin Art Set"
                    category="Pigments"
                    name="UV Resin Art Set"
                    originalPrice="₹499"
                    price="₹399"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Clear Casting Resin"
                    category="Resins"
                    name="Clear Casting Resin"
                    originalPrice="₹299"
                    price="₹199"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Colored Pigment Set"
                    category="Pigments"
                    name="Colored Pigment Set"
                    originalPrice="₹799"
                    price="₹699"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Art Brush Collection"
                    category="Brushes"
                    name="Art Brush Collection"
                    originalPrice="₹1299"
                    price="₹1099"
                    link="shop-details.html" />
            </div>
        </div>
        
        <div class="p-tab" id="tab-3">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Premium Epoxy Resin Kit"
                    category="Resins"
                    name="Premium Epoxy Resin Kit"
                    originalPrice="₹899"
                    price="₹799"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="UV Resin Art Set"
                    category="Pigments"
                    name="UV Resin Art Set"
                    originalPrice="₹499"
                    price="₹399"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Clear Casting Resin"
                    category="Resins"
                    name="Clear Casting Resin"
                    originalPrice="₹299"
                    price="₹199"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Colored Pigment Set"
                    category="Pigments"
                    name="Colored Pigment Set"
                    originalPrice="₹799"
                    price="₹699"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Art Brush Collection"
                    category="Brushes"
                    name="Art Brush Collection"
                    originalPrice="₹1299"
                    price="₹1099"
                    link="shop-details.html" />
            </div>
        </div>
        
        <div class="p-tab" id="tab-4">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Premium Epoxy Resin Kit"
                    category="Resins"
                    name="Premium Epoxy Resin Kit"
                    originalPrice="₹899"
                    price="₹799"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="UV Resin Art Set"
                    category="Pigments"
                    name="UV Resin Art Set"
                    originalPrice="₹499"
                    price="₹399"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Clear Casting Resin"
                    category="Resins"
                    name="Clear Casting Resin"
                    originalPrice="₹299"
                    price="₹199"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Colored Pigment Set"
                    category="Pigments"
                    name="Colored Pigment Set"
                    originalPrice="₹799"
                    price="₹699"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Art Brush Collection"
                    category="Brushes"
                    name="Art Brush Collection"
                    originalPrice="₹1299"
                    price="₹1099"
                    link="shop-details.html" />
            </div>
        </div>
        
        <div class="p-tab" id="tab-5">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Premium Epoxy Resin Kit"
                    category="Resins"
                    name="Premium Epoxy Resin Kit"
                    originalPrice="₹899"
                    price="₹799"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="UV Resin Art Set"
                    category="Pigments"
                    name="UV Resin Art Set"
                    originalPrice="₹499"
                    price="₹399"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Clear Casting Resin"
                    category="Resins"
                    name="Clear Casting Resin"
                    originalPrice="₹299"
                    price="₹199"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Colored Pigment Set"
                    category="Pigments"
                    name="Colored Pigment Set"
                    originalPrice="₹799"
                    price="₹699"
                    link="shop-details.html" />
                
                <x-frontend.product-card
                    image="assets/images/product-1.webp"
                    alt="Art Brush Collection"
                    category="Brushes"
                    name="Art Brush Collection"
                    originalPrice="₹1299"
                    price="₹1099"
                    link="shop-details.html" />
            </div>
        </div>
    </x-frontend.product-section>

    <x-frontend.instagram-feed>
        <x-frontend.instagram-item 
            image="assets/images/resource/instagram-1.jpg"
            alt="Instagram Post 1" />
        
        <x-frontend.instagram-item 
            image="assets/images/resource/instagram-2.jpg"
            alt="Instagram Post 2" />
        
        <x-frontend.instagram-item 
            image="assets/images/resource/instagram-3.jpg"
            alt="Instagram Post 3" />
        
        <x-frontend.instagram-item 
            image="assets/images/resource/instagram-4.jpg"
            alt="Instagram Post 4" />
        
        <x-frontend.instagram-item 
            image="assets/images/resource/instagram-5.jpg"
            alt="Instagram Post 5" />
        
        <x-frontend.instagram-item 
            image="assets/images/resource/instagram-6.jpg"
            alt="Instagram Post 6" />
    </x-frontend.instagram-feed>

    <x-frontend.whatsapp-subscribe
        title="Order With WhatsApp"
        buttonText="Order Now!"
        backgroundImage="assets/images/whatsapp-bg.jpg"
        whatsappLink="https://wa.me/1234567890?text=Hello,%20I%20would%20like%20to%20place%20an%20order!" />
@endsection