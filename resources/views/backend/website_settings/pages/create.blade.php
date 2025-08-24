@extends('backend.layouts.app')
@section('content')
    <div class="aiz-titlebar text-left mt-2 mb-3">
        <div class="row align-items-center">
            <div class="col">
                <h1 class="h3">Add New Page</h1>
            </div>
        </div>
    </div>
    <div class="card">
        <form action="{{ route('custom-pages.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="card-header">
                <h6 class="fw-600 mb-0">Page Content</h6>
            </div>
            <div class="card-body">
                <div class="form-group row">
                    <label class="col-sm-2 col-from-label" for="name">{{ translate('Title') }} <span
                            class="text-danger">*</span></label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="{{ translate('Title') }}" name="title"
                            required>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-from-label" for="name">{{ translate('Link') }} <span
                            class="text-danger">*</span></label>
                    <div class="col-sm-10">
                        <div class="input-group d-block d-md-flex">
                            <div class="input-group-prepend "><span
                                    class="input-group-text flex-grow-1">{{ route('home') }}/</span></div>
                            <input type="text" class="form-control w-100 w-md-auto" placeholder="Slug" name="slug"
                                required>
                        </div>
                        <small class="form-text text-muted">Use character, number, hypen only</small>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-2 col-from-label" for="name">{{ translate('Add Content') }} <span
                            class="text-danger">*</span></label>
                    <div class="col-sm-10">
                        <textarea class="aiz-text-editor form-control"
                            data-buttons='[["font", ["bold", "underline", "italic", "clear"]],["para", ["ul", "ol", "paragraph"]],["style", ["style"]],["color", ["color"]],["table", ["table"]],["insert", ["link", "picture", "video"]],["view", ["fullscreen", "codeview", "undo", "redo"]]]'
                            placeholder="Content.." data-min-height="300" name="content" required></textarea>
                    </div>
                </div>
            </div>

            <div class="card-header">
                <h6 class="fw-600 mb-0">Seo Fields</h6>
            </div>
            <div class="card-body">

                <div class="form-group row">
                    <label class="col-sm-2 col-from-label" for="name">{{ translate('Meta Title') }}</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="{{ translate('Title') }}" name="meta_title">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-from-label" for="name">{{ translate('Meta Description') }}</label>
                    <div class="col-sm-10">
                        <textarea class="resize-off form-control" placeholder="{{ translate('Description') }}" name="meta_description"></textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-from-label" for="name">{{ translate('Keywords') }}</label>
                    <div class="col-sm-10">
                        <textarea class="resize-off form-control" placeholder="{{ translate('Keyword, Keyword') }}" name="keywords"></textarea>
                        <small class="text-muted">Separate with coma</small>
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-sm-2 col-from-label" for="name">{{ translate('OG Title') }}</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="{{ translate('OG Title') }}"
                            name="og_title">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-from-label" for="name">{{ translate('OG Description') }}</label>
                    <div class="col-sm-10">
                        <textarea class="resize-off form-control" placeholder="{{ translate('OG Description') }}" name="og_description"></textarea>
                    </div>
                </div>


                <div class="form-group row">
                    <label class="col-sm-2 col-from-label" for="name">{{ translate('Twitter Title') }}</label>
                    <div class="col-sm-10">
                        <input type="text" class="form-control" placeholder="{{ translate('Twitter Title') }}"
                            name="twitter_title">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-from-label" for="name">{{ translate('Twitter Description') }}</label>
                    <div class="col-sm-10">
                        <textarea class="resize-off form-control" placeholder="{{ translate('Twitter Description') }}"
                            name="twitter_description"></textarea>
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-from-label" for="name">{{ translate('Meta Image') }}</label>
                    <div class="col-sm-10">
                        <div class="input-group " data-toggle="aizuploader" data-type="image">
                            <div class="input-group-prepend">
                                <div class="input-group-text bg-soft-secondary font-weight-medium">Browse</div>
                            </div>
                            <div class="form-control file-amount">Choose File</div>
                            <input type="hidden" name="meta_image" class="selected-files">
                        </div>
                        <div class="file-preview">
                        </div>
                    </div>
                </div>

                <div class="text-right">
                    <button type="submit" class="btn btn-primary">Save Page</button>
                </div>
            </div>
        </form>
    </div>
@endsection
