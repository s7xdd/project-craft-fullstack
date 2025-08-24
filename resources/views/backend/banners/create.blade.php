@extends('backend.layouts.app')

@section('content')
    <div class="row">
        <div class="col-lg-8 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0 h6">Create Banner</h5>
                </div>
                <div class="card-body">
                    <form class="form-horizontal" method="POST" action="{{ route('banners.store') }}">
                        @csrf
                        <div class="form-group row">
                            <label class="col-md-3 col-form-label">Name</label>
                            <div class="col-md-9">
                                <input type="text" placeholder="Name" value="{{ old('name') }}"
                                    id="name" name="name" class="form-control" required>
                                @error('name')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-3 col-form-label" for="signinSrEmail">
                                Banner
                                <small>(1300x650)</small>
                            </label>
                            <div class="col-md-9">
                                <div class="input-group" data-toggle="aizuploader" data-type="image">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text bg-soft-secondary font-weight-medium">
                                            Browse
                                        </div>
                                    </div>
                                    <div class="form-control file-amount">Choose File</div>
                                    <input value="{{ old('banner') }}" type="hidden" name="banner" class="selected-files"
                                        required>
                                </div>
                                <div class="file-preview box sm">
                                </div>
                                @error('banner')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-3 col-form-label" for="signinSrEmail">
                                Mobile Banner
                                <small>(1300x650)</small>
                            </label>
                            <div class="col-md-9">
                                <div class="input-group" data-toggle="aizuploader" data-type="image">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text bg-soft-secondary font-weight-medium">
                                            Browse
                                        </div>
                                    </div>
                                    <div class="form-control file-amount">Choose File</div>
                                    <input value="{{ old('mobile_banner') }}" type="hidden" name="mobile_banner"
                                        class="selected-files" required>
                                </div>
                                <div class="file-preview box sm">
                                </div>
                                @error('mobile_banner')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-3 col-form-label">Title</label>
                            <div class="col-md-9">
                                <input type="text" placeholder="Title" value="{{ old('title') }}" id="title"
                                    name="title" class="form-control">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-3 col-form-label">Sub Title</label>
                            <div class="col-md-9">
                                <input type="text" placeholder="Sub Title" value="{{ old('sub_title') }}" id="sub_title"
                                    name="sub_title" class="form-control">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-3 col-form-label">Button Text</label>
                            <div class="col-md-9">
                                <input type="text" placeholder="Button Text" value="{{ old('btn_text') }}" id="btn_text"
                                    name="btn_text" class="form-control">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-3 col-form-label">Link Type</label>
                            <div class="col-md-9">
                                <select onchange="banner_form()" class="form-control aiz-selectpicker" name="link_type"
                                    id="link_type" data-live-search="true" required>
                                    <option {{ old('link_type') == 'external' ? 'selected' : '' }} value="external">External
                                    </option>
                                    <option {{ old('link_type') == 'product' ? 'selected' : '' }} value="product">Product</option>
                                    <option {{ old('link_type') == 'category' ? 'selected' : '' }} value="category">Category</option>
                                </select>
                                @error('link_type')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div id="banner_form">
                        </div>
                        @error('link')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror
                        @error('link_ref_id')
                            <div class="alert alert-danger">{{ $message }}</div>
                        @enderror

                        <div class="form-group row">
                            <label class="col-md-3 col-form-label">Status</label>
                            <div class="col-md-9">
                                <select class="form-control aiz-selectpicker" name="status" id="status" required>
                                    <option {{ old('status') == '1' ? 'selected' : '' }} value="1">Enabled</option>
                                    <option {{ old('status') == '0' ? 'selected' : '' }} value="0">Disabled</option>
                                </select>
                                @error('status')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group mb-0 text-right">
                            <button type="submit" class="btn btn-primary btn-sm">
                                Save
                            </button>
                            <a href="{{ route('banners.index') }}" class="btn btn-sm btn-cancel">{{trans('messages.cancel')}}</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
@section('script')
    <script type="text/javascript">
        $(document).ready(function() {
            banner_form();
        });

        function banner_form() {
            var link_type = $('#link_type').val();
            var link_error = "{{ $errors->getBag('default')->first('link') }}"
            var link_id_error = "{{ $errors->getBag('default')->first('link_ref_id') }}"
            $.post('{{ route('banners.get_form') }}', {
                _token: '{{ csrf_token() }}',
                link_type: link_type,
            }, function(data) {
                $('#banner_form').html(data);
            });
        }
    </script>
@endsection
