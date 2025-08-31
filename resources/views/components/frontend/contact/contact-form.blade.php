@props([
    'action' => 'sendemail.php'
])

<section class="contact-section pb_120">
    <div class="large-container">
        <div class="inner-container">
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 content-column">
                    <div class="form-inner">
                        <form method="post" action="{{ $action }}" id="contact-form">
                            <div class="row clearfix">
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <label>Name</label>
                                    <input type="text" name="username" placeholder="" required>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <label>E-mail</label>
                                    <input type="email" name="email" placeholder="" required>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <label>Phone</label>
                                    <input type="text" name="phone" placeholder="" required>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-12 form-group">
                                    <label>Subject</label>
                                    <input type="text" name="subject" placeholder="" required>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 form-group">
                                    <label>Write Message *</label>
                                    <textarea name="message" placeholder=""></textarea>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12 form-group message-btn">
                                    <button type="submit" class="-btn btn-one" name="submit-form">Send Message</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>