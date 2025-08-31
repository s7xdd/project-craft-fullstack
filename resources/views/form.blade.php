@extends('backend.layouts.app')

@section('content')
    <div class="row">
        <div class="col-md-6" style="padding: 20px">
            <h4 class="fw-600">{{ $title ?? '' }}</h4>

        </div>

        <div class="col-md-6 text-right">
            <form method="post" action="{{ $submitRoute ?? '' }}" id="submissionForm">
                @csrf
                <input type="hidden" name="state">
                <input type="hidden" name="submissionValues" id="submissionValues" value="">
        </div>
    </div>

    @if ($errors->any())
        <div class="alert alert-danger">
            <p style="font-size: 16pt"><strong>Oops</strong>, there was an issue with that.</p>
            <ul class="ml-5">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <div id="formio-form"></div>

@endsection

@section('script')
    <script lang="text/javascript">
        window.onload = function() {
            Formio.createForm(document.getElementById('formio-form'), {!! $definition !!}).then(function(form) {
                form.submission = {
                    data: {!! $data !!},
                };

                form.on('submit', function(submission) {
                    var submitForm = document.getElementById('submissionForm');
                    submitForm.querySelector('input[name=state]').value = submission.state;
                    submitForm.querySelector('input[name=submissionValues]').value = JSON.stringify(
                        submission.data);

                    submitForm.submit();
                });
            });
        };
    </script>
@endsection
