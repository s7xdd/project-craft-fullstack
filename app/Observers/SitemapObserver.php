<?php

namespace App\Observers;

use Illuminate\Support\Facades\Cache;

class SitemapObserver
{
    public function saved()
    {
        Cache::forget('sitemap.products');
        Cache::forget('sitemap.categories');
        Cache::forget('sitemap.static');
        Cache::forget('sitemap.dynamic');
    }

    public function deleted()
    {
        $this->saved();
    }
}