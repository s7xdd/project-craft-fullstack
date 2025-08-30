@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title 
        title="Account" 
        homeLink="index.html" />

    <x-frontend.account.account-section>
        <x-slot name="orderIdFilter">
            <x-frontend.account.order-id-filter 
                placeholder="Enter your Email ID" 
                onclick="filterOrders()" 
                buttonText="Search" />
        </x-slot>
        
        <x-frontend.account.history-item
            orderId="X469626"
            image="assets/images/resource/history-1.png"
            alt="Colored Pigment Set"
            link="shop-details.html"
            productName="Colored Pigment Set"
            price="₹12.99"
            status="Delivered" />
        
        <x-frontend.account.history-item
            orderId="X469625"
            image="assets/images/resource/history-2.png"
            alt="Colored Pigment Set"
            link="shop-details.html"
            productName="Colored Pigment Set"
            price="₹11.99"
            status="Delivered" />
        
        <x-frontend.account.history-item
            orderId="X469629"
            image="assets/images/resource/history-3.png"
            alt="Colored Pigment Set"
            link="shop-details.html"
            productName="Colored Pigment Set"
            price="₹15.99"
            status="Delivered" />
    </x-frontend.account.account-section>

    <x-frontend.common.whatsapp-subscribe
        title="Order With WhatsApp"
        buttonText="Order Now!"
        backgroundImage="assets/images/whatsapp-bg.jpg"
        whatsappLink="https://wa.me/1234567890?text=Hello,%20I%20would%20like%20to%20place%20an%20order!" />
@endsection