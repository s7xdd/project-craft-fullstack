@extends('backend.layouts.app', [ 'title' => 'Edit Partner Details'])
@section('content')
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <h5>Edit Testimonial Details</h5>
                <div class="separator mb-5"></div>
            </div>
        </div>
        <div class="row">
            <div class="col-8 offset-2">

                <div class="card mb-4">
                    <div class="card-body">
                        <form method="POST"
                            action="{{ route('testimonials.update', $testimonial) }}"
                            enctype="multipart/form-data">
                            @csrf
                            @method('PATCH')
                            <div class="form-group">
                                <label for="exampleInputEmail1">Name</label>
                                <input type="text" name="name" class="form-control"
                                    value="{{ old('name', $testimonial->name) }}" required>
                                @error('name')
                                    <div class="alert alert-danger mt-1">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Title</label>
                                <input type="text" name="title" class="form-control" value="{{ old('title', $testimonial->title) }}">
                                @error('title')
                                    <div class="alert alert-danger mt-1">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Comment</label>
                                <textarea name="comment" class="form-control" rows="6">{{ old('comment', $testimonial->comment) }}</textarea>
                                @error('comment')
                                    <div class="alert alert-danger mt-1">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Sort Order</label>
                                <input type="number" name="sort_order" class="form-control"
                                    value="{{ old('sort_order', $testimonial->sort_order) }}">
                                    @error('sort_order')
                                    <div class="alert alert-danger mt-1">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="video">Current Video</label>
                                @if($testimonial->video)
                                    <div class="mb-2">
                                        <video width="200" height="150" controls>
                                            <source src="{{ asset('storage/' . $testimonial->video) }}" >
                                            Your browser does not support the video tag.
                                        </video>
                                        <p class="mt-1">Current video file: {{ basename($testimonial->video) }}</p>
                                    </div>
                                @else
                                    <p>No video uploaded</p>
                                @endif
                            </div>

                            <div class="form-group">
                                <label for="video">Upload New Video</label>
                                <input type="file" name="video" class="form-control" accept="video/*">
                                <small class="form-text text-muted">Leave blank to keep current video</small>
                                @error('video')
                                    <div class="alert alert-danger mt-1">{{ $message }}</div>
                                @enderror
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Status</label>
                                <select name="status" class="form-control select2-single mb-3">
                                    <option {{ old('status', $testimonial->status) == '1' ? 'selected' : '' }} value="1">
                                        Enabled
                                    </option>
                                    <option {{ old('status', $testimonial->status) == '0' ? 'selected' : '' }} value="0">
                                        Disabled
                                    </option>
                                </select>
                                @error('status')
                                    <div class="alert alert-danger mt-1">{{ $message }}</div>
                                @enderror
                            </div>

                            <button type="submit" class="btn btn-primary mb-0">Update</button>
                            <a href="{{ route('testimonials.index') }}" class="btn btn-cancel mb-0"> Cancel</a>
                           
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
@endsection


@push('header')
   
@endpush
@push('footer')
    
    <script>
        $('#img').on('change', function() {
            if (this.files[0]) {
                $('#imgname').text(this.files[0].name)
            } else {
                $('#imgname').text('Choose file')
            }
        });

        $('input[type="file"][name="video"]').on('change', function() {
            if (this.files[0]) {
                // You can add custom handling for video file selection here
                console.log('Selected video: ' + this.files[0].name);
            }
        });

    </script>
@endpush
