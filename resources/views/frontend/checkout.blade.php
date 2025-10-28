@extends('frontend.layouts.app')

@section('content')
    @php
        $breadcrumbs = [
            ['label' => 'Home', 'url' => '/'],
            ['label' => 'Cart', 'url' => '/cart/items'],
            ['label' => 'Checkout', 'url' => null]
        ];
    @endphp
    <x-frontend.common.page-title title="Checkout" :breadcrumbs="$breadcrumbs" />

    @include('components.frontend.checkout.checkout')

@endsection

@section('script')
    @stack('scripts')
@endsection

