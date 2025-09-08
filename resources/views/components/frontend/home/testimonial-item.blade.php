<div class="testimonial-block-one">
    <div class="inner-box video-card">
        <figure class="video-box">
            <video id="testimonial-video-{{ $loop->index ?? 0 }}" 
                   class="testimonial-video !rounded-md" 
                   controls
                   playsinline
                   muted>
                <source src="{{ $video }}" type="video/mp4">
                Your browser does not support the video tag.
            </video>
        </figure>
    </div>
</div>