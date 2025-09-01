@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title title="Checkout" homeLink="/" />

    @include('components.frontend.checkout.checkout')

    <x-frontend.common.whatsapp-subscribe />
@endsection

@section('script')
    @stack('scripts')
@endsection
