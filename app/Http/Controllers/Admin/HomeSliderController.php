<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\HomeSlider;
use Cache;
use Illuminate\Http\Request;

class HomeSliderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $sliders = HomeSlider::paginate(15);
        return view('backend.home_sliders.index', compact('sliders'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('backend.home_sliders.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

        $request->validate([
            'name' => 'required',
            'banner' => 'required',
            'btn_text' => 'nullable',
            'link' => 'nullable',
            'status' => 'required',
        ]);

        $slider = HomeSlider::create([
            'name' => $request->name,
            'image' => $request->banner,
            'btn_text' => $request->btn_text,
            'mobile_image' => $request->mobile_banner,
            'link' => $request->link,
            'sort_order' => $request->sort_order,
            'status' => $request->status,
        ]);

        Cache::forget('homeSlider');

        flash(trans('messages.slider') . ' ' . trans('messages.created_msg'))->success();
        return redirect()->route('home-slider.index');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Frontend\HomeSlider  $homeSlider
     * @return \Illuminate\Http\Response
     */
    public function show(HomeSlider $homeSlider)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Frontend\HomeSlider  $homeSlider
     * @return \Illuminate\Http\Response
     */
    public function edit(HomeSlider $homeSlider)
    {
        return view('backend.home_sliders.edit', compact('homeSlider'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\Request  $request
     * @param  \App\Models\Frontend\HomeSlider  $homeSlider
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, HomeSlider $homeSlider)
    {
        $request->validate(
            [
                'name' => 'required',
                'banner' => 'required',
                'status' => 'required',
            ]
        );

        $homeSlider->update([
            'name' => $request->name,
            'image' => $request->banner,
            'btn_text' => $request->btn_text,
            'link' => $request->link,
            'sort_order' => $request->sort_order,
            'status' => $request->status,
        ]);

        Cache::forget('homeSlider');

        flash(trans('messages.slider') . ' ' . trans('messages.updated_msg'))->success();
        return redirect()->route('home-slider.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Frontend\HomeSlider  $homeSlider
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        HomeSlider::destroy($id);
        Cache::forget('homeSlider');
        flash(trans('messages.slider') . ' ' . trans('messages.deleted_msg'))->success();
        return redirect()->route('home-slider.index');
    }

    public function updateStatus(Request $request)
    {
        $slider = HomeSlider::findOrFail($request->id);
        Cache::forget('homeSlider');
        $slider->status = $request->status;
        if ($slider->save()) {
            return 1;
        }
        return 0;
    }
}
