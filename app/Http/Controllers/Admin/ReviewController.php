<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Review;
use App\Models\Product;
use Auth;
use DB;

class ReviewController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $reviews = Review::orderBy('created_at', 'desc')->with(['product' => function ($query) {
            $query->without(['product_translations', 'taxes']);
        }])->paginate(15);
        return view('backend.products.reviews', compact('reviews'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $review = new Review;
        $review->product_id = $request->product_id;
        $review->user_id = Auth::user()->id;
        $review->rating = $request->rating;
        $review->comment = $request->comment;
        $review->viewed = '0';
        $review->save();
        $product = Product::findOrFail($request->product_id);
        if (Review::where('product_id', $product->id)->where('status', 1)->count() > 0) {
            $product->rating = Review::where('product_id', $product->id)->where('status', 1)->sum('rating') / Review::where('product_id', $product->id)->where('status', 1)->count();
        } else {
            $product->rating = 0;
        }
        $product->save();

        flash(translate('Review has been submitted successfully'))->success();
        return back();
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
    public function edit($id)
    {
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function updatePublished(Request $request)
    {
        $review = Review::findOrFail($request->id);
        $review->status = $request->status;
        $review->save();

        $product = Product::findOrFail($review->product->id);
        if (Review::where('product_id', $product->id)->where('status', 1)->count() > 0) {
            $product->rating = Review::where('product_id', $product->id)->where('status', 1)->sum('rating') / Review::where('product_id', $product->id)->where('status', 1)->count();
        } else {
            $product->rating = 0;
        }
        $product->save();

        return 1;
    }
}
