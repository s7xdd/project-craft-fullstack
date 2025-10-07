// Hero Carousel using Embla Carousel
document.addEventListener('DOMContentLoaded', function() {
    const emblaNode = document.getElementById('hero-carousel');
    const dotsNode = document.getElementById('carousel-dots');

    if (!emblaNode || !dotsNode) return;

    // Initialize Embla Carousel with loop
    const emblaApi = EmblaCarousel(emblaNode, { loop: true });
    let selectedIndex = 0;

    // Function to update dots
    function updateDots() {
        const slides = emblaApi.slideNodes().length;
        dotsNode.innerHTML = '';

        for (let i = 0; i < slides; i++) {
            const button = document.createElement('button');
            button.className = 'inline-block mx-1 h-2 rounded-full bg-neutral-500/50 transition-opacity ' +
                             (selectedIndex === i ? 'w-7 opacity-100' : 'w-2 opacity-20');
            button.setAttribute('aria-label', `Go to slide ${i + 1}`);
            button.addEventListener('click', () => emblaApi.scrollTo(i));
            dotsNode.appendChild(button);
        }
    }

    // Handle slide selection
    emblaApi.on('select', () => {
        selectedIndex = emblaApi.selectedScrollSnap();
        updateDots();
    });

    // Initial setup
    updateDots();
});