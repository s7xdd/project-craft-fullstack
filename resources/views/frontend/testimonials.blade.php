@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title 
        title="{{ $page ? $page->getTranslation('title', $lang) : 'Testimonials' }}" 
        homeLink="{{ route('home') }}" />

     <section class="py-16 bg-gray-50">
         <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
             @if($testimonials->count() > 0)
                 <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                     @foreach($testimonials as $testimonial)
                         <div class="bg-white rounded-lg shadow-md hover:shadow-lg transition-all duration-300 p-6 group">
                             <div class="mb-4">
                                 <p class="text-gray-700 italic text-lg leading-relaxed">"{{ $testimonial->comment }}"</p>
                             </div>
                             <div class="flex items-center">
                                 <div class="flex-1">
                                     <h4 class="font-semibold text-gray-900 text-lg">{{ $testimonial->name }}</h4>
                                     @if($testimonial->title)
                                         <p class="text-gray-600 text-sm mt-1">{{ $testimonial->title }}</p>
                                     @endif
                                 </div>
                             </div>
                         </div>
                     @endforeach
                 </div>
             @else
                 <div class="text-center py-12">
                     <p class="text-gray-600 text-lg">No testimonials available at the moment.</p>
                 </div>
             @endif
         </div>
     </section>
@endsection