document.addEventListener('DOMContentLoaded', function() {
    // Get elements
    const mobileSearchTrigger = document.getElementById('mobile-search-trigger');
    const mobileSearchPopup = document.getElementById('mobile-search-popup');
    const searchPopupOverlay = document.getElementById('search-popup-overlay');
    const closeSearchPopup = document.getElementById('close-search-popup');
    
    // Check if elements exist
    if (mobileSearchTrigger && mobileSearchPopup && searchPopupOverlay && closeSearchPopup) {
        // Open search popup
        mobileSearchTrigger.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Show the popup with display block first
            mobileSearchPopup.style.display = 'block';
            
            // Add show class for animations
            setTimeout(() => {
                mobileSearchPopup.classList.add('show');
            }, 10);
            
            document.body.style.overflow = 'hidden';
            
            // Focus on the search input after animation starts
            const searchInput = mobileSearchPopup.querySelector('input[type="search"]');
            if (searchInput) {
                setTimeout(() => {
                    searchInput.focus();
                }, 300);
            }
        });
        
        // Close search popup when clicking on overlay
        searchPopupOverlay.addEventListener('click', function() {
            // Remove show class to trigger hide animation
            mobileSearchPopup.classList.remove('show');
            
            // Hide the popup after animation completes
            setTimeout(() => {
                mobileSearchPopup.style.display = 'none';
                document.body.style.overflow = 'auto';
            }, 300);
        });
        
        // Close search popup when clicking on close button
        closeSearchPopup.addEventListener('click', function() {
            // Remove show class to trigger hide animation
            mobileSearchPopup.classList.remove('show');
            
            // Hide the popup after animation completes
            setTimeout(() => {
                mobileSearchPopup.style.display = 'none';
                document.body.style.overflow = 'auto';
            }, 300);
        });
        
        // Close search popup when pressing Escape key
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape' && mobileSearchPopup.classList.contains('show')) {
                // Remove show class to trigger hide animation
                mobileSearchPopup.classList.remove('show');
                
                // Hide the popup after animation completes
                setTimeout(() => {
                    mobileSearchPopup.style.display = 'none';
                    document.body.style.overflow = 'auto';
                }, 300);
            }
        });
    }
});