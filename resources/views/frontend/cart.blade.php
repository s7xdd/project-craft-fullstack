@extends('frontend.layouts.app')

@section('content')
    <x-frontend.common.page-title 
        title="Cart" 
        homeLink="index.html" />

    <x-frontend.cart.cart-section>
        <x-slot name="cartItems">
            <div class="table-outer mb_30">
                <table class="cart-table">
                    <thead class="cart-header">
                        <tr>
                            <th>product</th>
                            <th>price</th>
                            <th>quantity</th>
                            <th>total</th>
                            <th>&nbsp;</th>
                        </tr>
                    </thead>
                    <tbody>
                        <x-frontend.cart.cart-item
                            image="assets/images/shop/cart-1.png"
                            alt="Colored Pigment Set"
                            name="Colored Pigment Set"
                            link="shop-details.html"
                            price="INR 133"
                            quantity="2"
                            total="INR 266" />
                        
                        <x-frontend.cart.cart-item
                            image="assets/images/shop/cart-2.png"
                            alt="Colored Pigment Set"
                            name="Colored Pigment Set"
                            link="shop-details.html"
                            price="INR 167.98"
                            quantity="1"
                            total="INR 167.98" />
                        
                        <x-frontend.cart.cart-item
                            image="assets/images/shop/cart-3.png"
                            alt="Colored Pigment Set"
                            name="Colored Pigment Set"
                            link="shop-details.html"
                            price="INR 143"
                            quantity="1"
                            total="INR 143" />
                        
                        <x-frontend.cart.cart-item
                            image="assets/images/shop/cart-4.png"
                            alt="Colored Pigment Set"
                            name="Colored Pigment Set"
                            link="shop-details.html"
                            price="INR 150"
                            quantity="1"
                            total="INR 150" />
                    </tbody>
                </table>
            </div>
        </x-slot>
        
        <x-slot name="cartTotals">
            <x-frontend.cart.cart-totals>
                <x-slot name="slot">
                    <x-frontend.cart.total-item 
                        label="Subtotal" 
                        value="INR 726.98" />
                    <x-frontend.cart.total-item 
                        label="Shipping" 
                        value="INR 20.00" />
                    <x-frontend.cart.total-box 
                        label="Total" 
                        value="INR 746.98" />
                </x-slot>
                
                <x-slot name="coupon">
                    <x-frontend.cart.coupon placeholder="Apply Coupon" />
                </x-slot>
                
                <x-slot name="checkoutButton">
                    <x-frontend.cart.checkout-button 
                        link="checkout.html" 
                        text="Proceed to Checkout" />
                </x-slot>
            </x-frontend.cart.cart-totals>
        </x-slot>
    </x-frontend.cart.cart-section>

    <x-frontend.common.product-section title="You May Also <span>Like</span>" class="centred pb_90">
        <div class="inner-container clearfix">
            <x-frontend.common.product-card
                image="assets/images/product-2.webp"
                alt="Avengers Action Figure figurine Thano"
                category="Dress"
                name="Avengers Action Figure figurine Thano"
                originalPrice="₹899"
                price="$07.99"
                link="shop-details.html" />
            
            <x-frontend.common.product-card
                image="assets/images/product-3.webp"
                alt="Marvel Spider-Man Basic Superhero Action"
                category="Sticker"
                name="Marvel Spider-Man Basic Superhero Action"
                originalPrice="₹199"
                price="₹99"
                link="shop-details.html" />
            
            <x-frontend.common.product-card
                image="assets/images/product-2.webp"
                alt="Zoom Buddies Racers iron man sticker"
                category="Sticker"
                name="Zoom Buddies Racers iron man sticker"
                originalPrice="₹199"
                price="₹99"
                link="shop-details.html" />
            
            <x-frontend.common.product-card
                image="assets/images/product-3.webp"
                alt="Art Brush Collection"
                category="Book"
                name="Art Brush Collection"
                originalPrice="₹699"
                price="₹599"
                link="shop-details.html" />
            
            <x-frontend.common.product-card
                image="assets/images/product-2.webp"
                alt="Cute Soft Long Cat Plush Toys Stuffed"
                category="Dress"
                name="Cute Soft Long Cat Plush Toys Stuffed"
                originalPrice="₹1299"
                price="₹1199"
                link="shop-details.html" />
            
            <x-frontend.common.product-card
                image="assets/images/product-2.webp"
                alt="Sunny Ride on & Car for Kids with Music"
                category="Toy"
                name="Sunny Ride on & Car for Kids with Music"
                originalPrice="₹1299"
                price="₹1199"
                link="shop-details.html" />
        </div>
    </x-frontend.common.product-section>

    <x-frontend.common.whatsapp-subscribe
        title="Order With WhatsApp"
        buttonText="Order Now!"
        backgroundImage="assets/images/whatsapp-bg.jpg"
        whatsappLink="https://wa.me/1234567890?text=Hello,%20I%20would%20like%20to%20place%20an%20order!" />
@endsection