@extends('backend.layouts.app')

@section('content')

<div class="aiz-titlebar text-left mt-2 mb-3">
	<div class="row align-items-center">
		<div class="col">
			<h1 class="h3">Website Header</h1>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-md-8 mx-auto">
		<div class="card">
			<div class="card-header">
				<h6 class="mb-0">Header Setting</h6>
			</div>
			<div class="card-body">
				<form action="{{ route('business_settings.update') }}" method="POST" enctype="multipart/form-data">
					@csrf
					
                    
					<div class=" pt-3">
                        <div class="form-group row">
							<label class="col-md-3 col-from-label">Header Top Left Text</label>
							<div class="col-md-8">
								<div class="form-group">
									<input type="hidden" name="types[]" value="helpline_title">
									<input type="text" class="form-control" placeholder="Help line title" name="helpline_title" value="{{ get_setting('helpline_title') }}">
								</div>
							</div>
						</div>
                    </div>

                    <div class="">
                        <div class="form-group row">
							<label class="col-md-3 col-from-label">Header Top Right Text</label>
							<div class="col-md-8">
								<div class="form-group">
									<input type="hidden" name="types[]" value="helpline_number">
									<input type="text" class="form-control" placeholder="Help line number" name="helpline_number" value="{{ get_setting('helpline_number') }}">
								</div>
							</div>
						</div>
                    </div>
					
					
					<div class="text-right">
						<button type="submit" class="btn btn-primary">Update</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

@endsection
