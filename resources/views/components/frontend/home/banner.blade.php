<section class="banner-section banner-style-two pb_30">
    <style>
        /* Extracted from banner.css */
        .banner-section{
          position: relative;
          padding: 70px 0px 115px 0px;
          overflow: hidden;
          background: linear-gradient(78.33deg, #FFCF78 5.9%, #FEE2B1 97.88%);
        }

        .banner-section .pattern-layer{
          position: absolute;
          left: 0px;
          bottom: -1px;
          width: 100%;
          height: 76px;
          background-size: cover;
          background-repeat: no-repeat;
          background-position: bottom center;
          z-index: 1;
        }

        .banner-section .image-box{
          position: relative;
          display: block;
        }

        .banner-section .image-box .image{
          position: relative;
          max-width: 556px;
          width: 100%;
          margin: 0 auto;
        }

        .banner-section .content-box{
          position: relative;
          display: block;
        }

        .banner-section .content-box h2{
          display: block;
          font-size: 72px;
          line-height: 76px;
          font-weight: 800;
          margin-bottom: 21px;
        }

        .banner-section .content-box h3{
          display: block;
          font-size: 32px;
          line-height: 40px;
          font-weight: 400;
          margin-bottom: 31px;
        }

        .banner-section .content-box h3 span{
          display: inline-block;
          font-weight: 800;
          color: #E92530;
        }

        .banner-section .anim-icon .anim-icon-1{
          position: absolute;
          left: 20px;
          bottom: 145px;
          width: 127px;
          height: 80px;
          z-index: 1;
        }

        .banner-section .anim-icon .anim-icon-2{
          position: absolute;
          left: 8px;
          bottom: 175px;
          width: 192px;
          height: 144px;
          background-repeat: no-repeat;
          opacity: 0.5;
        }

        .banner-section .anim-icon .anim-icon-3{
          position: absolute;
          left: 88px;
          top: 184px;
          width: 34px;
          height: 31px;
          background-repeat: no-repeat;
        }

        .banner-section .anim-icon .anim-icon-4{
          position: absolute;
          left: 46%;
          top: 255px;
          width: 34px;
          height: 31px;
          background-repeat: no-repeat;
        }

        .banner-section .anim-icon .anim-icon-5{
          position: absolute;
          top: 87px;
          right: 555px;
          width: 34px;
          height: 31px;
          background-repeat: no-repeat;
        }

        .banner-section .anim-icon .anim-icon-6{
          position: absolute;
          bottom: 170px;
          right: 520px;
          width: 34px;
          height: 31px;
          background-repeat: no-repeat;
        }

        .banner-section .anim-icon .anim-icon-7{
          position: absolute;
          left: 45%;
          top: 102px;
          width: 128px;
          height: 95px;
          background-repeat: no-repeat;
        }

        .banner-section .anim-icon .anim-icon-8{
          position: absolute;
          right: 95px;
          top: 120px;
          width: 168px;
          height: 119px;
          background-repeat: no-repeat;
        }

        .banner-section .anim-icon .anim-icon-9{
          position: absolute;
          top: 190px;
          right: 112px;
          width: 93px;
          height: 93px;
          background-repeat: no-repeat;
        }

        .banner-section .anim-icon .anim-icon-10{
          position: absolute;
          right: 233px;
          bottom: 209px;
          width: 68px;
          height: 79px;
          background-repeat: no-repeat;
        }

        .banner-section .anim-icon .anim-icon-11{
          position: absolute;
          right: -30px;
          bottom: -30px;
          width: 268px;
          height: 221px;
          background-repeat: no-repeat;
        }

        .banner-section .image-box .image img{
          width: 100%;
        }

        /** banner-style-two **/

        .banner-style-two{
          position: relative;
          padding: 0px;
          background: transparent;
        }

        .banner-style-two .banner-content{
          border-radius: 43px;
          overflow: hidden;
        }

        .banner-style-two .image-box .image{
          max-width: 519px;
        }

        .banner-style-two .lower-content{
          position: relative;
          width: 100%;
          background: #9AB3D8;
          padding: 18px 30px;
          z-index: 5;
        }

        .banner-style-two .lower-content:before,
        .banner-style-two .lower-content:after{
          position: absolute;
          content: '';
          background: #fff;
          width: 1px;
          height: 100%;
          top: 0px;
          opacity: 0.4;
        }

        .banner-style-two .lower-content:before{
          left: 33.333%;
        }

        .banner-style-two .lower-content:after{
          left: 66.666%;
        }

        .banner-style-two .lower-content .info-list{
          position: relative;
          display: flex;
          align-items: center;
          justify-content: space-around;
        }

        .banner-style-two .lower-content .info-list li{
          font-size: 20px;
          line-height: 30px;
          color: #fff;
          font-weight: 700;
        }

        .banner-style-two .slide-item{
          position: relative;
          padding: 60px 120px;
          min-height: 400px;
          display: flex;
          align-items: center;
        }

        .banner-style-two .slide-item .bg-color-1 {
            position: absolute;
            left: 0;
            top: 0;
            width: 60%;
            height: 100%;
            background: linear-gradient(to right, rgba(0, 0, 0, 0.85) 0%, rgba(0, 0, 0, 0) 100%);
            z-index: 1;
            /* Performance optimization */
            will-change: opacity;
            transform: translateZ(0);
            /* Accessibility */
            pointer-events: none;
        }

        .banner-style-two .slide-item .bg-color-2{
          position: absolute;
          left: 0px;
          top: 0px;
          width: 60%;
          height: 100%;
          background: #d8d8d86c;
          z-index: 1;
        }

        .banner-style-two .slide-item .bg-color-3{
          position: absolute;
          left: 0px;
          top: 0px;
          width: 60%;
          height: 100%;
          background: rgba(255, 175, 151, 0.9);
          z-index: 1;
        }

        /* Background images for each slide */
        .banner-style-two .slide-item:first-child{
          background-image: url('/assets/images/banner/banner-img-2.png');
          background-size: contain;
          background-repeat: no-repeat;
          background-position: right center;
        }

        .banner-style-two .slide-item:last-child{
          background-image: url('/assets/images/banner/banner-img-3.png');
          background-size: contain;
          background-repeat: no-repeat;
          background-position: right center;
        }

        .banner-carousel .content-box,
        .banner-carousel .image-box{
          position: relative;
          z-index: 5;
        }

        .banner-carousel .content-box h2{
          opacity: 0;
          -webkit-transform: translateY(50px);
          -moz-transform: translateY(50px);
          -ms-transform: translateY(50px);
          -o-transform: translateY(50px);
          transform: translateY(50px);
          -webkit-transition: all 1000ms ease;
          -moz-transition: all 1000ms ease;
          -ms-transition: all 1000ms ease;
          -o-transition: all 1000ms ease;
          transition: all 1000ms ease;
        }
          
        .banner-carousel .active .content-box h2{
          opacity: 1;
          -webkit-transform: translateY(0);
          -moz-transform: translateY(0);
          -ms-transform: translateY(0);
          -o-transform: translateY(0);
          transform: translateY(0);
          -webkit-transition-delay: 700ms;
          -moz-transition-delay: 700ms;
          -ms-transition-delay: 700ms;
          -o-transition-delay: 700ms;
          transition-delay: 700ms;
        }

        .banner-carousel .content-box h3{
          opacity: 0;
          -webkit-transform: translateY(50px);
          -moz-transform: translateY(50px);
          -ms-transform: translateY(50px);
          -o-transform: translateY(50px);
          transform: translateY(50px);
          -webkit-transition: all 1000ms ease;
          -moz-transition: all 1000ms ease;
          -ms-transition: all 1000ms ease;
          -o-transition: all 1000ms ease;
          transition: all 1000ms ease;
        }
          
        .banner-carousel .active .content-box h3{
          opacity: 1;
          -webkit-transform: translateY(0);
          -moz-transform: translateY(0);
          -ms-transform: translateY(0);
          -o-transform: translateY(0);
          transform: translateY(0);
          -webkit-transition-delay: 1000ms;
          -moz-transition-delay: 1000ms;
          -ms-transition-delay: 1000ms;
          -o-transition-delay: 1000ms;
          transition-delay: 1000ms;
        }

        .banner-carousel .content-box .btn-box{
          opacity: 0;
          -webkit-transform: translateY(50px);
          -moz-transform: translateY(50px);
          -ms-transform: translateY(50px);
          -o-transform: translateY(50px);
          transform: translateY(50px);
          -webkit-transition: all 1000ms ease;
          -moz-transition: all 1000ms ease;
          -ms-transition: all 1000ms ease;
          -o-transition: all 1000ms ease;
          transition: all 1000ms ease;
        }
          
        .banner-carousel .active .content-box .btn-box{
          opacity: 1;
          -webkit-transform: translateY(0);
          -moz-transform: translateY(0);
          -ms-transform: translateY(0);
          -o-transform: translateY(0);
          transform: translateY(0);
          -webkit-transition-delay: 1300ms;
          -moz-transition-delay: 1300ms;
          -ms-transition-delay: 1300ms;
          -o-transition-delay: 1300ms;
          transition-delay: 1300ms;
        }

        .banner-style-two .big-text{
          position: absolute;
          left: 0px;
          bottom: -66px;
          font-size: 280px;
          line-height: 200px;
          font-weight: 900;
          color: transparent;
          -webkit-text-stroke-width: 1px;
          -webkit-text-stroke-color: #fff;
          opacity: 0.5;
          width: 100%;
          text-align: center;
        }

        .banner-section .anim-icon{
          position: absolute;
          left: 0px;
          top: 0px;
          width: 100%;
          height: 100%;
        }

        .banner-section .anim-icon .anim-icon-12{
          position: absolute;
          top: -270px;
          right: -85px;
          width: 822px;
          height: 822px;
          background: #fff;
          opacity: 0.2;
          border-radius: 50%;
        }

        .banner-section .anim-icon .anim-icon-13{
          position: absolute;
          left: 280px;
          top: 38px;
          width: 137px;
          height: 103px;
          background-repeat: no-repeat;
        }

        .banner-section .anim-icon .anim-icon-14{
          position: absolute;
          left: 50%;
          top: 277px;
          width: 137px;
          height: 103px;
          background-repeat: no-repeat;
        }

        .banner-section .anim-icon .anim-icon-15{
          position: absolute;
          top: 203px;
          right: 47px;
          width: 137px;
          height: 103px;
          background-repeat: no-repeat;
        }

        .banner-section .anim-icon .anim-icon-16{
          position: absolute;
          left: 52px;
          top: 53px;
          width: 140px;
          height: 100px;
          background-repeat: no-repeat;
        }

        .banner-section .anim-icon .anim-icon-17{
          position: absolute;
          left: 511px;
          bottom: 113px;
          width: 96px;
          height: 93px;
          background-repeat: no-repeat;
        }

        .banner-section .anim-icon .anim-icon-18{
          position: absolute;
          left: 57%;
          top: 150px;
          width: 107px;
          height: 111px;
          background-repeat: no-repeat;
          z-index: 6;
        }

        .banner-section .anim-icon .anim-icon-19{
          position: absolute;
          top: 0px;
          right: 136px;
          width: 85px;
          height: 187px;
        }

        .banner-section .anim-icon .anim-icon-20{
          position: absolute;
          right: 50px;
          bottom: 160px;
          width: 117px;
          height: 105px;
          background-repeat: no-repeat;
        }

        /* From elpath.css */
        .pb_30 {
            padding-bottom: 30px;
        }
        .p_relative {
            position: relative;
        }
        /* From style.css */
        .large-container{
          max-width: 1800px;
          padding: 0px 15px;
          margin: 0 auto;
        }

        .owl-nav-none .owl-nav,
        .owl-dots-none .owl-dots{
          display: none !important;
        }

        /* From owl.css */
        .owl-carousel {
          display: none;
          width: 100%;
          -webkit-tap-highlight-color: transparent;
          /* position relative and z-index fix webkit rendering fonts issue */
          position: relative;
          z-index: 1;
        }
        .owl-carousel .owl-stage {
          position: relative;
          -ms-touch-action: pan-Y;
        }
        .owl-carousel .owl-stage:after {
          content: ".";
          display: block;
          clear: both;
          visibility: hidden;
          line-height: 0;
          height: 0;
        }
        .owl-carousel .owl-stage-outer {
          position: relative;
          overflow: hidden;
          /* fix for flashing background */
          -webkit-transform: translate3d(0px, 0px, 0px);
        }
        .owl-carousel .owl-controls .owl-nav .owl-prev,
        .owl-carousel .owl-controls .owl-nav .owl-next,
        .owl-carousel .owl-controls .owl-dot {
          cursor: pointer;
          cursor: hand;
          -webkit-user-select: none;
          -khtml-user-select: none;
          -moz-user-select: none;
          -ms-user-select: none;
          user-select: none;
        }
        .owl-carousel.owl-loaded {
          display: block;
        }
        .owl-carousel.owl-loading {
          opacity: 0;
          display: block;
        }
        .owl-carousel.owl-hidden {
          opacity: 0;
        }
        .owl-carousel .owl-refresh .owl-item {
          display: none;
        }
        .owl-carousel .owl-item {
          position: relative;
          min-height: 1px;
          padding: 10px;
          float: left;
          -webkit-backface-visibility: hidden;
          -webkit-tap-highlight-color: transparent;
          -webkit-touch-callout: none;
          -webkit-user-select: none;
          -moz-user-select: none;
          -ms-user-select: none;
          user-select: none;
        }
        .owl-carousel .owl-item img {
          display: block;
          width: none;
          -webkit-transform-style: preserve-3d;
        }
        .owl-carousel.owl-text-select-on .owl-item {
          -webkit-user-select: auto;
          -moz-user-select: auto;
          -ms-user-select: auto;
          user-select: auto;
        }
        .owl-carousel .owl-grab {
          cursor: move;
          cursor: -webkit-grab;
          cursor: -o-grab;
          cursor: -ms-grab;
          cursor: grab;
        }
        .owl-carousel.owl-rtl {
          direction: rtl;
        }
        .owl-carousel.owl-rtl .owl-item {
          float: right;
        }

        /* No Js */
        .no-js .owl-carousel {
          display: block;
        }

        .owl-carousel .owl-item .owl-lazy {
          opacity: 0;
          -webkit-transition: opacity 400ms ease;
          -moz-transition: opacity 400ms ease;
          -ms-transition: opacity 400ms ease;
          -o-transition: opacity 400ms ease;
          transition: opacity 400ms ease;
        }
        .owl-carousel .owl-item img {
          transform-style: preserve-3d;
        }

        .owl-carousel .owl-video-wrapper {
          position: relative;
          height: 100%;
          background: #000;
        }
        .owl-carousel .owl-video-play-icon {
          position: absolute;
          height: 80px;
          width: 80px;
          left: 50%;
          top: 50%;
          margin-left: -40px;
          margin-top: -40px;
          background: url("owl.video.play.png") no-repeat;
          cursor: pointer;
          z-index: 1;
          -webkit-backface-visibility: hidden;
          -webkit-transition: scale 100ms ease;
          -moz-transition: scale 100ms ease;
          -ms-transition: scale 100ms ease;
          -o-transition: scale 100ms ease;
          transition: scale 100ms ease;
        }
        .owl-carousel .owl-video-play-icon:hover {
          -webkit-transition: scale(1.3, 1.3);
          -moz-transition: scale(1.3, 1.3);
          -ms-transition: scale(1.3, 1.3);
          -o-transition: scale(1.3, 1.3);
          transition: scale(1.3, 1.3);
        }
        .owl-carousel .owl-video-playing .owl-video-tn,
        .owl-carousel .owl-video-playing .owl-video-play-icon {
          display: none;
        }
        .owl-carousel .owl-video-tn {
          opacity: 0;
          height: 100%;
          background-position: center center;
          background-repeat: no-repeat;
          -webkit-background-size: contain;
          -moz-background-size: contain;
          -o-background-size: contain;
          background-size: contain;
          -webkit-transition: opacity 400ms ease;
          -moz-transition: opacity 400ms ease;
          -ms-transition: opacity 400ms ease;
          -o-transition: opacity 400ms ease;
          transition: opacity 400ms ease;
        }
        .owl-carousel .owl-video-frame {
          position: relative;
          z-index: 1;
        }

        .owl-theme .owl-controls {
    	  display:block;
        }
        .owl-theme .owl-controls .owl-nav [class*="owl-"] {
          position: relative;
          cursor: pointer;
          display: inline-block;
          color: #898f9f;
          margin: 0px 10px;
          transition: all 500ms ease;
        }
        .owl-theme .owl-controls .owl-nav [class*="owl-"] span:before{
          margin: 0px;
          font-size: 25px;
        }
        .owl-theme .owl-controls .owl-nav [class*="owl-"]:hover{
          color: #f2be00;
        }
        .owl-theme .owl-controls .owl-nav .disabled {
          cursor: default;
          opacity: 0.5;
        }
        .owl-theme .owl-dots .owl-dot {
            display: inline-block;
        }
        .owl-theme .owl-dots .owl-dot span {
          background: #222;
          display: block;
          margin: 0px 5px 0px 5px;
          transition: opacity 200ms ease 0s;
          width: 15px;
          height: 15px;
        }
        .owl-theme .owl-dots .owl-dot.active span {
          background: none repeat scroll 0 0 #cda274;
        }

        /* responsive-css */

        @media only screen and (max-width: 1200px){
          .banner-style-two .slide-item{
            padding-left: 60px;
            padding-right: 60px;
          }

          .banner-section.style-five .image-layer{
            display: none;
          }
        }

        @media only screen and (max-width: 991px){
          .banner-section .anim-icon{
            display: none;
          }
          .banner-section .image-box{
            margin-bottom: 30px;
          }

          .banner-carousel .content-box{
            margin-bottom: 30px;
          }

          .banner-style-two .lower-content .info-list{
            display: block;
            text-align: center;
          }

          .banner-style-two .lower-content:before, 
          .banner-style-two .lower-content:after{
            display: none;
          }

          .banner-section br{
            display: none;
          }

          .banner-style-two .slide-item:first-child,
          .banner-style-two .slide-item:last-child{
            background-position: center top;
            background-size: cover;
          }

          .banner-style-two .slide-item .bg-color-1 {
            width: 100%;
            background: linear-gradient(to right, rgba(0, 0, 0, 0.9) 0%, rgba(0, 0, 0, 0.3) 70%, rgba(0, 0, 0, 0) 100%);
          }

          .banner-style-two .slide-item .bg-color-2 {
            width: 100%;
            background: linear-gradient(to right, rgba(190, 239, 255, 0.8) 0%, rgba(190, 239, 255, 0.4) 70%, rgba(190, 239, 255, 0) 100%);
          }

          .banner-style-two .slide-item .bg-color-3 {
            width: 100%;
            background: linear-gradient(to right, rgba(255, 175, 151, 0.9) 0%, rgba(255, 175, 151, 0.4) 70%, rgba(255, 175, 151, 0) 100%);
          }
        }

        @media only screen and (max-width: 767px){
          .banner-section .content-box h2{
            font-size: 50px;
            line-height: 60px;
          }

          .banner-style-two .slide-item{
            padding-left: 30px;
            padding-right: 30px;
          }

          .banner-style-four .content-box-one h2{
            font-size: 40px;
            line-height: 50px;
          }

          .banner-section.style-five{
            padding: 110px 0px 150px 0px;
          }

          .banner-style-two .slide-item:first-child,
          .banner-style-two .slide-item:last-child{
            background-size: contain;
            background-position: center bottom;
          }

          /* Enhanced mobile gradient for better text readability */
          .banner-style-two .slide-item .bg-color-1 {
            background: linear-gradient(to right, rgba(0, 0, 0, 0.95) 0%, rgba(0, 0, 0, 0.5) 60%, rgba(0, 0, 0, 0) 100%);
          }
        }

        @media only screen and (max-width: 599px){
          .banner-style-four .content-box-one .image-1,
          .banner-style-four .content-box-one .image-2{
            display: none;
          }

          .banner-style-four .content-box-one{
            padding-bottom: 40px;
          }
        }

        @media only screen and (max-width: 499px){
          .banner-style-two .slide-item,
          .banner-style-four .content-box-one,
          .banner-style-four .content-box-two{
            padding-left: 15px;
            padding-right: 15px;
          }

          .banner-style-three .content-inner{
            width: 100%;
            height: auto;
          }

          .banner-style-three .content-inner .shape{
            display: none;
          }

          .banner-style-three .content-inner h2{
            font-size: 60px;
            line-height: 70px;
          }

          .banner-style-four .content-box-two .image-box{
            width: 50%;
          }
        }
    </style>
    <div class="large-container">
        <div class="banner-content p_relative">
            <div class="inner-container p_relative">
                <div class="banner-carousel owl-theme owl-carousel owl-nav-none owl-dots-none">
                    {{ $slot }}
                </div>
            </div>
        </div>
    </div>
    <script src="/assets/js/owl.js"></script>
    <script>
        $(document).ready(function() {
            if ($('.banner-carousel').length) {
                $('.banner-carousel').owlCarousel({
                    loop: true,
                    margin: 0,
                    nav: true,
                    animateOut: 'fadeOut',
                    animateIn: 'fadeIn',
                    active: true,
                    smartSpeed: 1000,
                    autoplay: 6000,
                    navText: ['<span class="icon-10"></span>', '<span class="icon-11"></span>'],
                    responsive: {
                        0: { items: 1 },
                        600: { items: 1 },
                        800: { items: 1 },
                        1024: { items: 1 }
                    }
                });
            }
        });
    </script>
</section>
<!-- banner-section end -->