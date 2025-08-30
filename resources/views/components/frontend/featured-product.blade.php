<div class="featured-block-one">
    <div class="inner-box clearfix">
        <div class="bg-color-1"></div>
        <figure class="image-box {{ $imagePosition ?? 'p_absolute t_0 r_0' }}">
            <img src="{{ $image }}" style="{{ $imageStyle ?? 'object-fit: contain;' }}" alt="{{ $alt }}" />
        </figure>
        <div class="text-box">
            <h6>{{ $subtitle ?? "" }}</h6>
            <h2>{{ $title ?? ""}}</h2>
            <h4><span>{{ $description ?? ""}}</span></h4>
            <a href="{{ $link ?? ""}}" class="theme-btn btn-one">{{ $buttonText ?? ""}}</a>
        </div>
    </div>
</div>