<div class="item-shorting">
    <div class="left-column">
        <div class="text">
            <p>
                Showing <span>{{ $showingStart ?? '1' }}–{{ $showingEnd ?? '30' }}</span> of
                <span>{{ $totalResults ?? '160' }}</span> results
            </p>
        </div>
    </div>
    <div class="right-column">
        <div class="short-box mr_30">
            <p>Sort:</p>
            <div class="select-box">
                <select class="wide">
                    <option data-display="Most popular">
                        Most popular
                    </option>
                    <option value="1">
                        New
                    </option>
                    <option value="2">
                        Top Sell
                    </option>
                    <option value="4">
                        Top Ratted
                    </option>
                </select>
            </div>
        </div>
    </div>
</div>