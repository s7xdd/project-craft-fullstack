<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Testimonials;
use App\Models\Page;
use Illuminate\Http\Request;
use Artesaos\SEOTools\Facades\SEOTools;
use Artesaos\SEOTools\Facades\OpenGraph;
use Artesaos\SEOTools\Facades\TwitterCard;
use Artesaos\SEOTools\Facades\SEOMeta;
use Artesaos\SEOTools\Facades\JsonLd;
use Illuminate\Support\Facades\URL;

class TestimonialController extends Controller
{
    public function loadSEO($model)
    {
        SEOTools::setTitle($model['title']);
        OpenGraph::setTitle($model['title']);
        TwitterCard::setTitle($model['title']);

        SEOMeta::setTitle($model['meta_title'] ?? $model['title']);
        SEOMeta::setDescription($model['meta_description']);
        SEOMeta::addKeyword($model['keywords']);

        OpenGraph::setTitle($model['og_title']);
        OpenGraph::setDescription($model['og_description']);
        OpenGraph::setUrl(URL::full());
        OpenGraph::addProperty('locale', 'en_US');

        JsonLd::setTitle($model['meta_title']);
        JsonLd::setDescription($model['meta_description']);
        JsonLd::setType('Page');

        TwitterCard::setTitle($model['twitter_title']);
        TwitterCard::setSite("@aldourigroup");
        TwitterCard::setDescription($model['twitter_description']);

        SEOTools::jsonLd()->addImage(URL::to(asset('assets/img/favicon.svg')));
    }

    public function index()
    {
        $page = Page::where('type', 'testimonials')->first();
        $lang = getActiveLanguage();
        
        if ($page) {
            $seo = [
                'title' => $page->getTranslation('title', $lang),
                'meta_title' => $page->getTranslation('meta_title', $lang),
                'meta_description' => $page->getTranslation('meta_description', $lang),
                'keywords' => $page->getTranslation('keywords', $lang),
                'og_title' => $page->getTranslation('og_title', $lang),
                'og_description' => $page->getTranslation('og_description', $lang),
                'twitter_title' => $page->getTranslation('twitter_title', $lang),
                'twitter_description' => $page->getTranslation('twitter_description', $lang),
            ];
            $this->loadSEO($seo);
        }

        $testimonials = Testimonials::where('status', 1)
            ->orderBy('sort_order', 'asc')
            ->get();

        return view('frontend.testimonials', compact('page', 'testimonials', 'lang'));
    }

    public function show($id)
    {
        $testimonial = Testimonials::where('status', 1)->findOrFail($id);
        $lang = getActiveLanguage();
        
        $seo = [
            'title' => $testimonial->name . ' - Testimonial',
            'meta_title' => $testimonial->name . ' - Testimonial',
            'meta_description' => substr($testimonial->comment, 0, 160),
            'keywords' => 'testimonial, ' . $testimonial->name,
            'og_title' => $testimonial->name . ' - Testimonial',
            'og_description' => substr($testimonial->comment, 0, 160),
            'twitter_title' => $testimonial->name . ' - Testimonial',
            'twitter_description' => substr($testimonial->comment, 0, 160),
        ];
        
        $this->loadSEO($seo);

        return view('frontend.testimonial_detail', compact('testimonial', 'lang'));
    }
}