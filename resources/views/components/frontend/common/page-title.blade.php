<section class="pb-5 md:pb-8">
    <div class="max-w-[1600px] mx-auto px-4 sm:px-6 lg:px-8">
        <nav class="flex" aria-label="Breadcrumb">
            <ol class="flex items-center space-x-2">
                @php
                    if (!isset($breadcrumbs)) {
                        $breadcrumbs = [['label' => 'Home', 'url' => '/']];
                        $breadcrumbs[] = ['label' => $title, 'url' => null];
                    }
                @endphp
                @foreach($breadcrumbs as $index => $crumb)
                <li class="flex items-center">
                    @if($crumb['url'])
                        <a href="{{ $crumb['url'] }}" class="text-gray-600 hover:text-gray-900 flex items-center transition-colors duration-200">
                            @if($index === 0)
                                <svg class="h-5 w-5" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"/>
                                </svg>
                            @endif
                            <span class="ml-2">{{ $crumb['label'] }}</span>
                        </a>
                    @else
                        <span class="ml-2 text-gray-900 font-medium" aria-current="page">{{ $crumb['label'] }}</span>
                    @endif
                </li>
                @if(!$loop->last)
                <li class="flex items-center">
                    <svg class="h-5 w-5 text-gray-400" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                        <path fill-rule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clip-rule="evenodd"/>
                    </svg>
                </li>
                @endif
                @endforeach
            </ol>
        </nav>
    </div>
</section>
