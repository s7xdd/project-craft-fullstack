@extends('backend.layouts.app')

@section('content')
    <div class="row">
        <div class="col-lg-8 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0 h6">Update Slider</h5>
                </div>
                <div class="card-body">
                    <form class="form-horizontal" method="POST" action="{{ route('home-slider.update', $homeSlider) }}">
                        @csrf
                        @method('PATCH')
                        <div class="form-group row">
                            <label class="col-md-3 col-form-label">Name</label>
                            <div class="col-md-9">
                                <input type="text" placeholder="Name" value="{{ old('name', $homeSlider->name) }}"
                                    id="name" name="name" class="form-control" required>
                                @error('name')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-3 col-form-label" for="signinSrEmail">
                                Banner
                                {{-- <small>(1300x650)</small> --}}
                            </label>
                            <div class="col-md-9">
                                <div class="input-group" data-toggle="aizuploader" data-type="image">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text bg-soft-secondary font-weight-medium">
                                            Browse
                                        </div>
                                    </div>
                                    <div class="form-control file-amount">Choose File</div>
                                    <input value="{{ old('banner', $homeSlider->image) }}" type="hidden" name="banner"
                                        class="selected-files" required>
                                </div>
                                <div class="file-preview box sm">
                                </div>
                                @error('banner')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>


                        <div class="form-group row">
                            <label class="col-md-3 col-form-label">Button Text</label>
                            <div class="col-md-9">
                                <input type="text" placeholder="Name"
                                    value="{{ old('btn_text', $homeSlider->btn_text) }}" id="btn_text" name="btn_text"
                                    class="form-control" required>
                                @error('btn_text')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>


                        <div class="form-group row">
                            <label class="col-md-3 col-form-label">Button Link</label>
                            <div class="col-md-9">
                                <input type="text" placeholder="Name"
                                    value="{{ old('link', $homeSlider->link) }}" id="link" name="link"
                                    class="form-control" required>
                                @error('link')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>


                        <div class="form-group row">
                            <label class="col-md-3 col-form-label">Sort Order</label>
                            <div class="col-md-9">
                                <input type="number" placeholder="Sort Order"
                                    value="{{ old('sort_order', $homeSlider->sort_order) }}" id="sort_order"
                                    name="sort_order" class="form-control" required>
                                @error('sort_order')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-3 col-form-label">Status</label>
                            <div class="col-md-9">
                                <select class="form-control aiz-selectpicker" name="status" id="status" required>
                                    <option {{ old('status', $homeSlider->status) == '1' ? 'selected' : '' }}
                                        value="1">
                                        Enabled</option>
                                    <option {{ old('status', $homeSlider->status) == '0' ? 'selected' : '' }}
                                        value="0">
                                        Disabled</option>
                                </select>
                                @error('status')
                                    <div class="alert alert-danger">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group mb-0 text-right">
                            <button type="submit" class="btn btn-primary">
                                Save
                            </button>
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
            var old_data = "{{ $homeSlider->link ?? $homeSlider->link_ref_id }}"
            $.post('{{ route('banners.get_form') }}', {
                _token: '{{ csrf_token() }}',
                link_type: link_type,
                old_data: old_data,
            }, function(data) {
                $('#banner_form').html(data);
            });
        }
    </script>
@endsection
