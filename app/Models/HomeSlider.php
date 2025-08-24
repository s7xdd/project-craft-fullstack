<?php

namespace App\Models;

use App\Models\Category;
use App\Models\Product;
use App\Models\Offers;
use App\Models\Brand;
use App\Models\Upload;
use Cache;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HomeSlider extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'image',
        'mobile_image',
        'link_type',
        'link_ref',
        'link_ref_id',
        'link',
        'sort_order',
        'status',
    ];

    public function mainImage()
    {
        return $this->hasOne(Upload::class, 'id', 'image');
    }
    public function mobileImage()
    {
        return $this->hasOne(Upload::class, 'id', 'mobile_image');
    }

    public function getALink()
    {
        if ($this->link_ref == 'product' && $this->link_ref_id !== null) {
            $product = Product::where('id', $this->link_ref_id)->select('slug')->first()->slug;
            return route('product', [
                'slug' => $product
            ]);
        } elseif ($this->link_ref == 'category' && $this->link_ref_id !== null) {
            $product = Category::where('id', $this->link_ref_id)->select('slug')->first()->slug;
            return route('products.category', [
                'category_slug' => $product
            ]);
        } elseif ($this->link_ref == 'external' && $this->link !== null) {
            return $this->link;
        } else {
            return '#';
        }
    }
    public function getBannerLink()
    {
        if ($this->link_ref == 'product' && $this->link_ref_id !== null) {
            $product = Product::where('id', $this->link_ref_id)->select('slug')->first();
            if($product){
                return $product->slug;
            }else{
                return '#';
            }
        } elseif ($this->link_ref == 'category' && $this->link_ref_id !== null) {
            $product = Category::where('id', $this->link_ref_id)->select('slug')->first();
            if($product){
                return $product->slug;
            }else{
                return '#';
            }
        } elseif ($this->link_ref == 'offer' && $this->link_ref_id !== null) {
            $product = Offers::where('id', $this->link_ref_id)->select('slug')->first();
            if($product){
                return $product->slug;
            }else{
                return '#';
            }
        }  elseif ($this->link_ref == 'brand' && $this->link_ref_id !== null) {
            $product = Brand::where('id', $this->link_ref_id)->select('slug')->first();
            if($product){
                return $product->slug;
            }else{
                return '#';
            }
        } elseif ($this->link_ref == 'external' && $this->link !== null) {
            return $this->link;
        } else {
            return '#';
        }
    }
    
    public static function boot()
    {
        static::creating(function ($model) {
            Cache::forget('homeSlider');
        });

        static::updating(function ($model) {
            Cache::forget('homeSlider');
        });

        static::deleting(function ($model) {
            Cache::forget('homeSlider');
        });

        parent::boot();
    }
}
