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