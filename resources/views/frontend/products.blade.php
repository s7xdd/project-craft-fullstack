@extends('frontend.layouts.app')

@section('content')
    <div class="text-center font-bold text-5xl py-1">
        {{ capitalizeFirstLetter(request('category', 'Shop')) }}
    </div>

    <form id="productfilters" method="GET" class="mt-8">
        <input type="hidden" name="sort_by" id="sort_by" value="{{ $sort_by }}">
        <input type="hidden" name="category" value="{{ $category }}">

        <x-frontend.products.shop-page>
            <x-slot name="sidebar">
                @include('components.frontend.products.shop-sidebar')
            </x-slot>

            <x-slot name="sorting">
                <div class="flex justify-between items-center mb-3">
                    <div class="text-xs md:text-sm text-gray-600">
                        Showing <span class="font-semibold">{{ $products->firstItem() ?? '0' }}–{{ $products->lastItem() ?? '0' }}</span> of <span class="font-semibold">{{ $products->total() ?? '0' }}</span> results
                    </div>
                    <div class="flex items-center space-x-2">
                        <label for="sort-by" class="text-xs md:text-sm font-medium">Sort By</label>
                        <select id="sort-by" class="border border-gray-300 rounded-md px-3 py-2 text-sm">
                            <option value="name_asc" @if ($sort_by == 'name_asc') selected @endif>
                                {{ trans('messages.a_z') }}</option>
                            <option value="name_desc" @if ($sort_by == 'name_desc') selected @endif>
                                {{ trans('messages.z_a') }}</option>
                            <option value="latest" @if ($sort_by == 'latest') selected @endif>
                                {{ trans('messages.latest') }}</option>
                            <option value="oldest" @if ($sort_by == 'oldest') selected @endif>
                                {{ trans('messages.oldest') }}</option>
                            <option value="price_low" @if ($sort_by == 'price_low') selected @endif>
                                {{ trans('messages.price_low_high') }}</option>
                            <option value="price_high" @if ($sort_by == 'price_high') selected @endif>
                                {{ trans('messages.price_high_low') }}</option>
                        </select>
                    </div>
                </div>
            </x-slot>

            @if (!empty($products))
                @foreach ($products as $prod)
                    @php
                        $priceData = getProductOfferPrice($prod);

                        $productUrl = route('product-detail', [
                            'slug' => $prod->slug,
                            'sku' => $prod->sku,
                        ]);
                    @endphp

                    <x-frontend.products.product-card-item image="{{ get_product_image($prod->thumbnail_img) }}"
                        alt="{{ $prod->getTranslation('name', $lang) }}"
                        title="{{ $prod->getTranslation('name', $lang) }}"
                        currentPrice="{{ $priceData['discounted_price'] }}"
                        originalPrice="{{ $priceData['original_price'] }}" link="{!! $productUrl !!}"
                        sku="{{ $prod->sku }}" slug="{{ $prod->slug }}"
                        category="{{ $prod->category->name }}" />
                @endforeach
            @endif

            <x-slot name="pagination">
                {{ $products->appends(request()->input())->links('components.frontend.products.custom-pagination') }}
            </x-slot>
        </x-frontend.products.shop-page>
    </form>
@endsection


@section('script')
    <script>
        const filterForm = document.getElementById('productfilters');
        document.addEventListener('DOMContentLoaded', function() {

            filterForm.addEventListener('change', function() {
                filterForm.submit();
            });

            $(".js-price-slider-value").val('{{ $price }}');
        });

        $(".js-price-slider").on("slidechange", function(event, ui) {
            filterForm.submit();
        });


        $('#sort-by').on('change', function() {
            var sort = $(this).val();
            $('#sort_by').val(sort);
            $('#productfilters').submit();
        });
    </script>
@endsection
