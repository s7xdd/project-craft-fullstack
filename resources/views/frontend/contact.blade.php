@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title title="Contact" homeLink="index.html" />

    <x-frontend.contact.contact-info />

    <x-frontend.contact.contact-form />
@endsection
