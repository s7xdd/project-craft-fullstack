document.addEventListener('DOMContentLoaded', function() {
    // Get the contact form
    const contactForm = document.getElementById('contact-form');
    
    if (contactForm) {
        // Handle form submission
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Get form data
            const formData = new FormData(contactForm);
            
            // Get submit button and add loading state
            const submitBtn = contactForm.querySelector('button[type="submit"]');
            const originalBtnText = submitBtn.innerHTML;
            submitBtn.innerHTML = 'Sending...';
            submitBtn.disabled = true;
            
            // Send AJAX request
            axios.post(contactForm.action, formData)
                .then(function(response) {
                    // Show success message
                    showMessage('Thank you for your message. We will get back to you soon!', 'success');
                    // Reset form
                    contactForm.reset();
                })
                .catch(function(error) {
                    // Show error message
                    if (error.response && error.response.data.errors) {
                        // Validation errors
                        let errorMessages = '';
                        for (const field in error.response.data.errors) {
                            errorMessages += error.response.data.errors[field].join(', ') + '<br>';
                        }
                        showMessage(errorMessages, 'error');
                    } else {
                        // General error
                        showMessage('Something went wrong. Please try again.', 'error');
                    }
                })
                .finally(function() {
                    // Reset button state
                    submitBtn.innerHTML = originalBtnText;
                    submitBtn.disabled = false;
                });
        });
    }
    
    // Function to show messages
    function showMessage(message, type) {
        // Remove any existing messages
        const existingMessage = document.querySelector('.form-message');
        if (existingMessage) {
            existingMessage.remove();
        }
        
        // Create message element
        const messageDiv = document.createElement('div');
        messageDiv.className = `form-message ${type}`;
        messageDiv.innerHTML = message;
        
        // Add styles
        messageDiv.style.padding = '10px';
        messageDiv.style.margin = '10px 0';
        messageDiv.style.borderRadius = '4px';
        messageDiv.style.color = 'white';
        
        if (type === 'success') {
            messageDiv.style.backgroundColor = '#4CAF50';
        } else {
            messageDiv.style.backgroundColor = '#f44336';
        }
        
        // Insert message before the form
        const formInner = document.querySelector('.form-inner');
        if (formInner) {
            formInner.insertBefore(messageDiv, formInner.firstChild);
        }
        
        // Auto remove message after 5 seconds
        setTimeout(function() {
            if (messageDiv.parentNode) {
                messageDiv.remove();
            }
        }, 5000);
    }
});