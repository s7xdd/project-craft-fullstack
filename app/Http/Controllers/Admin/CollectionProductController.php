<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CollectionProduct;
use App\Models\Product;
use Illuminate\Http\Request;

class CollectionProductController extends Controller
{
    public function index()
    {
        $collections = CollectionProduct::with('products')->paginate(10);
        return view('backend.collection_product.index', compact('collections'));
    }

    public function create()
    {
        $products = Product::all();


        $pageOptions = [
            'home' => 'Home',
            'cart' => 'Cart',
        ];
        $pageReferenceOptions = [
            'top' => 'Top',
            'middle' => 'Middle',
        ];



        return view('backend.collection_product.create', compact('products', 'pageOptions', 'pageReferenceOptions'));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'collectiontitle' => 'required|string|max:255',
            'collectiondescription' => 'nullable|string',
            'collectionimage1' => 'nullable|string',
            'collectionimage2' => 'nullable|string',
            'products' => 'required|array',
            'products.*' => 'exists:products,id',
            'page' => 'required|string',
            'page_reference' => 'required|string',
        ]);

        $collection = CollectionProduct::create($data);
        $collection->products()->sync($data['products']);

        return redirect()->route('collection_product.index')->with('success', 'Collection created!');
    }

    public function edit(CollectionProduct $collection_product)
    {
        $products = Product::all();

        $pageOptions = [
            'home' => 'Home',
            'cart' => 'Cart',
        ];
        $pageReferenceOptions = [
            'top' => 'Top',
            'middle' => 'Middle',
        ];

        return view('backend.collection_product.edit', [
            'collection' => $collection_product,
            'products' => $products,
            'pageOptions' => $pageOptions,
            'pageReferenceOptions' => $pageReferenceOptions,
        ]);
    }

    public function update(Request $request, CollectionProduct $collection_product)
    {
        $data = $request->validate([
            'collectiontitle' => 'required|string|max:255',
            'collectiondescription' => 'nullable|string',
            'collectionimage1' => 'nullable|string',
            'collectionimage2' => 'nullable|string',
            'products' => 'required|array',
            'products.*' => 'exists:products,id',
            'page' => 'required|string',
            'page_reference' => 'required|string',
        ]);

        $collection_product->update($data);
        $collection_product->products()->sync($data['products']);

        return redirect()->route('collection_product.index')->with('success', 'Collection updated!');
    }

    public function destroy(CollectionProduct $collection_product)
    {
        $collection_product->delete();
        return back()->with('success', 'Collection deleted!');
    }
}
