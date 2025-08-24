@extends('backend.layouts.app')

@section('content')
    <style>
        .remove-attachment {
            display: none;
        }
    </style>

    <div class="aiz-titlebar text-left mt-2 mb-3">
        <h5 class="mb-0 h4">{{ trans('messages.project') . ' ' . trans('messages.information') }}</h5>
    </div>

    <div class="col-lg-10 mx-auto">
        <div class="card">
            <div class="card-body p-0">
                {{-- <ul class="nav nav-tabs nav-fill border-light">
                    @foreach (\App\Models\Language::all() as $key => $language)
                        <li class="nav-item">
                            <a class="nav-link text-reset @if ($language->code == $lang) active @else bg-soft-dark border-light border-left-0 @endif py-3"
                                href="{{ route('service.edit', ['id' => $project->id, 'lang' => $language->code]) }}">
            <img src="{{ static_asset('assets/img/flags/' . $language->code . '.png') }}" height="11"
                class="mr-1">
            <span>{{ $language->name }}</span>
            </a>
            </li>
            @endforeach
            </ul> --}}
                <form class="p-4" action="{{ route('project.update', $project->id) }}" method="POST"
                    enctype="multipart/form-data">
                    <input type="hidden" name="lang" value="{{ $lang }}">
                    @csrf

                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">{{ trans('messages.name') }} <i
                                class="las la-language text-danger"
                                title="{{ trans('messages.translatable') }}"></i></label>
                        <div class="col-md-9">
                            <input type="text" name="name" value="{{ $project->getTranslation('name', $lang) }}"
                                class="form-control" id="name" onchange="title_update(this)"
                                placeholder="{{ trans('messages.name') }}">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-3 col-from-label">Subtitle </label>
                        <div class="col-md-9">
                            <input type="text" placeholder="Subtitle" value="{{ $project->subtitle }}" name="subtitle"
                                class="form-control">
                            @error('subtitle')
                                <div class="alert alert-danger mt-1">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    {{-- <div class="form-group row">
                    <label class="col-md-3 col-form-label">{{ trans('messages.parent_project') }}</label>
                    <div class="col-md-9">
                        <select class="select2 form-control" name="parent_id">
                            <option value="">{{ trans('messages.none') }}</option>
                            @foreach ($all_projects as $parent)
                            @if ($parent->id !== $project->id)
                            <option value="{{ $parent->id }}" {{ $project->parent_id == $parent->id ? 'selected' : '' }}>
                                {{ $parent->getTranslation('name') }}
                            </option>
                            @endif
                            @endforeach
                        </select>
                    </div>
                </div> --}}

                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">{{ trans('messages.slug') }}<span
                                class="text-danger">*</span></label>
                        <div class="col-md-9">
                            <input type="text" placeholder="{{ trans('messages.slug') }}" id="slug" name="slug"
                                class="form-control" value="{{ $project->slug }}">
                            @error('slug')
                                <div class="alert alert-danger mt-1">{{ $message }}</div>
                            @enderror
                        </div>
                    </div>

                    {{-- <div class="form-group row">
                    <label class="col-md-3 col-from-label">{{ trans('messages.price') }} </label>
                    <div class="col-md-6">
                        <input type="number" lang="en" min="0" value="{{ $project->price ?? 0 }}" step="0.01" placeholder="{{ trans('messages.price') }}" name="price" class="form-control">
                    </div>
                </div> --}}

                    <div class="form-group row">
                        <label class="col-md-3 col-form-label" for="signinSrEmail">{{ trans('messages.image') }}</label>
                        <div class="col-md-9">
                            <div class="input-group" data-toggle="aizuploader" data-type="image">
                                <div class="input-group-prepend">
                                    <div class="input-group-text bg-soft-secondary font-weight-medium">
                                        {{ trans('messages.browse') }}
                                    </div>
                                </div>
                                <div class="form-control file-amount">{{ trans('messages.choose_file') }}</div>
                                <input type="hidden" name="image" value="{{ $project->image }}" class="selected-files">
                            </div>
                            <div class="file-preview box sm">
                            </div>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-3 col-form-label" for="gallery_images">
                            {{ trans('messages.gallery_images') }}
                            <small>({{ trans('messages.1000*1000') }})</small>
                        </label>

                        <div class="col-md-8">
                            <input type="file" name="gallery_images[]" multiple class="form-control" accept="image/*">

                            @if (!empty($project->photos))
                                <div class="file-preview box sm mt-3" id="gallery-preview">
                                    @php
                                        $photos = explode(',', $project->photos);
                                    @endphp

                                    @foreach ($photos as $photo)
                                        <div
                                            class="d-flex justify-content-between align-items-center mt-2 file-preview-item">
                                            <div
                                                class="align-items-center align-self-stretch d-flex justify-content-center thumb">
                                                <img src="{{ asset($photo) }}" class="img-fit"
                                                    style="width: 100px; height: auto;">
                                            </div>
                                            <div class="remove">
                                                <button type="button" class="btn btn-link text-danger remove-gallery-image"
                                                    data-url="{{ $photo }}" data-project-id="{{ $project->id }}">
                                                    <i class="la la-close"></i>
                                                </button>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            @endif
                        </div>
                    </div>





                    <div class="form-group row">
                        <label class="col-md-3 col-from-label">{{ trans('messages.description') }}</label>
                        <div class="col-md-9">
                            <textarea class="aiz-text-editor" data-min-height="300" name="description">{{ old('description', $project->getTranslation('description', $lang)) }}</textarea>
                        </div>
                    </div>

                    @if ($lang == 'en')
                        <div class="form-group  row">
                            <label class="col-md-3 col-form-label">{{ trans('messages.active_status') }}</label>
                            <div class="col-md-9">
                                <select class="select2 form-control" name="status">
                                    <option {{ old('status', $project->status) == 1 ? 'selected' : '' }} value="1">
                                        {{ trans('messages.yes') }}
                                    </option>
                                    <option {{ old('status', $project->status) == 0 ? 'selected' : '' }} value="0">
                                        {{ trans('messages.no') }}
                                    </option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-md-3 col-form-label">Sort Order</label>
                            <div class="col-md-9">
                                <input type="number" name="sort_order" class="form-control"
                                    value="{{ old('sort_order', $project->sort_order) }}">
                                @error('sort_order')
                                    <div class="alert alert-danger mt-1">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>
                    @endif

                    <div class="form-group row">
                        <label class="col-md-3 col-from-label">{{ trans('messages.tags') }}</label>
                        <div class="col-md-8">
                            <input type="text" class="form-control aiz-tag-input" name="tags[]"
                                placeholder="{{ trans('messages.type_hit_enter_add_tag') }}"
                                value="{{ $project->tags }}">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-3 col-form-label">Project Completion Status</label>
                        <div class="col-md-8">
                            <select class="select2 form-control" name="completion_status">
                                <option {{ old('completion_status', $project->completion_status) == 0 ? 'selected' : '' }}
                                    value="0">
                                    Upcoming
                                </option>
                                <option {{ old('completion_status', $project->completion_status) == 1 ? 'selected' : '' }}
                                    value="1">
                                    Completed
                                </option>
                            </select>
                        </div>
                    </div>


                    <h5 class="mb-0 h6">Project Highlights</h5>
                    <hr>

                    @php
                        $highlights = json_decode($project->highlights, true);
                    @endphp

                    <div class="mb-2">
                        @for ($i = 1; $i <= 4; $i++)
                            <div class="form-group row">
                                <div class="col-md-6">
                                    <label for="title{{ $i }}" class="col-form-label">Highlight Title
                                        {{ $i }}</label>
                                    <input type="text" placeholder="Title {{ $i }}"
                                        id="title{{ $i }}" name="title{{ $i }}"
                                        class="form-control"
                                        value="{{ old('title' . $i, $highlights[$i - 1]['title'] ?? '') }}">
                                    @error('title' . $i)
                                        <div class="alert alert-danger mt-1">{{ $message }}</div>
                                    @enderror
                                </div>
                                <div class="col-md-6">
                                    <label for="subtitle{{ $i }}" class="col-form-label">Highlight Subtitle
                                        {{ $i }}</label>
                                    <input type="text" placeholder="Subtitle {{ $i }}"
                                        id="subtitle{{ $i }}" name="subtitle{{ $i }}"
                                        class="form-control"
                                        value="{{ old('subtitle' . $i, $highlights[$i - 1]['subtitle'] ?? '') }}">
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
                        <label class="col-md-3 col-form-label" for="name">{{ trans('messages.meta_title') }}</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="meta_title"
                                placeholder="{{ trans('messages.meta_title') }}"
                                value="{{ old('meta_title', $project->getTranslation('meta_title', $lang)) }}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label"
                            for="name">{{ trans('messages.meta_description') }}</label>
                        <div class="col-md-9">
                            <textarea name="meta_description" rows="5" class="form-control">{{ old('meta_description', $project->getTranslation('meta_description', $lang)) }}</textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label"
                            for="name">{{ trans('messages.meta_keywords') }}</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="meta_keywords"
                                placeholder="{{ trans('messages.meta_keywords') }}"
                                value="{{ old('meta_keywords', $project->getTranslation('meta_keywords', $lang)) }}">
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-3 col-form-label" for="name">{{ trans('messages.og_title') }}</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="og_title"
                                placeholder="{{ trans('messages.og_title') }}"
                                value="{{ old('og_title', $project->getTranslation('og_title', $lang)) }}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label"
                            for="name">{{ trans('messages.og_description') }}</label>
                        <div class="col-md-9">
                            <textarea name="og_description" rows="5" class="form-control">{{ old('og_description', $project->getTranslation('og_description', $lang)) }}</textarea>
                        </div>
                    </div>

                    <div class="form-group row">
                        <label class="col-md-3 col-form-label"
                            for="name">{{ trans('messages.twitter_title') }}</label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" name="twitter_title"
                                placeholder="{{ trans('messages.twitter_title') }}"
                                value="{{ old('twitter_title', $project->getTranslation('twitter_title', $lang)) }}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-md-3 col-form-label"
                            for="name">{{ trans('messages.twitter_description') }}</label>
                        <div class="col-md-9">
                            <textarea name="twitter_description" rows="5" class="form-control">{{ old('twitter_description', $project->getTranslation('twitter_description', $lang)) }}</textarea>
                        </div>
                    </div>

                    <div class="form-group mb-0 text-right">
                        <button type="submit" class="btn btn-primary">{{ trans('messages.Save') }}</button>
                        <a href="{{ route('service.index') }}" class="btn btn-cancel">{{ trans('messages.cancel') }}</a>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('script')
    <script>
        function title_update(e) {
            var title = e.value;
            $.ajax({
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                url: "{{ route('generate-slug') }}",
                type: 'GET',
                data: {
                    title: title
                },
                success: function(response) {
                    $('#slug').val(response);
                }
            });
        }
    </script>

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            document.querySelectorAll('.remove-gallery-image').forEach(button => {
                button.addEventListener('click', function() {
                    const imageUrl = this.dataset.url;
                    const projectId = this.dataset.projectId;

                    if (!confirm('Are you sure you want to delete this image?')) {
                        return;
                    }

                    fetch('{{ route('project.delete_gallery') }}', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': '{{ csrf_token() }}',
                            },
                            body: JSON.stringify({
                                image_url: imageUrl,
                                project_id: projectId
                            })
                        })
                        .then(response => response.json())
                        .then(data => {
                            if (data.success) {
                                this.closest('.file-preview-item').remove();
                            } else {
                                alert(data.message || 'Failed to delete image.');
                            }
                        })
                        .catch(error => {
                            console.error(error);
                            alert('Something went wrong.');
                        });
                });
            });
        });
    </script>
@endsection
