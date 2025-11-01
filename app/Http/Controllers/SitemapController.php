<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Page;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Response;

class SitemapController extends Controller
{
    const URL_LIMIT = 50000; // SEO best practice: max 50,000 URLs per sitemap

    public function index()
    {
        $sitemaps = [
            ['loc' => route('sitemap.static'), 'lastmod' => now()->toAtomString()],
            ['loc' => route('sitemap.categories'), 'lastmod' => now()->toAtomString()],
            ['loc' => route('sitemap.products'), 'lastmod' => now()->toAtomString()],
            ['loc' => route('sitemap.dynamic'), 'lastmod' => now()->toAtomString()],
        ];

        return Response::view('sitemaps.index', compact('sitemaps'))
            ->header('Content-Type', 'application/xml');
    }

    public function staticPages()
    {
        $urls = Cache::remember('sitemap.static', 3600, function () {
            $pages = Page::with('page_translations')
                ->get();

            $urls = [
                [
                    'loc' => route('home'),
                    'lastmod' => now()->toAtomString(),
                    'changefreq' => 'daily',
                    'priority' => '1.0'
                ],
                [
                    'loc' => route('about_us'),
                    'lastmod' => now()->toAtomString(),
                    'changefreq' => 'monthly',
                    'priority' => '0.8'
                ],
                [
                    'loc' => route('contact'),
                    'lastmod' => now()->toAtomString(),
                    'changefreq' => 'monthly',
                    'priority' => '0.8'
                ],
                [
                    'loc' => route('products.index'),
                    'lastmod' => now()->toAtomString(),
                    'changefreq' => 'daily',
                    'priority' => '0.9'
                ],
                [
                    'loc' => route('testimonials.index'),
                    'lastmod' => now()->toAtomString(),
                    'changefreq' => 'weekly',
                    'priority' => '0.6'
                ]
            ];

            // Add dynamic pages
            foreach ($pages as $page) {
                $urls[] = [
                    'loc' => route('dynamic-page', $page->slug),
                    'lastmod' => $page->updated_at->toAtomString(),
                    'changefreq' => 'monthly',
                    'priority' => '0.7'
                ];
            }

            return $urls;
        });

        return Response::view('sitemaps.urlset', compact('urls'))
            ->header('Content-Type', 'application/xml');
    }

    public function categories()
    {
        $urls = Cache::remember('sitemap.categories', 3600, function () {
            $urls = [];
            Category::where('is_active', 1)
                ->select('slug', 'updated_at')
                ->chunk(1000, function ($categories) use (&$urls) {
                    foreach ($categories as $category) {
                        $urls[] = [
                            'loc' => route('products.category', $category->slug),
                            'lastmod' => $category->updated_at->toAtomString(),
                            'changefreq' => 'weekly',
                            'priority' => '0.8'
                        ];
                    }
                });
            return $urls;
        });

        // Handle large category sets with multiple sitemaps
        if (count($urls) > self::URL_LIMIT) {
            return $this->splitSitemap($urls, 'categories');
        }

        return Response::view('sitemaps.urlset', compact('urls'))
            ->header('Content-Type', 'application/xml');
    }

    public function products()
    {
        $urls = Cache::remember('sitemap.products', 3600, function () {
            $urls = [];
            Product::where('approved', 1)
                ->select('slug', 'sku', 'updated_at')
                ->chunk(1000, function ($products) use (&$urls) {
                    foreach ($products as $product) {
                        $urls[] = [
                            'loc' => route('product-detail', ['slug' => $product->slug, 'sku' => $product->sku]),
                            'lastmod' => $product->updated_at->toAtomString(),
                            'changefreq' => 'weekly',
                            'priority' => '0.6'
                        ];
                    }
                });
            return $urls;
        });

        // Handle large product sets
        if (count($urls) > self::URL_LIMIT) {
            return $this->splitSitemap($urls, 'products');
        }

        return Response::view('sitemaps.urlset', compact('urls'))
            ->header('Content-Type', 'application/xml');
    }

    public function dynamicRoutes()
    {
        $urls = Cache::remember('sitemap.dynamic', 3600, function () {
            $dynamicUrls = [];

            // Category-filtered product pages
            $categories = Category::where('is_active', 1)->pluck('slug');
            foreach ($categories as $categorySlug) {
                $dynamicUrls[] = [
                    'loc' => route('products.index', ['category' => $categorySlug]),
                    'lastmod' => now()->toAtomString(),
                    'changefreq' => 'daily',
                    'priority' => '0.7'
                ];
            }

            return $dynamicUrls;
        });

        return Response::view('sitemaps.urlset', compact('urls'))
            ->header('Content-Type', 'application/xml');
    }

    public function productsChunk($chunk)
    {
        $chunkIndex = (int) $chunk - 1; // Convert to 0-based index
        $offset = $chunkIndex * self::URL_LIMIT;

        $urls = Product::where('approved', 1)
            ->select('slug', 'sku', 'updated_at')
            ->orderBy('id')
            ->skip($offset)
            ->take(self::URL_LIMIT)
            ->get()
            ->map(function ($product) {
                return [
                    'loc' => route('product-detail', ['slug' => $product->slug, 'sku' => $product->sku]),
                    'lastmod' => $product->updated_at->toAtomString(),
                    'changefreq' => 'weekly',
                    'priority' => '0.6'
                ];
            })
            ->toArray();

        return Response::view('sitemaps.urlset', compact('urls'))
            ->header('Content-Type', 'application/xml');
    }

    public function categoriesChunk($chunk)
    {
        $chunkIndex = (int) $chunk - 1; // Convert to 0-based index
        $offset = $chunkIndex * self::URL_LIMIT;

        $urls = Category::where('is_active', 1)
            ->select('slug', 'updated_at')
            ->orderBy('id')
            ->skip($offset)
            ->take(self::URL_LIMIT)
            ->get()
            ->map(function ($category) {
                return [
                    'loc' => route('products.category', $category->slug),
                    'lastmod' => $category->updated_at->toAtomString(),
                    'changefreq' => 'weekly',
                    'priority' => '0.8'
                ];
            })
            ->toArray();

        return Response::view('sitemaps.urlset', compact('urls'))
            ->header('Content-Type', 'application/xml');
    }

    private function splitSitemap(array $urls, string $type)
    {
        $chunks = array_chunk($urls, self::URL_LIMIT);
        $sitemapUrls = [];

        foreach ($chunks as $index => $chunk) {
            $sitemapUrls[] = [
                'loc' => route("sitemap.{$type}.chunk", $index + 1),
                'lastmod' => now()->toAtomString()
            ];
        }

        return Response::view('sitemaps.sitemapindex', ['sitemaps' => $sitemapUrls])
            ->header('Content-Type', 'application/xml');
    }
}