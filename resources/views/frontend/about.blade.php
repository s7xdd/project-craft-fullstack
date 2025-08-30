@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title 
        title="About us" 
        homeLink="index.html" />

    <x-frontend.about.about-section
        image="assets/images/about_image.jpg"
        alt="About Us"
        title="We are a retail business in the Ecommerce Products and accessories for kids">
        
        <x-slot name="content">
            <p class="mb_20"><span>Balloon</span>, with a rich legacy spanning 12 years, stands as a
                venerable online destination for auto the motive enthusiasts seeking a diverse range
                of high-quality vehicle components.</p>
            <p>All components featured in their inventory undergo rigorous quality checks to meet or
                exceed industry stand ards, instilling confidence in customers regarding the
                reliability of their purchases.</p>
        </x-slot>
        
        <x-slot name="funFacts">
            <x-frontend.about.fun-facts>
                <x-frontend.about.fun-fact-item 
                    count="25" 
                    text="Retails Store in the city" />
                <x-frontend.about.fun-fact-item 
                    count="300" 
                    text="Active Delivery Person" />
                <x-frontend.about.fun-fact-item 
                    count="120" 
                    text="Brands and Companies" />
            </x-frontend.about.fun-facts>
        </x-slot>
    </x-frontend.about.about-section>

    <x-frontend.home.highlights>
        <x-frontend.home.highlight-item 
            icon="assets/images/icons/fast-delivery.png"
            text="Same day Product Delivery" />
        
        <x-frontend.home.highlight-item 
            icon="assets/images/icons/rating.png"
            text="100% Customer Satisfaction" />
        
        <x-frontend.home.highlight-item 
            icon="assets/images/icons/peace.png"
            text="Help and access is our mission" />
        
        <x-frontend.home.highlight-item 
            icon="assets/images/icons/high-quality.png"
            text="100% quality Art Supplies" />
        
        <x-frontend.home.highlight-item 
            icon="assets/images/icons/customer-service.png"
            text="24/7 Support for Clients" />
    </x-frontend.home.highlights>

    <x-frontend.common.whatsapp-subscribe
        title="Order With WhatsApp"
        buttonText="Order Now!"
        backgroundImage="assets/images/whatsapp-bg.jpg"
        whatsappLink="https://wa.me/1234567890?text=Hello,%20I%20would%20like%20to%20place%20an%20order!" />
        
@endsection