@php
    $hasChildren = isset($item->child) && count($item->child);
    $isMegamenu = $hasChildren ;
@endphp

@if ($isMegamenu)
    <li class="dropdown">
        <a href="{{ $item->link }}">{{ $item->label }} <i class="fas fa-chevron-down menu-arrow"></i></a>
        <div class="megamenu">
            <div class="row clearfix">
                @foreach ($item->child as $group)
                    <div class="col-xl-3 column">
                        <ul style="display: flex;flex-direction: column;">
                            <li>
                                <a href="{{ $group->link }}">{{ $group->label }}</a>
                            </li>
                            @if (isset($group->child) && count($group->child))
                                @foreach ($group->child as $sub)
                                    <li>
                                        <a href="{{ $sub->link }}">{{ $sub->label }}</a>
                                    </li>
                                @endforeach
                            @endif
                        </ul>
                    </div>
                @endforeach
            </div>
            <div class="advice-box">
                <img class="h-full w-full object-fill" src="{{ uploaded_asset(get_setting('menu_image')) }}" />
            </div>
        </div>
    </li>
@elseif($hasChildren)
    <li class="dropdown">
        <a href="{{ $item->link }}">{{ $item->label }} <i class="fas fa-chevron-down menu-arrow"></i></a>
        <ul class="submenu">
            @foreach ($item->child as $child)
                @include('frontend.parts.menu-item', ['item' => $child])
            @endforeach
        </ul>
    </li>
@else
    <li>
        <a href="{{ $item->link }}">{{ $item->label }}</a>
    </li>
@endif
