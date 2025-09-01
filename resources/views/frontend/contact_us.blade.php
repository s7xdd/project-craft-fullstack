@extends('frontend.layouts.app')

@section('content')
{{-- 
    @php
        $data => [
        [
            'title' => 'Main Warehouse',
            'details' => '0233 Brisbane Cir. Shiloh, Australia 81063'
        ],
        [
            'title' => 'Email Address',
            'details' => 'contact@example.com'
        ],
        [
            'title' => 'Phone Number',
            'details' => '+(208) 544 -0142'
        ]
    ]
    @endphp --}}


    <x-frontend.common.page-title title="Contact" homeLink="/" />

    <x-frontend.contact.contact-info />

    <x-frontend.contact.contact-form />
@endsection
