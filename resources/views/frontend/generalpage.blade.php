@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title :title="$page->getTranslation('title', $lang)" homeLink="/" />

    <section class="terms-section !min-h-[50vh]">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="terms-content">
                        {!! $page->getTranslation('content1', $lang) !!}
                    </div>
                </div>
            </div>
        </div>
    </section>

@endsection