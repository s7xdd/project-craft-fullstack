@extends('frontend.layouts.app')

@section('content')
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header text-center">
                        <h3>Order Failed!</h3>
                    </div>
                    <div class="card-body text-center">
                        <div class="mb-4">
                            <i class="fas fa-times-circle text-danger" style="font-size: 4rem;"></i>
                        </div>
                        <h4>Payment was not successful</h4>
                        <p class="lead">There was an issue processing your payment.</p>
                        @if (session('error'))
                            <div class="alert alert-danger">
                                {{ session('error') }}
                            </div>
                        @endif
                        <p>Please try again or contact support if the problem persists.</p>

                        <div class="mt-4">
                            <a href="{{ route('checkout') }}" class="btn btn-primary">Retry Payment</a>
                            <a href="{{ route('home') }}" class="btn btn-secondary">Go Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
