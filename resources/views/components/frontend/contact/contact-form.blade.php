@props([
    'action' => route('contact.submit')
])

<section class="contact-section pb_120">
    <div class="large-container">
        <div class="inner-container !bg-white">
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 content-column">
                    <div class="form-inner">
                        <form method="post" action="{{ $action }}" id="contact-form">
                            @csrf
                            <div class="row clearfix">
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <label>First Name</label>
                                    <input type="text" name="firstName" placeholder="" required>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <label>Last Name</label>
                                    <input type="text" name="lastName" placeholder="" required>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <label>E-mail</label>
                                    <input type="email" name="email" placeholder="" required>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <label>Phone</label>
                                    <input type="text" name="phone" placeholder="">
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                    <label>Subject</label>
                                    <input type="text" name="subject" placeholder="" required>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                    <label>Write Message *</label>
                                    <textarea name="message" placeholder="" required></textarea>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 form-group message-btn ">
                                    <button type="submit" class="theme-btn btn-one !bg-black" name="submit-form">Send Message</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>