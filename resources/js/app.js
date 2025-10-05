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
            <div class="swiper-wrapper !h-full">
                ${images.map(img => `
                   <div class="swiper-slide !flex !justify-center !items-center !mx-auto !bg-white !w-full !h-full">
                    <img src="${img}" alt="product image"
                        class="w-full h-full object-cover rounded-lg">
                </div>
                `).join('')}
            </div>
            <div class="swiper-button-prev"></div>
            <div class="swiper-button-next"></div>
        </div>

        <div class="swiper product-thumbs-swiper w-full max-w-full mt-1">
            <div class="swiper-wrapper ">
                ${images.map(img => `
                    <div class="swiper-slide !bg-white border cursor-pointer flex items-center justify-center">
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

document.addEventListener("DOMContentLoaded", () => {
    document.querySelectorAll('.product-swiper').forEach((el) => {
        new Swiper(el, {
            slidesPerView: 4,
            spaceBetween: 20,
            navigation: {
                nextEl: el.querySelector('.swiper-button-next'),
                prevEl: el.querySelector('.swiper-button-prev'),
            },
            breakpoints: {
                1024: { slidesPerView: 5 },
                768: { slidesPerView: 2 },
                0: { slidesPerView: 1.5 }
            }
        });
    });
});



"use strict";

(function ($) {
    function ReplaceWithPolyfill() {
        'use-strict';

        var parent = this.parentNode,
            i = arguments.length,
            currentNode;
        if (!parent) return;
        if (!i)
            parent.removeChild(this);

        while (i--) {
            currentNode = arguments[i];

            if (typeof currentNode !== 'object') {
                currentNode = this.ownerDocument.createTextNode(currentNode);
            } else if (currentNode.parentNode) {
                currentNode.parentNode.removeChild(currentNode);
            }


            if (!i)
                parent.replaceChild(currentNode, this); else
                parent.insertBefore(currentNode, this.previousSibling);
        }
    }

    if (!Element.prototype.replaceWith) {
        Element.prototype.replaceWith = ReplaceWithPolyfill;
    }

    if (!CharacterData.prototype.replaceWith) {
        CharacterData.prototype.replaceWith = ReplaceWithPolyfill;
    }

    if (!DocumentType.prototype.replaceWith) {
        DocumentType.prototype.replaceWith = ReplaceWithPolyfill;
    }

    const imageObj = {};

    $.fn.imageZoom = function (options) {
        let settings = $.extend({
            zoom: 150
        }, options);

        imageObj.template = `
			<figure class="containerZoom" style="background-image:url('${this.attr('src')}'); background-size: ${settings.zoom}%;">
				<img id="imageZoom" src="${this.attr('src')}" alt="${this.attr('alt')}" />
			</figure>
		`;

        function zoomIn(e) {
            let zoomer = e.currentTarget;
            let x, y, offsetX, offsetY;
            e.offsetX ? offsetX = e.offsetX : offsetX = e.touches[0].pageX;
            e.offsetY ? offsetY = e.offsetY : offsetY = e.touches[0].pageX;
            x = offsetX / zoomer.offsetWidth * 100;
            y = offsetY / zoomer.offsetHeight * 100;
            $(zoomer).css({
                "background-position": `${x}% ${y}%`
            });
        }


        function attachEvents(container) {
            container = $(container);
            container.on('mouseenter', function (e) {
                if ("zoom" in imageObj == false) {
                    imageObj.zoom = false;
                }

                if (imageObj.zoom) {
                    imageObj.zoom = false;
                    $(this).removeClass('active');
                } else {
                    imageObj.zoom = true;
                    $(this).addClass('active');
                    zoomIn(e);
                }
            });
            container.on('mousemove', function (e) {
                imageObj.zoom ? zoomIn(e) : null;
            });
            container.on('mouseleave', function () {
                imageObj.zoom = false;
                $(this).removeClass('active');
            });
        }

        let newElm = $(this).replaceWith(imageObj.template);
        attachEvents($('.containerZoom')[$('.containerZoom').length - 1]);

        return newElm;
    };
})(jQuery);



const activeImage = document.querySelector(".product-image .active");
const productImages = document.querySelectorAll(".image-list img");

function changeImage(e) {
    let imgPath = e.target.src;

    activeImage.src = imgPath;
    document.querySelector('#imageZoom').src = imgPath;
    document.querySelector('.containerZoom').style.backgroundImage = "url('" + imgPath + "')";

}

function toggleNavigation() {
    this.nextElementSibling.classList.toggle('active');
}

productImages.forEach(image => image.addEventListener("click", changeImage));

$(document).ready(function () {
    $('#imageZoom').imageZoom({ zoom: 200 });
});



window.addEventListener("load", imageZoom("my-image"));
function imageZoom(imgID) {
    const img = document.getElementById(imgID);
    const result = document.getElementById('my-result');
    let lens = document.querySelector('.img-zoom-lens');

    const wrap = document.getElementById('zoom-wrap');
    if (!img || !result || !wrap) return;

    // Ensure positioned context and stacking
    wrap.style.position = 'relative'; // stacking context for lens
    result.style.position = 'absolute';

    // Show lens/result
    lens.classList.remove('hidden');
    result.classList.remove('hidden');

    // Size lens if not set
    if (!lens.style.width) {
        lens.style.width = '100px';
        lens.style.height = '100px';
        lens.style.background = 'rgba(255,255,255,0.25)';
        lens.style.border = '1px solid rgba(0,0,0,0.1)';
        lens.style.cursor = 'crosshair';
        lens.style.zIndex = '20'; // below thumbs z-30
    }

    // Keep result above image but below thumbs
    result.style.zIndex = '25';

    // Compute ratios using rendered sizes
    const lensRect = lens.getBoundingClientRect();
    const resRect = result.getBoundingClientRect();
    const imgRect = img.getBoundingClientRect();

    const cx = resRect.width / lensRect.width;
    const cy = resRect.height / lensRect.height;

    result.style.backgroundImage = `url('${img.src}')`;
    result.style.backgroundRepeat = 'no-repeat';
    result.style.backgroundSize = `${imgRect.width * cx}px ${imgRect.height * cy}px`;

    function moveLens(e) {
        e.preventDefault();
        const pos = getCursorPos(e);
        let x = pos.x - lensRect.width / 2;
        let y = pos.y - lensRect.height / 2;

        // Clamp within image
        const maxX = imgRect.width - lensRect.width;
        const maxY = imgRect.height - lensRect.height;
        if (x < 0) x = 0;
        if (y < 0) y = 0;
        if (x > maxX) x = maxX;
        if (y > maxY) y = maxY;

        // Position lens within wrap
        lens.style.left = `${x}px`;
        lens.style.top = `${y}px`;

        // Move background
        result.style.backgroundPosition = `-${x * cx}px -${y * cy}px`;
    }

    function getCursorPos(e) {
        const ev = e.touches ? e.touches[0] : e;
        const rect = img.getBoundingClientRect();
        const x = ev.clientX - rect.left;
        const y = ev.clientY - rect.top;
        return { x, y };
    }

    ['mousemove', 'touchmove'].forEach(evt => {
        wrap.addEventListener(evt, moveLens, { passive: false });
    });

    wrap.addEventListener('mouseleave', () => {
        lens.classList.add('hidden');
        result.classList.add('hidden');
    });
}

(function () {
    const originalImg = document.querySelector('#my-image');
    const galleryImgs = document.querySelectorAll('.image-list img');

    galleryImgs.forEach(thumb => {
        thumb.addEventListener('click', () => {
            originalImg.src = thumb.src;
            // Wait for image to render to get correct rect
            if (originalImg.complete) {
                imageZoom('my-image');
            } else {
                originalImg.onload = () => imageZoom('my-image');
            }
        });
    });

    // Initialize once on load
    if (originalImg) {
        if (originalImg.complete) imageZoom('my-image');
        else originalImg.onload = () => imageZoom('my-image');
    }
})();
