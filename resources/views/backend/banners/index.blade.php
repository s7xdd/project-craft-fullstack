@extends('backend.layouts.app')

@section('content')
    <div class="row">
        <div class="col-lg-12 mx-auto">

            <div class="aiz-titlebar text-left mt-2 mb-3">
                <div class="row align-items-center">
                    <div class="col-md-6">
                        <h1 class="h3">{{trans('messages.all').' '.trans('messages.banners')}}</h1>
                    </div>
                    <div class="col-md-6 text-md-right">
                        <a href="{{ route('banners.create') }}" class="btn btn-primary">
                            <span>{{trans('messages.add_new').' '.trans('messages.banner')}}</span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="card">
                <form class="" id="sort_customers" action="" method="GET">

                    <div class="card-body">
                        <table class="table aiz-table mb-0">
                            <thead>
                                <tr>
                                    <th >{{trans('messages.name')}}</th>
                                    <th >{{trans('messages.image')}}</th>
                                    {{-- <th >Banner Position</th> --}}
                                    <th class="text-center">{{trans('messages.link_type')}}</th>
                                    <th class="text-center">{{trans('messages.status')}}</th>
                                    <th class="text-center">{{trans('messages.options')}}</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($banners as $key => $banner)
                                    <tr>
                                        <td>
                                           {{ $banner->name }} 
                                        </td>
                                        <td>
                                            <div class="row gutters-5 w-200px  mw-100">
                                                @if ($banner->getTranslation('image'))
                                                    <div class="col-auto">
                                                        <img src="{{ uploaded_asset($banner->getTranslation('image')) }}" alt="Image"
                                                            class="img-fit">
                                                    </div>
                                                @endif
                                            </div>
                                        </td>
                                        <td class="text-center">
                                            <span class="text-capitalize">{{ $banner->link_type }} </span>
                                        </td>
                                        <td class="text-center">
                                            @if ($banner->status)
                                                <span
                                                    class="badge badge-inline badge-success text-capitalize">{{trans('messages.enabled')}}</span>
                                            @else
                                                <span
                                                    class="badge badge-inline badge-danger text-capitalize">{{trans('messages.disabled')}}</span>
                                            @endif
                                        </td>
                                        <td class="text-center">
                                            <a class="btn btn-soft-primary btn-icon btn-circle btn-sm"
                                                href="{{ route('banners.edit', ['id' => $banner->id, 'lang' => env('DEFAULT_LANGUAGE')]) }}" title="{{trans('messages.edit')}}">
                                                <i class="las la-edit"></i>
                                            </a>
                                            <a href="#"
                                                class="btn btn-soft-danger btn-icon btn-circle btn-sm confirm-delete"
                                                data-href="{{ route('banners.destroy', $banner) }}"
                                                title="{{trans('messages.delete')}}">
                                                <i class="las la-trash"></i>
                                            </a>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <div class="aiz-pagination">
                            {{ $banners->appends(request()->input())->links('pagination::bootstrap-5') }}
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('modal')
    @include('modals.delete_modal')
@endsection
