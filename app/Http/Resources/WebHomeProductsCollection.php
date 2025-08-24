<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\ResourceCollection;
use App\Utility\CategoryUtility;

class WebHomeProductsCollection extends ResourceCollection
{
    public function toArray($request)
    {
        return $this->collection->map(function($data) {
            $priceData = getProductOfferPrice($data);
            $prodStock = $data->stocks->first();
            print_r($prodStock);
            die;
            return [
                'id' => $data->id,
                'name' => $data->name,
                'sku' => $data->sku,
                'thumbnail_image' => get_product_image($data->thumbnail_img,'300'),
                'has_discount' => home_base_price($data, false) != home_discounted_base_price($data, false),
                'current_stock' =>  (integer) ($prodStock ? $prodStock->qty : 0),
                'stroked_price' => $priceData['original_price'],
                'main_price' => $priceData['discounted_price'],
                'price_high_low' => (float)explode('-', home_discounted_base_price($data, false))[0] == (float)explode('-', home_discounted_price($data, false))[1] ? format_price((float)explode('-', home_discounted_price($data, false))[0]) : "From " . format_price((float)explode('-', home_discounted_price($data, false))[0]) . " to " . format_price((float)explode('-', home_discounted_price($data, false))[1]),
                'min_qty' => $data->min_qty,
                'slug' => $data->slug,
                'offer_tag' => $priceData['offer_tag']
            ];
        });
    }

    // public function with($request)
    // {
    //     return [
    //         'success' => true,
    //         'status' => 200
    //     ];
    // }
}
