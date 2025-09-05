@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title 
        title="{{ $page ? $page->getTranslation('title', $lang) : 'Testimonials' }}" 
        homeLink="{{ route('home') }}" />

    <section class="testimonial-section">
        <div class="container">
            <div class="row">
                @if($testimonials->count() > 0)
                    @foreach($testimonials as $testimonial)
                        <div class="col-lg-4 col-md-6 col-sm-12 testimonial-block ">
                            <div class="testimonial-card !rounded-lg">
                                <div class="testimonial-content">
                                    <p>"{{ $testimonial->comment }}"</p>
                                </div>
                                <div class="testimonial-author">
                                    <h4>{{ $testimonial->name }}</h4>
                                    @if($testimonial->title)
                                        <p>{{ $testimonial->title }}</p>
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endforeach
                @else
                    <div class="col-12">
                        <p class="text-center">No testimonials available at the moment.</p>
                    </div>
                @endif
            </div>
        </div>
    </section>
@endsection