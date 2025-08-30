@extends('frontend.layouts.form-builder-layout')

@section('content')
    <div class="row">
        <div class="col-md-6">
            <h1>Form Builder Demo</h1>
        </div>

        <div class="col-md-6 text-right">
            <form method="post" action="{{ '/test-add' }}">
                @csrf
                <input type="hidden" name="definition" id="definition" value="">

                <button type="submit" class="btn btn-outline-primary">
                    <i class="fas fa-save" aria-hidden="true"></i>
                    Save Form
                </button>
        </div>
    </div>

    <div id="formio-builder"></div>
@endsection

@section('script')
    <script lang="text/javascript">
        window.onload = function() {
            new Formio.builder(
                document.getElementById('formio-builder'),
                @if (isset($definition))
                    {!! $definition !!}
                @else
                    {}
                @endif , {}
            ).then(function(builder) {
                document.getElementById('definition').value = JSON.stringify(builder.schema);

                builder.on('change', function(e) {
                    document.getElementById('definition').value = JSON.stringify(builder.schema);
                })
            });;
        };
    </script>
@endsection
