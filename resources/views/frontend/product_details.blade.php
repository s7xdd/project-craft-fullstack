@extends('frontend.layouts.app')

@section('content')
    <x-frontend.product-detail.product-gallery>
        <x-slot name="productDetails">
            <x-frontend.product-detail.product-details category="Resins" title="Premium Clear Epoxy Resin Kit" price="INR 899"
                originalPrice="INR 999">

                <x-slot name="description">
                    <p>
                        This premium clear epoxy resin kit is perfect for creating beautiful
                        jewelry, coasters, and art pieces. The high-quality resin cures to a
                        crystal-clear finish that highlights your creative designs beautifully.
                    </p>
                    <p>
                        This comprehensive kit includes everything you need to get started with
                        resin crafting. Perfect for beginners and experienced crafters alike.
                    </p>
                </x-slot>

                <x-slot name="details">
                    <li><strong>Brand :</strong>Grostore</li>
                    <li><strong>Product SKU :</strong>#RESIN001</li>
                    <li><strong>Category :</strong>Epoxy Resins</li>
                    <li>
                        <strong>Availability :</strong>
                        <span class="product-stock">
                            <img src="assets/images/icons/icon-13.png" alt="" /> In Stock
                        </span>
                    </li>
                </x-slot>

                <x-slot name="colorOptions">
                    <x-frontend.product-detail.color-options>
                        <x-frontend.product-detail.color-item id="color1" name="same" checked="checked" />
                        <x-frontend.product-detail.color-item id="color2" name="same" />
                        <x-frontend.product-detail.color-item id="color3" name="same" />
                        <x-frontend.product-detail.color-item id="color4" name="same" />
                    </x-frontend.product-detail.color-options>
                </x-slot>

                <x-slot name="cartOptions">
                    <x-frontend.product-detail.add-to-cart quantity="1" returnLink="shop-details.html" />
                </x-slot>

                <x-slot name="tags">
                    <li>
                        <strong>Tag :</strong>
                        <a href="blog-details.html">Best sellers</a>,
                        <a href="blog-details.html">New Arrivals</a>,
                        <a href="blog-details.html">On Sale</a>
                    </li>
                </x-slot>

                <x-slot name="socialLinks">
                    <li class="social-links">
                        <strong>Share :</strong>
                        <a href="shop-details.html"><i class="icon-14"></i></a>
                        <a href="shop-details.html"><i class="icon-15"></i></a>
                        <a href="shop-details.html"><i class="icon-16"></i></a>
                    </li>
                </x-slot>
            </x-frontend.product-detail.product-details>
        </x-slot>

        <x-slot name="productDescription">
            <x-frontend.product-detail.product-description>
                <x-slot name="tabs">
                    <x-frontend.product-detail.tab-button class="active-btn" tabId="tab-1" title="Description" />
                </x-slot>


                <x-frontend.product-detail.description-content>
                    <p>
                        Our premium epoxy resin kit includes high-quality,
                        crystal-clear resin that cures to a durable, glossy finish.
                        Perfect for creating beautiful resin art, jewelry, coasters,
                        and various craft projects with professional results.
                    </p>
                    <p>
                        This comprehensive kit includes resin, hardener, mixing cups,
                        stirring sticks, and detailed instructions. The resin has excellent
                        UV resistance and won't yellow over time. Ideal for both beginners
                        and experienced crafters looking to create stunning pieces.
                    </p>
                    <h4>Features :</h4>
                    <ul class="list-style-one clearfix">
                        <li>Crystal-clear finish with high gloss</li>
                        <li>UV-resistant formula prevents yellowing</li>
                        <li>Includes complete mixing and measuring tools</li>
                        <li>Suitable for various craft applications</li>
                        <li>Detailed instructions for perfect results</li>
                        <li>Professional quality for stunning artwork</li>
                    </ul>
                </x-frontend.product-detail.description-content>

            </x-frontend.product-detail.product-description>
        </x-slot>

        <x-frontend.product-detail.product-slider-item image="assets/images/product-1.webp" alt="Product Image">
            <x-slot name="thumbnails">
                <x-frontend.product-detail.thumbnail-item class="active" index="0" image="assets/images/product-5.webp"
                    alt="Thumbnail 1" />
                <x-frontend.product-detail.thumbnail-item index="1" image="assets/images/product-5.webp"
                    alt="Thumbnail 2" />
                <x-frontend.product-detail.thumbnail-item index="2" image="assets/images/product-5.webp"
                    alt="Thumbnail 3" />
                <x-frontend.product-detail.thumbnail-item index="3" image="assets/images/product-5.webp"
                    alt="Thumbnail 4" />
            </x-slot>
        </x-frontend.product-detail.product-slider-item>

    </x-frontend.product-detail.product-gallery>

    <x-frontend.common.product-section title="Related Products" class="pt_40 pb_90">
        <div class="p-tab active-tab" id="tab-1">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Secret of the Enchanted Forest Path" category="History"
                    name="The Secret of the Enchanted Forest Path" originalPrice="$08.99" price="$07.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-2.webp"
                    alt="The Magical Adventure of the Lost Unicorn" category="Comic"
                    name="The Magical Adventure of the Lost Unicorn" originalPrice="$04.99" price="$03.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-3.webp"
                    alt="Oliver and the Quest for the Golden Key" category="School"
                    name="Oliver and the Quest for the Golden Key" originalPrice="$02.99" price="$01.99"
                    link="shop-details.html" />
            </div>
        </div>

        <div class="p-tab" id="tab-2">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Secret of the Enchanted Forest Path" category="History"
                    name="The Secret of the Enchanted Forest Path" originalPrice="$08.99" price="$07.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Magical Adventure of the Lost Unicorn" category="Comic"
                    name="The Magical Adventure of the Lost Unicorn" originalPrice="$04.99" price="$03.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Oliver and the Quest for the Golden Key" category="School"
                    name="Oliver and the Quest for the Golden Key" originalPrice="$02.99" price="$01.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp" alt="The Mystery of the Moonlight"
                    category="Comic" name="The Mystery of the Moonlight" originalPrice="$07.99" price="$06.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Luna and the Hidden Treasure Map" category="Science" name="Luna and the Hidden Treasure Map"
                    originalPrice="$12.99" price="$10.99" link="shop-details.html" />
            </div>
        </div>

        <div class="p-tab" id="tab-3">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Secret of the Enchanted Forest Path" category="History"
                    name="The Secret of the Enchanted Forest Path" originalPrice="$08.99" price="$07.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Magical Adventure of the Lost Unicorn" category="Comic"
                    name="The Magical Adventure of the Lost Unicorn" originalPrice="$04.99" price="$03.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Oliver and the Quest for the Golden Key" category="School"
                    name="Oliver and the Quest for the Golden Key" originalPrice="$02.99" price="$01.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp" alt="The Mystery of the Moonlight"
                    category="Comic" name="The Mystery of the Moonlight" originalPrice="$07.99" price="$06.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Luna and the Hidden Treasure Map" category="Science" name="Luna and the Hidden Treasure Map"
                    originalPrice="$12.99" price="$10.99" link="shop-details.html" />
            </div>
        </div>

        <div class="p-tab" id="tab-4">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Secret of the Enchanted Forest Path" category="History"
                    name="The Secret of the Enchanted Forest Path" originalPrice="$08.99" price="$07.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Magical Adventure of the Lost Unicorn" category="Comic"
                    name="The Magical Adventure of the Lost Unicorn" originalPrice="$04.99" price="$03.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Oliver and the Quest for the Golden Key" category="School"
                    name="Oliver and the Quest for the Golden Key" originalPrice="$02.99" price="$01.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp" alt="The Mystery of the Moonlight"
                    category="Comic" name="The Mystery of the Moonlight" originalPrice="$07.99" price="$06.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Luna and the Hidden Treasure Map" category="Science" name="Luna and the Hidden Treasure Map"
                    originalPrice="$12.99" price="$10.99" link="shop-details.html" />
            </div>
        </div>

        <div class="p-tab" id="tab-5">
            <div class="five-item-carousel owl-carousel owl-theme owl-dots-none nav-style-one">
                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Secret of the Enchanted Forest Path" category="History"
                    name="The Secret of the Enchanted Forest Path" originalPrice="$08.99" price="$07.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="The Magical Adventure of the Lost Unicorn" category="Comic"
                    name="The Magical Adventure of the Lost Unicorn" originalPrice="$04.99" price="$03.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Oliver and the Quest for the Golden Key" category="School"
                    name="Oliver and the Quest for the Golden Key" originalPrice="$02.99" price="$01.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp" alt="The Mystery of the Moonlight"
                    category="Comic" name="The Mystery of the Moonlight" originalPrice="$07.99" price="$06.99"
                    link="shop-details.html" />

                <x-frontend.common.product-card image="assets/images/product-1.webp"
                    alt="Luna and the Hidden Treasure Map" category="Science" name="Luna and the Hidden Treasure Map"
                    originalPrice="$12.99" price="$10.99" link="shop-details.html" />
            </div>
        </div>
    </x-frontend.common.product-section>

    <x-frontend.common.whatsapp-subscribe title="Order With WhatsApp" buttonText="Order Now!"
        backgroundImage="assets/images/whatsapp-bg.jpg"
        whatsappLink="https://wa.me/1234567890?text=Hello,%20I%20would%20like%20to%20place%20an%20order!" />
@endsection
