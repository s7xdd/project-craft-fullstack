<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Brand;
use App\Models\BrandTranslation;
use App\Models\Product;
use Illuminate\Support\Str;
use DB;

class BrandController extends Controller
{
    function __construct()
    {
        $this->middleware('auth');
       
        $this->middleware('permission:manage_brands', ['only' => ['index','create','store','edit','update','destroy']]);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $sort_search = null;
        $brands = Brand::orderBy('name', 'asc');
        if ($request->has('search')) {
            $sort_search = $request->search;
            $brands = $brands->where('name', 'like', '%' . $sort_search . '%');
        }
        $brands = $brands->paginate(15);
        return view('backend.brands.index', compact('brands', 'sort_search'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.brands.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        $request->validate([
            'name' => 'required',
            'slug' => 'required',
        ]);
       
        $brand               = new Brand;
        $brand->name         = $request->name ?? NULL;
        $brand->is_active    = $request->status;
        $brand->save();

        $slug               = $request->slug ? Str::slug($request->slug, '-') : Str::slug($request->name, '-');
        $slug               = Str::lower($slug);
        $same_slug_count    = BrandTranslation::where('slug', 'LIKE', $slug . '%')->count();
        $slug_suffix        = $same_slug_count ? '-' . $same_slug_count + 1 : '';
        $slug              .= $slug_suffix;

        $brand_translation                       = BrandTranslation::firstOrNew(['lang' => env('DEFAULT_LANGUAGE'), 'brand_id' => $brand->id]);
        $brand_translation->name                 = $request->name;
        $brand_translation->slug                 = $slug;
        $brand_translation->logo                 = $request->logo;
        $brand_translation->meta_title           = $request->meta_title;
        $brand_translation->meta_description     = $request->meta_description;
        $brand_translation->meta_keywords        = $request->meta_keywords;
        $brand_translation->og_title             = $request->og_title;
        $brand_translation->og_description       = $request->og_description;
        $brand_translation->twitter_title        = $request->twitter_title;
        $brand_translation->twitter_description  = $request->twitter_description;
        $brand_translation->save();

        flash(trans('messages.brand').trans('messages.created_msg'))->success();
        return redirect()->route('brands.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request, $id)
    {
        $lang   = $request->lang;
        $brand  = Brand::findOrFail($id);
        return view('backend.brands.edit', compact('brand', 'lang'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'slug' => 'required',
        ]);

        $brand = Brand::findOrFail($id);

        if ($request->lang == env("DEFAULT_LANGUAGE")) {
            $brand->name         = $request->name;
            $brand->is_active    = $request->status;
            $brand->save();
        }

        $slug = '';
        if ($request->slug != null) {
            $slug = strtolower(Str::slug($request->slug, '-'));
            $same_slug_count = BrandTranslation::where('slug', 'LIKE', $slug . '%')->where('brand_id', '!=', $brand->id)->count();
            $slug_suffix = $same_slug_count > 0 ? '-' . $same_slug_count + 1 : '';
            $slug .= $slug_suffix;
        }

        $brand_translation                       = BrandTranslation::firstOrNew(['lang' => $request->lang, 'brand_id' => $brand->id]);
        $brand_translation->name                 = $request->name;
        $brand_translation->slug                 = $slug;
        $brand_translation->logo                 = $request->logo;
        $brand_translation->meta_title           = $request->meta_title;
        $brand_translation->meta_description     = $request->meta_description;
        $brand_translation->meta_keywords        = $request->meta_keywords;
        $brand_translation->og_title             = $request->og_title;
        $brand_translation->og_description       = $request->og_description;
        $brand_translation->twitter_title        = $request->twitter_title;
        $brand_translation->twitter_description  = $request->twitter_description;
        $brand_translation->save();

        flash(trans('messages.brand').trans('messages.updated_msg'))->success();
        return back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $brand = Brand::findOrFail($id);
        Product::where('brand_id', $brand->id)->delete();
        foreach ($brand->brand_translations as $key => $brand_translation) {
            $brand_translation->delete();
        }
        Brand::destroy($id);

        flash(trans('messages.brand').trans('messages.deleted_msg'))->success();
        return redirect()->route('brands.index');
    }

    public function updateStatus(Request $request)
    {
        $brand = Brand::findOrFail($request->id);
        
        $brand->is_active = $request->status;
        $brand->save();
       
        return 1;
    }
}
