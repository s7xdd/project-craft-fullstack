<section class="highlights-section pt_40">
  <div class="large-container">
    <div class="inner-container">
      <!-- Inline flex wrap -->
      <ul class="list-item clearfix" style="display:flex; flex-wrap:wrap; margin-left:-8px; margin-right:-8px;">
        <li style="width:50%; padding-left:8px; padding-right:8px;">
          <div class="single-item flex flex-col alighn-center">
            <div class="icon-box">
              <img src="{{ $icon }}" alt="" style="height: 43px;" />
            </div>
            <div class="text-xs">{{ $text }}</div>
          </div>
        </li>
        <!-- repeat li... -->
        {{ $slot }}
      </ul>
    </div>
  </div>
</section>
