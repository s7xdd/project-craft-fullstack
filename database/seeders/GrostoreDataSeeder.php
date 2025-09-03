<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Category;
use App\Models\CategoryTranslation;
use App\Models\Attribute;
use App\Models\AttributeTranslation;
use App\Models\AttributeValue;
use App\Models\AttributeValueTranslation;
use App\Models\Product;
use App\Models\ProductTranslation;
use App\Models\ProductSeo;
use App\Models\ProductStock;
use App\Models\ProductAttributes;

class GrostoreDataSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Create main categories
        $resins = Category::create([
            'name' => 'Resins',
            'slug' => 'resins-grostore',
            'parent_id' => null,
            'is_active' => 1,
        ]);

        $pigments = Category::create([
            'name' => 'Pigments',
            'slug' => 'pigments-grostore',
            'parent_id' => null,
            'is_active' => 1,
        ]);

        $accessories = Category::create([
            'name' => 'Accessories',
            'slug' => 'accessories-grostore',
            'parent_id' => null,
            'is_active' => 1,
        ]);

        $kits = Category::create([
            'name' => 'Kits',
            'slug' => 'kits-grostore',
            'parent_id' => null,
            'is_active' => 1,
        ]);

        // Create subcategories
        $artResin = Category::create([
            'name' => 'Art Resin',
            'slug' => 'art-resin-grostore',
            'parent_id' => $resins->id,
            'is_active' => 1,
        ]);

        $quickCoat = Category::create([
            'name' => 'Quick Coat Resin',
            'slug' => 'quick-coat-resin-grostore',
            'parent_id' => $resins->id,
            'is_active' => 1,
        ]);

        $miniPigments = Category::create([
            'name' => 'Mini Pigments',
            'slug' => 'mini-pigments-grostore',
            'parent_id' => $pigments->id,
            'is_active' => 1,
        ]);

        $siliconeMoulds = Category::create([
            'name' => 'Silicone Moulds',
            'slug' => 'silicone-moulds-grostore',
            'parent_id' => $accessories->id,
            'is_active' => 1,
        ]);

        $starterKit = Category::create([
            'name' => 'Starter Kit',
            'slug' => 'starter-kit-grostore',
            'parent_id' => $kits->id,
            'is_active' => 1,
        ]);

        // Category translations (assuming English)
        CategoryTranslation::create([
            'category_id' => $resins->id,
            'lang' => 'en',
            'name' => 'Resins',
            'slug' => 'resins-grostore',
        ]);

        CategoryTranslation::create([
            'category_id' => $pigments->id,
            'lang' => 'en',
            'name' => 'Pigments',
            'slug' => 'pigments-grostore',
        ]);

        CategoryTranslation::create([
            'category_id' => $accessories->id,
            'lang' => 'en',
            'name' => 'Accessories',
            'slug' => 'accessories-grostore',
        ]);

        CategoryTranslation::create([
            'category_id' => $kits->id,
            'lang' => 'en',
            'name' => 'Kits',
            'slug' => 'kits-grostore',
        ]);

        CategoryTranslation::create([
            'category_id' => $artResin->id,
            'lang' => 'en',
            'name' => 'Art Resin',
            'slug' => 'art-resin-grostore',
        ]);

        CategoryTranslation::create([
            'category_id' => $quickCoat->id,
            'lang' => 'en',
            'name' => 'Quick Coat Resin',
            'slug' => 'quick-coat-resin-grostore',
        ]);

        CategoryTranslation::create([
            'category_id' => $miniPigments->id,
            'lang' => 'en',
            'name' => 'Mini Pigments',
            'slug' => 'mini-pigments-grostore',
        ]);

        CategoryTranslation::create([
            'category_id' => $siliconeMoulds->id,
            'lang' => 'en',
            'name' => 'Silicone Moulds',
            'slug' => 'silicone-moulds-grostore',
        ]);

        CategoryTranslation::create([
            'category_id' => $starterKit->id,
            'lang' => 'en',
            'name' => 'Starter Kit',
            'slug' => 'starter-kit-grostore',
        ]);

        // Create attributes
        $sizeAttr = Attribute::create([
            'name' => 'Size',
            'is_active' => 1,
        ]);

        $typeAttr = Attribute::create([
            'name' => 'Type',
            'is_active' => 1,
        ]);

        // Attribute translations
        AttributeTranslation::create([
            'attribute_id' => $sizeAttr->id,
            'lang' => 'en',
            'name' => 'Size',
        ]);

        AttributeTranslation::create([
            'attribute_id' => $typeAttr->id,
            'lang' => 'en',
            'name' => 'Type',
        ]);

        // Attribute values
        $size300g = AttributeValue::create([
            'attribute_id' => $sizeAttr->id,
            'is_active' => 1,
        ]);

        $size1200g = AttributeValue::create([
            'attribute_id' => $sizeAttr->id,
            'is_active' => 1,
        ]);

        $typeArt = AttributeValue::create([
            'attribute_id' => $typeAttr->id,
            'is_active' => 1,
        ]);

        $typeQuick = AttributeValue::create([
            'attribute_id' => $typeAttr->id,
            'is_active' => 1,
        ]);

        // Attribute value translations
        AttributeValueTranslation::create([
            'attribute_value_id' => $size300g->id,
            'lang' => 'en',
            'value' => '300g',
        ]);

        AttributeValueTranslation::create([
            'attribute_value_id' => $size1200g->id,
            'lang' => 'en',
            'value' => '1200g',
        ]);

        AttributeValueTranslation::create([
            'attribute_value_id' => $typeArt->id,
            'lang' => 'en',
            'value' => 'Art Resin',
        ]);

        AttributeValueTranslation::create([
            'attribute_value_id' => $typeQuick->id,
            'lang' => 'en',
            'value' => 'Quick Coat',
        ]);

        // Create products
        $artResinProduct = Product::create([
            'name' => 'Grostore Art Epoxy Resin Kit',
            'sku' => 'GS-ART-RESIN-001',
            'category_id' => $artResin->id,
            'unit_price' => 600,
            'photos' => json_encode(['resin-kit-300g.jpg']),
            'thumbnail_img' => 'resin-thumb.jpg',
            'type' => 'physical',
            'approved' => 1,
        ]);

        $quickCoatProduct = Product::create([
            'name' => 'Grostore Quick Coat Resin',
            'sku' => 'GS-QUICK-COAT-001',
            'category_id' => $quickCoat->id,
            'unit_price' => 600,
            'photos' => json_encode(['quick-coat-300g.jpg']),
            'thumbnail_img' => 'quick-coat-thumb.jpg',
            'type' => 'physical',
            'approved' => 1,
        ]);

        $miniPigmentProduct = Product::create([
            'name' => 'Grostore Mini Pigment Kit - Beach Please',
            'sku' => 'GS-MINI-PIG-001',
            'category_id' => $miniPigments->id,
            'unit_price' => 500,
            'photos' => json_encode(['beach-please-kit.jpg']),
            'thumbnail_img' => 'beach-thumb.jpg',
            'type' => 'physical',
            'approved' => 1,
        ]);

        $mouldProduct = Product::create([
            'name' => 'Grostore Silicone Mould - Mandala',
            'sku' => 'GS-MOULD-001',
            'category_id' => $siliconeMoulds->id,
            'unit_price' => 520,
            'photos' => json_encode(['mandala-mould.jpg']),
            'thumbnail_img' => 'mandala-thumb.jpg',
            'type' => 'physical',
            'approved' => 1,
        ]);

        $kitProduct = Product::create([
            'name' => 'Grostore Starter Kit',
            'sku' => 'GS-KIT-001',
            'category_id' => $starterKit->id,
            'unit_price' => 600,
            'photos' => json_encode(['starter-kit.jpg']),
            'thumbnail_img' => 'starter-thumb.jpg',
            'type' => 'physical',
            'approved' => 1,
        ]);

        // Product translations
        ProductTranslation::create([
            'product_id' => $artResinProduct->id,
            'lang' => 'en',
            'name' => 'Grostore Art Epoxy Resin Kit',
        ]);

        ProductTranslation::create([
            'product_id' => $quickCoatProduct->id,
            'lang' => 'en',
            'name' => 'Grostore Quick Coat Resin',
        ]);

        ProductTranslation::create([
            'product_id' => $miniPigmentProduct->id,
            'lang' => 'en',
            'name' => 'Grostore Mini Pigment Kit - Beach Please',
        ]);

        ProductTranslation::create([
            'product_id' => $mouldProduct->id,
            'lang' => 'en',
            'name' => 'Grostore Silicone Mould - Mandala',
        ]);

        ProductTranslation::create([
            'product_id' => $kitProduct->id,
            'lang' => 'en',
            'name' => 'Grostore Starter Kit',
        ]);

        // Product SEO
        ProductSeo::create([
            'product_id' => $artResinProduct->id,
            'lang' => 'en',
            'meta_title' => 'Grostore Art Epoxy Resin Kit - High Quality Resin',
            'meta_description' => 'Buy Grostore Art Epoxy Resin Kit for crystal clear art projects.',
        ]);

        ProductSeo::create([
            'product_id' => $quickCoatProduct->id,
            'lang' => 'en',
            'meta_title' => 'Grostore Quick Coat Resin - Fast Curing',
            'meta_description' => 'Get Grostore Quick Coat Resin for top coating your art.',
        ]);

        // Product stocks (variants)
        $stock1 = ProductStock::create([
            'product_id' => $artResinProduct->id,
            'qty' => 100,
            'price' => 600,
        ]);

        $stock2 = ProductStock::create([
            'product_id' => $artResinProduct->id,
            'qty' => 100,
            'price' => 1480,
        ]);

        $stock3 = ProductStock::create([
            'product_id' => $quickCoatProduct->id,
            'qty' => 100,
            'price' => 600,
        ]);

        $stock4 = ProductStock::create([
            'product_id' => $miniPigmentProduct->id,
            'qty' => 50,
            'price' => 500,
        ]);

        $stock5 = ProductStock::create([
            'product_id' => $mouldProduct->id,
            'qty' => 20,
            'price' => 520,
        ]);

        $stock6 = ProductStock::create([
            'product_id' => $kitProduct->id,
            'qty' => 30,
            'price' => 600,
        ]);

        // Product attributes
        ProductAttributes::create([
            'product_id' => $artResinProduct->id,
            'product_varient_id' => $stock1->id,
            'attribute_id' => $sizeAttr->id,
            'attribute_value_id' => $size300g->id,
        ]);

        ProductAttributes::create([
            'product_id' => $artResinProduct->id,
            'product_varient_id' => $stock2->id,
            'attribute_id' => $sizeAttr->id,
            'attribute_value_id' => $size1200g->id,
        ]);

        ProductAttributes::create([
            'product_id' => $quickCoatProduct->id,
            'product_varient_id' => $stock3->id,
            'attribute_id' => $sizeAttr->id,
            'attribute_value_id' => $size300g->id,
        ]);

        ProductAttributes::create([
            'product_id' => $quickCoatProduct->id,
            'product_varient_id' => $stock3->id,
            'attribute_id' => $typeAttr->id,
            'attribute_value_id' => $typeQuick->id,
        ]);
    }
}