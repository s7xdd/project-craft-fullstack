<!DOCTYPE html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title></title>
    {!! SEO::generate() !!}
    <link rel="stylesheet" href="{{ asset('assets/css/lineicons-regular.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/css/icon-font.min.css') }}">

    <link rel="stylesheet" href="https://cdn.form.io/formiojs/formio.full.min.css">


    <script src="https://cdn.form.io/formiojs/formio.full.min.js"></script>



    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
</head>

<body>
    <div id="main" style="padding: 20px">
        @yield('content')
    </div>


    @yield('script')

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
