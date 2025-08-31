@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title 
        title="{{ $testimonial->name }}" 
        homeLink="{{ route('home') }}" />

    <section class="testimonial-detail-section">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-8 col-md-10 col-sm-12">
                    <div class="testimonial-detail-card">
                        <div class="testimonial-content">
                            <p>"{{ $testimonial->comment }}"</p>
                        </div>
                        <div class="testimonial-author">
                            <h3>{{ $testimonial->name }}</h3>
                            @if($testimonial->title)
                                <p class="author-title">{{ $testimonial->title }}</p>
                            @endif
                        </div>
                        <div class="back-to-testimonials">
                            <a href="{{ route('testimonials.index') }}" class="btn btn-secondary">
                                ← Back to All Testimonials
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection