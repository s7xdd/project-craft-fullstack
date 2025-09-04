@extends('frontend.layouts.app')

@section('content')

    @php
        $homePageContents = getHomePageContent();
        $highlightsContent = $page->getTranslation('heading3', $lang)
            ? json_decode($page->getTranslation('heading3', $lang))
            : [];

        $aboutUsImage = $page->getTranslation('image1', $lang)
            ? json_decode($page->getTranslation('image1', $lang))
            : [];

    @endphp

    <x-frontend.common.page-title title="About us" homeLink="/" />

    <x-frontend.about.about-section image="{{ $aboutUsImage[0]->url }}" alt="About Us">

        <x-slot name="content">
            {!! $page->getTranslation('content1', $lang) !!}
        </x-slot>

        <x-slot name="funFacts">
            <x-frontend.about.fun-facts>

                @foreach ($highlightsContent as $highlight)
                    <x-frontend.about.fun-fact-item count="{{ $highlight->title_1 }}" text="{{ $highlight->content_1 }}" />
                @endforeach

            </x-frontend.about.fun-facts>
        </x-slot>

    </x-frontend.about.about-section>



    @if (
        $homePageContents->getTranslation('image1', $lang) &&
            is_array(json_decode($homePageContents->getTranslation('image1', $lang))))
        <div class="py-10 pb_40">
            <x-frontend.home.highlights>
                @foreach (json_decode($homePageContents->getTranslation('image1', $lang), true) as $sectionData)
                    <x-frontend.home.highlight-item
                        icon="{{ isset($sectionData['icon'][0]) ? $sectionData['icon'][0]['url'] ?? '' : '' }}"
                        text="{{ $sectionData['title'] ?? '' }}" />
                @endforeach
            </x-frontend.home.highlights>
        </div>
    @endif

    <x-frontend.common.whatsapp-subscribe />
@endsection
