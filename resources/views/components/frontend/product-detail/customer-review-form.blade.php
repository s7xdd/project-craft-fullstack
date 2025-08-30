<div class="customer-review">
    <h3>{{ $title }}</h3>
    {{ $rating ?? '' }}
    <div class="form-inner">
        <form method="post" action="{{ $action }}">
            <div class="form-group">
                <label>{{ $reviewLabel }} <span>*</span></label>
                <textarea name="message"></textarea>
            </div>
            <div class="form-group upload-field">
                <label>{{ $uploadLabel }}</label>
                <div class="upload-box">
                    <input name="files[]" id="filer_input2" multiple="multiple" type="file" />
                    <div class="upload-content">
                        <i class="icon-35"></i>
                        <span>{{ $uploadText }}</span>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <label>{{ $nameLabel }} <span>*</span></label>
                <input type="text" name="name" />
            </div>
            <div class="form-group">
                <label>{{ $emailLabel }} <span>*</span></label>
                <input type="email" name="email" />
            </div>
            <div class="form-group">
                <div class="check-box-two">
                    <input class="check" type="checkbox" id="checkbox1" />
                    <label for="checkbox1">{{ $checkboxLabel }}</label>
                </div>
            </div>
            <div class="message-btn">
                <button type="submit" class="theme-btn btn-one">
                    {{ $submitText }}
                </button>
            </div>
        </form>
    </div>
</div>