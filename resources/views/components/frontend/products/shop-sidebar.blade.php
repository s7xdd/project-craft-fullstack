<div class="shop-sidebar" style="display: flex; flex-direction: column; gap: 20px">
    <div class="col-12 col-md-6 col-lg-12">
        <div class="top-filter__widget">
            <h2 class="widget__title">{{ trans('messages.category') }}</h2>
            @if (!empty($categories))
                <ul class="widget__collections">
                    @foreach ($categories as $cat)
                        <li><a class="@if ($category == $cat->getTranslation('slug', $lang)) active-category @endif"
                                href="{{ route('products.index', ['category' => $cat->getTranslation('slug', $lang)]) }}">{{ $cat->getTranslation('name', $lang) }}</a>
                        </li>
                    @endforeach

                </ul>
            @endif

        </div>
    </div>
    {{-- <div class="col-12 col-md-6 col-lg-12">
        <div class="top-filter__widget">
            <h2 class="widget__title">{{ trans('messages.brands') }}</h2>
            <ul class="widget__checkbox-options">
                @if (!empty($brands))
                    @foreach ($brands as $brnd)
                        <li>
                            <label>
                                <input type="checkbox" name="brand[]"
                                    @if (!empty($brand)) {{ in_array($brnd->getTranslation('slug', $lang), $brand) ? 'checked' : '' }} @endif
                                    value="{{ $brnd->getTranslation('slug', $lang) }}" />
                                <span>{{ $brnd->getTranslation('name', $lang) }}</span>
                            </label>
                        </li>
                    @endforeach
                @endif
            </ul>
        </div>
    </div> --}}

    <div class="col-12 col-md-6 col-lg-12">
        <div class="top-filter__widget">
            <h2 class="widget__title">{{ trans('messages.price') }}</h2>
            <div class="widget__price-slider">
                <div class="js-price-slider"></div>
                <div class="price-slider__value">
                    <span>{{ trans('messages.from') }}</span>
                    <input type="text" class="js-price-slider-value" name="price" value="{{ $price }}" />
                </div>
            </div>
        </div>
    </div>
</div>
