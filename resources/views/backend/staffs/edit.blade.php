@extends('backend.layouts.app')

@section('content')

<div class="row">
    <div class="col-lg-8 mx-auto">
        <div class="card">
            <div class="card-header">
                <h5 class="mb-0 h4">{{trans('messages.staff_info')}}</h5>
            </div>

            <form action="{{ route('staffs.update', $staff->id) }}" method="POST">
                <input name="_method" type="hidden" value="PATCH">
            	@csrf
                <div class="card-body">
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{trans('messages.name')}}</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="{{trans('messages.name')}}" id="name" name="name" value="{{ $staff->user->name }}" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="email">{{trans('messages.email')}}</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="{{trans('messages.email')}}" id="email" name="email" value="{{ $staff->user->email }}" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="mobile">{{trans('messages.phone')}}</label>
                        <div class="col-sm-9">
                            <input type="text" placeholder="{{trans('messages.phone')}}" id="mobile" name="mobile" value="{{ $staff->user->phone }}" class="form-control" required>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="password">{{trans('messages.password')}}</label>
                        <div class="col-sm-9">
                            <input type="password" placeholder="{{trans('messages.password')}}" id="password" name="password" class="form-control">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label class="col-sm-3 col-from-label" for="name">{{trans('messages.role')}}</label>
                        <div class="col-sm-9">
                            <select name="role_id" required class="form-control aiz-selectpicker">
                                @foreach($roles as $role)
                                    <option value="{{$role->id}}" @php if($staff->role_id == $role->id) echo "selected"; @endphp >{{$role->name}}</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                    <div class="form-group mb-0 text-right">
                        <button type="submit" class="btn btn-sm btn-primary">{{trans('messages.Save')}}</button>
                        <a href="{{ route('staffs.index') }}" class="btn btn-sm btn-cancel">{{trans('messages.cancel')}}</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

@endsection
