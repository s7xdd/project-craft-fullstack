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
});