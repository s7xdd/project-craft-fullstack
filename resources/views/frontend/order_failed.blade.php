@extends('frontend.layouts.app')

@section('content')
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 mt-5 min-h-[80vh]">
        <div class="flex justify-center">
            <div class="w-full max-w-4xl">
                <div class="bg-white rounded-lg shadow-md">
                    <div class="border-b border-gray-200 px-6 py-4 text-center">
                        <h3 class="text-2xl font-semibold">Order Failed!</h3>
                    </div>
                    <div class="p-6 text-center">
                        <div class="mb-4">
                            <i class="fas fa-times-circle text-red-500 text-6xl"></i>
                        </div>
                        <h4 class="text-xl font-semibold mb-2">Payment was not successful</h4>
                        <p class="text-lg text-gray-600 mb-4">There was an issue processing your payment.</p>
                        @if (session('error'))
                            <div class="bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-md mb-4">
                                {{ session('error') }}
                            </div>
                        @endif
                        <p class="mb-4">Please try again or contact support if the problem persists.</p>

                        <div class="mt-4 flex justify-center space-x-4">
                            <a href="{{ route('checkout') }}" class="bg-blue-500 text-white px-6 py-2 rounded-md font-medium hover:bg-blue-600 transition-colors">Retry Payment</a>
                            <a href="{{ route('home') }}" class="bg-gray-500 text-white px-6 py-2 rounded-md font-medium hover:bg-gray-600 transition-colors">Go Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
