// Product Image Slider using Embla Carousel
document.addEventListener('DOMContentLoaded', function() {
    const emblaNode = document.getElementById('product-image-carousel');
    const thumbnailsNode = document.getElementById('product-thumbnails');

    if (!emblaNode || !thumbnailsNode) return;

    // Initialize Embla Carousel with loop
    const emblaApi = EmblaCarousel(emblaNode, {
        loop: true,
        align: 'center'
    });

    let selectedIndex = 0;

    // Function to update thumbnail active state
    function updateThumbnails() {
        const buttons = thumbnailsNode.querySelectorAll('.thumbnail-btn');
        buttons.forEach((btn, index) => {
            if (index === selectedIndex) {
                btn.classList.remove('border-gray-300');
                btn.classList.add('border-blue-500');
            } else {
                btn.classList.remove('border-blue-500');
                btn.classList.add('border-gray-300');
            }
        });
    }

    // Handle slide selection
    emblaApi.on('select', () => {
        selectedIndex = emblaApi.selectedScrollSnap();
        updateThumbnails();
    });

    // Add click handlers to thumbnails
    const thumbnailButtons = thumbnailsNode.querySelectorAll('.thumbnail-btn');
    thumbnailButtons.forEach((btn, index) => {
        btn.addEventListener('click', () => {
            emblaApi.scrollTo(index);
        });
    });

    // Initial setup
    updateThumbnails();

    // Image Zoom Functionality (Desktop only)
    const zoomWindow = document.getElementById('image-zoom-window');
    const zoomLens = document.getElementById('zoom-lens');
    if (zoomWindow && zoomLens && window.innerWidth >= 768) { // Only enable on desktop (768px+)
        const zoomFactor = 2.5; // Magnification level (adjust as needed)
        let currentImageSrc = ''; // Track current image for zoom

        // Function to update zoom window background and position
        function updateZoom(e) {
            const img = e.target;
            if (!img || img.tagName !== 'IMG') return;

            const rect = img.getBoundingClientRect();
            const x = e.clientX - rect.left;
            const y = e.clientY - rect.top;

            // Check if mouse is over the image
            if (x < 0 || x > rect.width || y < 0 || y > rect.height) {
                hideZoom();
                return;
            }

            // Show zoom window if hidden
            if (zoomWindow.classList.contains('hidden')) {
                zoomWindow.classList.remove('hidden');
                zoomWindow.classList.add('show');
            }

            // Update background image if changed
            if (currentImageSrc !== img.src) {
                currentImageSrc = img.src;
                zoomLens.style.backgroundImage = `url('${img.src}')`;
            }

            // Calculate background position for magnification
            const bgX = (x / rect.width) * 100;
            const bgY = (y / rect.height) * 100;
            zoomLens.style.backgroundPosition = `${bgX}% ${bgY}%`;
            zoomLens.style.backgroundSize = `${zoomFactor * 100}% ${zoomFactor * 100}%`;
        }

        // Function to hide zoom window
        function hideZoom() {
            zoomWindow.classList.add('hidden');
            zoomWindow.classList.remove('show');
        }

        // Add event listeners to all large images in the carousel
        function attachZoomListeners() {
            const slides = document.querySelectorAll('.embla__slide img');
            slides.forEach(img => {
                img.addEventListener('mousemove', updateZoom);
                img.addEventListener('mouseleave', hideZoom);
            });
        }

        // Re-attach listeners after slide change (Embla 'select' event)
        emblaApi.on('select', () => {
            attachZoomListeners(); // Re-bind for new active slide
        });

        // Initial attachment
        attachZoomListeners();
    }
});