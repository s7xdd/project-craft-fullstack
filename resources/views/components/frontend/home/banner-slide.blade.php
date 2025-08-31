<div class="slide-item"
    style="background-image: url('{{ $image }}'); background-size: cover; background-position: center;">
    <div class="bg-color-1"></div>
    <div class="row align-items-center">
        <div class="col-lg-6 col-md-12 col-sm-12 content-column">
            <div class="content-box">
                <h2 style="color: white;">
                    {!! $title !!}
                </h2>
                @if ($buttonText)
                    <div class="btn-box">
                        <a href="{{ $link }}" class="theme-btn btn-one">{{ $buttonText }}</a>
                    </div>
                @endif
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-sm-12"></div>
    </div>
</div>
