@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title 
        title="{{ $testimonial->name }}" 
        homeLink="{{ route('home') }}" />

     <section class="py-16 bg-gray-50">
         <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
             <div class="bg-white rounded-lg shadow-lg p-8 md:p-12">
                 <div class="mb-8">
                     <p class="text-gray-700 italic text-xl md:text-2xl leading-relaxed text-center">"{{ $testimonial->comment }}"</p>
                 </div>
                 <div class="text-center mb-8">
                     <h3 class="font-semibold text-gray-900 text-2xl mb-2">{{ $testimonial->name }}</h3>
                     @if($testimonial->title)
                         <p class="text-gray-600 text-lg">{{ $testimonial->title }}</p>
                     @endif
                 </div>
                 <div class="text-center">
                     <a href="{{ route('testimonials.index') }}" class="inline-flex items-center px-6 py-3 bg-gray-600 text-white font-medium rounded-lg hover:bg-gray-700 transition-colors duration-200">
                         ← Back to All Testimonials
                     </a>
                 </div>
             </div>
         </div>
     </section>
@endsection