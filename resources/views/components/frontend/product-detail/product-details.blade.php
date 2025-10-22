  <div class="space-y-6">
      <div class="space-y-2">
          <span class="text-sm text-gray-600 font-medium">{{ $category }}</span>
          <h1 class="text-3xl lg:text-4xl font-bold text-gray-900 leading-tight">{!! $title !!}</h1>
          <div class="flex items-center space-x-3">
              <span class="text-3xl font-bold text-red-600">{{ env('DEFAULT_CURRENCY') . ' ' . $price }}</span>
              @if ($originalPrice && floatval($originalPrice) > floatval($price))
                  <span class="text-xl text-gray-500 line-through">{{ env('DEFAULT_CURRENCY') . ' ' . $originalPrice }}</span>
              @endif
          </div>
      </div>

      @if (isset($description) && trim(strip_tags($description)) != '')
          <div class="text-gray-700 leading-relaxed">{!! $description !!}</div>
      @endif

      <div class="bg-gray-50 border border-gray-200 rounded-lg p-6 space-y-3">
          {{ $details ?? '' }}
      </div>

      {!! $colorOptions !!}

      <div class="space-y-4">
          {{ $tags ?? '' }}
          {{ $socialLinks ?? '' }}
      </div>

      {{ $productDescription ?? '' }}

      {{ $cartOptions ?? '' }}

  </div>
