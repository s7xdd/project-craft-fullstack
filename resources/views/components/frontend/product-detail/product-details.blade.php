<div class="content-box ml_30">
    <span class="upper-text">{{ $category }}</span>
    <h2>{{ $title }}</h2>
    <h3>{{ $price }} <del>{{ $originalPrice ?? '' }}</del></h3>
    <div class="text-box mb_30">
        {{ $description }}
    </div>
    <ul class="discription-box mb_30 clearfix">
        {{ $details }}
    </ul>
    {{ $colorOptions ?? '' }}
    {{ $cartOptions ?? '' }}
    <ul class="other-option clearfix">
        {{ $tags ?? '' }}
        {{ $socialLinks ?? '' }}
    </ul>
</div>