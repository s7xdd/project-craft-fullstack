<div class="slide-item"
    style="background-image: url('{{ $image }}'); background-size: cover; background-position: center; border-radius: 50px;">
    <div class="bg-color-1" style="border-radius: 50px;" role="presentation" aria-hidden="true"></div>
    <div class="row align-items-center">
        <div class="col-lg-6 col-md-12 col-sm-12 content-column !w-[80%]">
            <div class="content-box">
                <h2 style="color: white; font-size: 30px;">
                    {!! $title !!}
                </h2>
                @if ($buttonText)
                    <div class="btn-box" >
                        <a href="{!! $link !!}" class="theme-btn btn-one" style="padding: 5px 15px; font-size: 20px;" >{!! $buttonText !!}</a>
                    </div>
                @endif
            </div>
        </div>
        <div class="col-lg-6 col-md-12 col-sm-12"></div>
    </div>
</div>
