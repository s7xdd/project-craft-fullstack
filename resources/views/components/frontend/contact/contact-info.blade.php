@props([
    'contacts' => [
        [
            'title' => 'Main Warehouse',
            'details' => '0233 Brisbane Cir. Shiloh, Australia 81063'
        ],
        [
            'title' => 'Email Address',
            'details' => 'contact@example.com'
        ],
        [
            'title' => 'Phone Number',
            'details' => '+(208) 544 -0142'
        ]
    ]
])

<section class="contact-info-section pb_50">
    <div class="large-container">
        <div class="sec-title centred mb_50">
            <h2>Contact <span>Information</span></h2>
        </div>
        <div class="row clearfix">
            @foreach($contacts as $contact)
            <div class="col-xl-4 col-lg-4 col-md-12 info-column">
                <div class="info-block-one">
                    <div class="">
                        <h4>{{ $contact['title'] }}</h4>
                        <p>{{ $contact['details'] }}</p>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>