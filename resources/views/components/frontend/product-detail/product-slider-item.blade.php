<div class="slider-content">
    <div class="image-inner">
        <div class="image-box">
            <figure class="image">
                <a href="{{ $image }}" class="lightbox-image" data-fancybox="gallery">
                    <img src="{{ $image }}" alt="{{ $alt }}" />
                </a>
            </figure>
        </div>
        <div class="slider-pager">
            <ul class="thumb-box">
                {{ $thumbnails }}
            </ul>
        </div>
    </div>
</div>