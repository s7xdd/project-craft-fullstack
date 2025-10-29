@props([
    'contacts' => [
        [
            'title' => 'Address',
            'details' => get_setting('footer_address')
        ],
        [
            'title' => 'Email Address',
            'details' => get_setting('footer_email')
        ],
        [
            'title' => 'Phone Number',
            'details' => get_setting('footer_phone')
        ]
    ]
])

<section class="py-16">
    <div class="container mx-auto px-4">
        <div class="text-center mb-12">
            <h2 class="text-3xl font-bold text-gray-900">Contact <span class="text-blue-600">Information</span></h2>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-3 gap-8 text-center">
            @foreach($contacts as $index => $contact)
            <div class=" rounded-2xl p-8 transition-all duration-500 hover:shadow-xl hover:-translate-y-2">
                <div class="w-20 h-20 bg-white rounded-full flex items-center justify-center mx-auto mb-4">
                    <i class="fas fa-{{ ['map-marker-alt', 'envelope', 'phone-alt', 'question'][$index % 4] }} text-2xl text-gray-700"></i>
                </div>
                <h4 class="text-xl font-semibold text-gray-900 mb-2">{{ $contact['title'] }}</h4>
                <p class="text-gray-700">{{ $contact['details'] }}</p>
            </div>
            @endforeach
        </div>
    </div>
</section>