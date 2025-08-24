<!doctype html>
@if(\App\Models\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->rtl == 1)
<html dir="rtl" lang="{{ str_replace('_', '-', app()->getLocale()) }}">
@else
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
@endif
<head>
	<meta name="csrf-token" content="{{ csrf_token() }}">
	<meta name="app-url" content="{{ getBaseURL() }}">
	<meta name="file-base-url" content="{{ getFileBaseURL() }}">

	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Favicon -->
	<link rel="icon" type="image/svg" href="{{ asset('assets/img/favicon.ico') }}">
	<title>{{ env('APP_NAME') }}</title>

	<!-- google font -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700">

	<!-- aiz core css -->
	<link rel="stylesheet" href="{{ asset('assets/css/vendors.css') }}">
    @if(\App\Models\Language::where('code', Session::get('locale', Config::get('app.locale')))->first()->rtl == 1)
    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap-rtl.min.css') }}">
    @endif
	<link rel="stylesheet" href="{{ asset('assets/css/aiz-core.css') }}">

    <style>
        body {
            font-size: 12px;
        }
    </style>
	<script>
    	var AIZ = AIZ || {};
        AIZ.local = {
            nothing_selected: '{{  trans('messages.Nothing selected') }}',
            nothing_found: '{{  trans('messages.Nothing found') }}',
            choose_file: '{{  trans('messages.Choose file') }}',
            file_selected: '{{  trans('messages.File selected') }}',
            files_selected: '{{  trans('messages.Files selected') }}',
            add_more_files: '{{  trans('messages.Add more files') }}',
            adding_more_files: '{{  trans('messages.Adding more files') }}',
            drop_files_here_paste_or: '{{  trans('messages.Drop files here, paste or') }}',
            browse: '{{  trans('messages.Browse') }}',
            upload_complete: '{{  trans('messages.Upload complete') }}',
            upload_paused: '{{  trans('messages.Upload paused') }}',
            resume_upload: '{{  trans('messages.Resume upload') }}',
            pause_upload: '{{  trans('messages.Pause upload') }}',
            retry_upload: '{{  trans('messages.Retry upload') }}',
            cancel_upload: '{{  trans('messages.Cancel upload') }}',
            uploading: '{{  trans('messages.Uploading') }}',
            processing: '{{  trans('messages.Processing') }}',
            complete: '{{  trans('messages.Complete') }}',
            file: '{{  trans('messages.File') }}',
            files: '{{  trans('messages.Files') }}',
        }
	</script>

</head>
<body class="">

	<div class="aiz-main-wrapper d-flex">
        <div class="flex-grow-1">
            @yield('content')
        </div>
    </div><!-- .aiz-main-wrapper -->

    @yield('modal')


    <script src="{{ asset('assets/js/vendors.js') }}" ></script>
    <script src="{{ asset('assets/js/aiz-core.js') }}" ></script>

    @yield('script')

    <script type="text/javascript">
        @foreach (session('flash_notification', collect())->toArray() as $message)
            AIZ.plugins.notify('{{ $message['level'] }}', '{{ $message['message'] }}');
        @endforeach
    </script>

</body>
</html>