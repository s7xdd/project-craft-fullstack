import './bootstrap';
import './contact';

import Swiper from 'swiper';
import { Navigation, Pagination, Autoplay, Thumbs } from 'swiper/modules';
import 'swiper/css';
import 'swiper/css/pagination';
import 'swiper/css/navigation';

Swiper.use([Navigation, Pagination, Autoplay, Thumbs]);

document.addEventListener("DOMContentLoaded", () => {
    const container = document.getElementById("product-swiper");
    if (!container) return;

    const images = JSON.parse(container.dataset.images || "[]");

    // Inject Swiper HTML
    container.innerHTML = `
        <div class="swiper product-images-swiper overflow-hidden rounded-lg border w-full">
            <div class="swiper-wrapper py-10 m-auto">
                ${images.map(img => `
                    <div class="swiper-slide !flex !justify-center !items-center !mx-auto">
                        <img src="${img}" alt="product image" 
                             class="!max-w-full !max-h-[300px] md:!max-h-[500px] object-contain m-auto">
                    </div>`).join('')}
            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>

        <div class="swiper product-thumbs-swiper w-full max-w-full mt-1">
            <div class="swiper-wrapper">
                ${images.map(img => `
                    <div class="swiper-slide border cursor-pointer flex items-center justify-center">
                        <img src="${img}" alt="thumb" class="w-full max-h-[100px] object-contain rounded">
                    </div>`).join('')}
            </div>
        </div>
    `;

    // Init thumbs
    const thumbsSwiper = new Swiper('.product-thumbs-swiper', {
        spaceBetween: 10,
        slidesPerView: 5,
        freeMode: true,
        watchSlidesProgress: true,
    });

    // Init main swiper
    new Swiper('.product-images-swiper', {
        spaceBetween: 10,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        thumbs: {
            swiper: thumbsSwiper,
        },
    });
});
