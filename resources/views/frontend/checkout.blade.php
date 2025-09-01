@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title title="Checkout" homeLink="/" />

    <x-frontend.checkout.checkout />

    <x-frontend.common.whatsapp-subscribe title="Order With WhatsApp" buttonText="Order Now!"
        backgroundImage="assets/images/whatsapp-bg.jpg"
        whatsappLink="https://wa.me/1234567890?text=Hello,%20I%20would%20like%20to%20place%20an%20order!" />
@endsection
