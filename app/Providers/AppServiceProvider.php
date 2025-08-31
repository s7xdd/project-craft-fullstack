<?php

namespace App\Providers;

use Efectn\Menu\Models\Menus;
use Illuminate\Support\Facades\App;
use Illuminate\Support\Facades\Blade;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\View;
use Illuminate\Support\ServiceProvider;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if (Session::has('locale')) {
            App::setLocale(Session::get('locale'));
        }

        View::composer('frontend.parts.header', function ($view) {
            $menu = Menus::where('name', 'header')->with('items.child.child.child')->first();
            $menu_items = $menu ? $menu->items : collect();

            $view->with(['menu_items' => $menu_items]);
        });

        View::composer('frontend.parts.footer', function ($view) {
            $menu = Menus::where('name', 'footer')->with('items.child')->first();
            $bottom_footer = Menus::where('name', 'bottom footer')->with('items')->first();
            
            $view->with([
                'menu_items' => $menu ? $menu->items : collect(),
                'bottom_footer' => $bottom_footer ? $bottom_footer->items : collect(),
            ]);
        });
    }
}
