<div class="item-shorting">
    <div class="left-column">
        <div class="text">
            <p>
                Showing <span>{{ $showingStart ?? '1' }}–{{ $showingEnd ?? '30' }}</span> of
                <span>{{ $totalResults ?? '160' }}</span> results
            </p>
        </div>
    </div>
    <div class="products-sort-by d-flex align-items-center">
        <label for="sort-by">{{ trans('messages.sort_by') }}</label>
        <div class="products-sort-by__select">
            <i class="lnil lnil-chevron-down"></i>
            <select id="sort-by">
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
</div>
