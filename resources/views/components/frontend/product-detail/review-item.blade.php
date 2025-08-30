<div class="single-review">
    <div class="upper-box">
        <div class="info-box">
            <figure class="image">
                <img src="{{ $avatar }}" alt="{{ $author }}" />
            </figure>
            <div class="inner">
                <h4>{{ $author }}</h4>
                <span class="date">{{ $date }}</span>
            </div>
        </div>
        <ul class="option-btn">
            <li>
                <button>
                    <i class="icon-33"></i></button>{{ $likes }}
            </li>
            <li>
                <button>
                    <i class="icon-34"></i></button>{{ $dislikes }}
            </li>
        </ul>
    </div>
    <ul class="rating">
        {{ $rating }}
    </ul>
    <p>{{ $content }}</p>
    {{ $images ?? '' }}
    {{ $reply ?? '' }}
</div>