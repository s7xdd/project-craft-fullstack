@php
    $value = null;
    for ($i = 0; $i < $child_category->level; $i++) {
        $value .= '--';
    }
@endphp
<option {{ isset($old_data) ? ( $old_data == $child_category->id ? 'selected' : '' ) : '' }} value="{{ $child_category->id }}">{{ $value . ' ' . $child_category->name }}</option>
@if ($child_category->categories)
    @foreach ($child_category->categories as $childCategory)
        @include('backend.categories.child_category', [
            'child_category' => $childCategory,
        ])
    @endforeach
@endif
Z