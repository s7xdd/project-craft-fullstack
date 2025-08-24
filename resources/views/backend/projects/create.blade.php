@extends('backend.layouts.app')

@section('content')
    <style>
        .remove-attachment {
            display: none;
        }
    </style>

    <div class="row">
        <div class="col-lg-10 mx-auto">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0 h6">{{ trans('messages.projects') . ' ' . trans('messages.information') }}</h5>
                </div>
                <div class="card-body">
                    <form class="form-horizontal" action="{{ route('project.store') }}" method="POST"
                        enctype="multipart/form-data">
                        @csrf

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">{{ trans('messages.name') }}<span
                                    class="text-danger">*</span></label>
                            <div class="col-md-10">
                                <input type="text" placeholder="{{ trans('messages.name') }}" id="name"
                                    name="name" class="form-control" onchange="title_update(this)"
                                    value="{{ old('name') }}">
                                @error('name')
                                    <div class="alert alert-danger mt-1">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-from-label">Subtitle </label>
                            <div class="col-md-10">
                                <input type="text" placeholder="Subtitle" name="subtitle" class="form-control">
                                @error('subtitle')
                                    <div class="alert alert-danger mt-1">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>


                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Parent Project</label>
                            <div class="col-md-10">
                                <select class="select2 form-control" name="parent_id">
                                    <option value="">{{ trans('messages.none') }}</option>
                                    @foreach ($all_projects as $parent)
                                        <option value="{{ $parent->id }}">{{ $parent->getTranslation('name') }}</option>
                                    @endforeach
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">{{ trans('messages.slug') }}<span
                                    class="text-danger">*</span></label>
                            <div class="col-md-10">
                                <input type="text" placeholder="{{ trans('messages.slug') }}" id="slug"
                                    name="slug" class="form-control" value="{{ old('slug') }}">
                                @error('slug')
                                    <div class="alert alert-danger mt-1">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        {{--
                        <div class="form-group row">
                            <label class="col-md-2 col-from-label">{{ trans('messages.price') }} </label>
                            <div class="col-md-10">
                                <input type="number" lang="en" min="0" value="0" step="0.01"
                                    placeholder="{{ trans('messages.price') }}" name="price" class="form-control">
                            </div>
                        </div> --}}

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label"
                                for="signinSrEmail">{{ trans('messages.image') }}</label>
                            <div class="col-md-10">
                                <div class="input-group" data-toggle="aizuploader" data-type="image">
                                    <div class="input-group-prepend">
                                        <div class="input-group-text bg-soft-secondary font-weight-medium">
                                            {{ trans('messages.browse') }}
                                        </div>
                                    </div>
                                    <div class="form-control file-amount">{{ trans('messages.choose_file') }}</div>
                                    <input type="hidden" name="image" value="" class="selected-files">
                                </div>
                                <div class="file-preview box sm">
                                </div>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label" for="gallery_images">
                                {{ trans('messages.gallery_images') }}
                                <small>({{ trans('messages.1000*1000') }})</small>
                            </label>

                            <div class="col-md-10">
                                <input type="file" name="gallery_images[]" multiple class="form-control"
                                    accept="image/*">
                            </div>
                        </div>


                        <div class="form-group row">
                            <label class="col-md-2 col-from-label">{{ trans('messages.description') }}</label>
                            <div class="col-md-10">
                                <textarea class="aiz-text-editor" data-min-height="300" name="description">{{ old('description') }}</textarea>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">{{ trans('messages.active_status') }}</label>
                            <div class="col-md-10">
                                <select class="select2 form-control" name="status">
                                    <option {{ old('status') == 1 ? 'selected' : '' }} value="1">
                                        {{ trans('messages.yes') }}
                                    </option>
                                    <option {{ old('status') == 0 ? 'selected' : '' }} value="0">
                                        {{ trans('messages.no') }}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label">Sort Order</label>
                            <div class="col-md-10">
                                <input type="number" name="sort_order" class="form-control"
                                    value="{{ old('sort_order', 0) }}">
                                @error('sort_order')
                                    <div class="alert alert-danger mt-1">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-3 col-from-label">{{ trans('messages.tags') }}</label>
                            <div class="col-md-8">
                                <input type="text" class="form-control aiz-tag-input" name="tags[]"
                                    placeholder="{{ trans('messages.type_hit_enter_add_tag') }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-3 col-form-label">Project Completion Status</label>
                            <div class="col-md-8">
                                <select class="select2 form-control" name="completion_status">
                                    <option {{ old('completion_status') == 0 ? 'selected' : '' }} value="0">
                                        Upcoming
                                    </option>
                                    <option {{ old('completion_status') == 1 ? 'selected' : '' }} value="1">
                                        Completed
                                    </option>
                                </select>
                            </div>
                        </div>

                        <h5 class="mb-0 h6 mt-2">Project Highlights</h5>
                        <hr>

                        <div class="mb-2">
                            @for ($i = 1; $i <= 4; $i++)
                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <label for="title{{ $i }}" class="col-form-label">Highlight Title
                                            {{ $i }}</label>
                                        <input type="text" placeholder="Title {{ $i }}"
                                            id="title{{ $i }}" name="title{{ $i }}"
                                            class="form-control" value="{{ old('title' . $i) }}">
                                        @error('title' . $i)
                                            <div class="alert alert-danger mt-1">{{ $message }}</div>
                                        @enderror
                                    </div>
                                    <div class="col-md-6">
                                        <label for="subtitle{{ $i }}" class="col-form-label">Highlight
                                            Subtitle
                                            {{ $i }}</label>
                                        <input type="text" placeholder="Subtitle {{ $i }}"
                                            id="subtitle{{ $i }}" name="subtitle{{ $i }}"
                                            class="form-control" value="{{ old('subtitle' . $i) }}">
                                        @error('subtitle' . $i)
                                            <div class="alert alert-danger mt-1">{{ $message }}</div>
                                        @enderror
                                    </div>
                                </div>
                            @endfor
                        </div>



                        <h5 class="mb-0 h6">{{ trans('messages.seo_section') }}</h5>
                        <hr>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label"
                                for="name">{{ trans('messages.meta_title') }}</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="meta_title"
                                    placeholder="{{ trans('messages.meta_title') }}" value="{{ old('meta_title') }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label"
                                for="name">{{ trans('messages.meta_description') }}</label>
                            <div class="col-md-10">
                                <textarea name="meta_description" rows="5" class="form-control">{{ old('meta_description') }}</textarea>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label"
                                for="name">{{ trans('messages.meta_keywords') }}</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="meta_keywords"
                                    placeholder="{{ trans('messages.meta_keywords') }}"
                                    value="{{ old('meta_keywords') }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label"
                                for="name">{{ trans('messages.og_title') }}</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="og_title"
                                    placeholder="{{ trans('messages.og_title') }}" value="{{ old('og_title') }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label"
                                for="name">{{ trans('messages.og_description') }}</label>
                            <div class="col-md-10">
                                <textarea name="og_description" rows="5" class="form-control">{{ old('og_description') }}</textarea>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-2 col-form-label"
                                for="name">{{ trans('messages.twitter_title') }}</label>
                            <div class="col-md-10">
                                <input type="text" class="form-control" name="twitter_title"
                                    placeholder="{{ trans('messages.twitter_title') }}"
                                    value="{{ old('twitter_title') }}">
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-md-2 col-form-label"
                                for="name">{{ trans('messages.twitter_description') }}</label>
                            <div class="col-md-10">
                                <textarea name="twitter_description" rows="5" class="form-control">{{ old('twitter_description') }}</textarea>
                            </div>
                        </div>

                        <div class="form-group mb-0 text-right">
                            <button type="submit" class="btn btn-primary">{{ trans('messages.Save') }}</button>
                            <a href="{{ route('project.index') }}"
                                class="btn btn-cancel">{{ trans('messages.cancel') }}</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    @endsection

    @section('script')
        <script>
            function title_update(e) {
                title = e.value;
                title = title.toLowerCase().replace(/ /g, '-').replace(/[^\w-]+/g, '')
                $('#slug').val(title)
            }
        </script>
    @endsection
