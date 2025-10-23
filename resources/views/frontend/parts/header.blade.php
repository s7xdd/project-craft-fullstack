<style>


/** header-top **/


<style>


/** header-top **/
 
.header-top{
  position: relative;
  width: 100%;
  padding: 6px 0px;
}

.header-top .top-inner{
  position: relative;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.header-top .top-inner .info-list{
  position: relative;
  display: flex;
  align-items: center;
  gap: 30px;
}

.header-top .top-inner .info-list li{
  position: relative;
  display: flex;
  align-items: center;
  gap: 6px;
  font-size: 14px;
  line-height: 20px;
  color: #fff;
}

.header-top .top-inner .info-list li.chat-toggler{
  cursor: pointer;
}

.header-top .top-inner .info-list li i{
  font-size: 16px;
}

.header-top .top-inner .text p{
  font-size: 14px;
  color: #fff;
}

.header-top .top-inner .text p span{
  font-weight: 700;
}

.header-top .top-inner .right-column{
  position: relative;
  display: flex;
  align-items: center;
  gap: 30px;
}

.header-top .top-inner .nice-select{
  font-size: 14px;
  color: #fff;
  text-transform: uppercase;
  padding-right: 15px;
}

.header-top .top-inner .nice-select:before{
  font-size: 7px;
}

.main-header .currency-box{
  position: relative;
  padding-left: 25px;
}

.main-header .currency-box .icon-box{
  position: absolute;
  left: 0px;
  top: 4px;
  width: 20px;
  height: 20px;
  border-radius: 50%;
}

.main-header .currency-box .icon-box img{
  width: 100%;
  border-radius: 50%;
}

.main-header .outer-box{
  position: relative;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.main-header .outer-box .support-box{
  position: relative;
  display: flex;
  align-items: center;
  gap: 12px;
}

.main-header .outer-box .support-box .icon-box{
  position: relative;
  display: inline-block;
  font-size: 36px;
  line-height: 40px;
}

.main-header .outer-box .support-box h3{
  display: block;
  font-size: 24px;
  line-height: 24px;
  font-weight: 800;
}

.main-header .outer-box .support-box h3 a{
  display: inline-block;
  color: var(--title-color);
}

.main-header .outer-box .support-box h3 a:hover{

}

.main-header .outer-box .support-box span{
  position: relative;
  display: block;
  font-size: 14px;
  line-height: 20px;
}

.main-header .menu-right-content{
  position: relative;
  display: flex;
  align-items: center;
  gap: 30px;
  padding: 15px 0px;
}

.main-header .logo-box{
  position: relative;
}

.main-header .search-box{
  position: relative;
  width: 300px;
}

.main-header .search-box .form-group{
  position: relative;
  margin-bottom: 0px;
}

.main-header .search-box .form-group input[type="search"]{
  position: relative;
  display: block;
  width: 100%;
  height: 50px;
  background: #F8EDF0;
  border: dashed;
  border-width: 1px;
  border-radius: 50px;
  font-size: 15px;
  color: var(--text-color);
  padding: 10px 60px 10px 20px;
}

.main-header .search-box .form-group button[type='submit']{
  position: absolute;
  top: 5px;
  right: 5px;
  display: inline-block;
  width: 40px;
  height: 40px;
  line-height: 42px;
  font-size: 16px;
  color: #fff;
  text-align: center;
  border-radius: 50%;
}

.main-header .option-list{
  position: relative;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 20px;
}

.main-header .option-list li{
  position: relative;
  display: inline-block;
  font-size: 20px;
}

.main-header .option-list li button,
.main-header .option-list li a{
  display: inline-block;
  color: var(--text-color);
  transition: all 500ms ease;
}

.main-header .option-list li button:hover,
.main-header .option-list li a:hover{

}

.main-header .option-list li.shop-cart button{
  padding-right: 13px;
  padding-top: 5px;
}

.main-header .option-list li.shop-cart button span{
  position: absolute;
  display: inline-block;
  top: 0px;
  right: 0px;
  width: 19px;
  height: 19px;
  line-height: 19px;
  text-align: center;
  font-size: 12px;
  color: #fff;
  font-weight: 700;
  border-radius: 50%;
}

.main-header .header-lower .shape{
  position: absolute;
  left: 0px;
  bottom: -10px;
  width: 100%;
  height: 11px;
  background-repeat: repeat-x;
}


/** main-menu **/

.main-menu{
  float: left;
}

.main-menu .navbar-collapse{
  padding:0px;
  display:block !important;
}

.main-menu .navigation{
  margin:0px;
}

@media (min-width: 768px) {
    .navigation {
        display: flex;
        align-items: center;
    }
    .navigation li {
        display: inline-block;
        margin: 0 12px;
    }
}

.main-menu .navigation > li{
  position:inherit;
  float:left;
  z-index:2;
  margin: 0px 19px;
  -webkit-transition:all 300ms ease;
  -moz-transition:all 300ms ease;
  -ms-transition:all 300ms ease;
  -o-transition:all 300ms ease;
  transition:all 300ms ease;
}

.main-menu .navigation > li:last-child{
  margin-right:0px !important;
}

.main-menu .navigation > li:first-child{
  margin-left: 0px !important;
}

.main-menu .navigation > li > a{
  position:relative;
  display:block;
  text-align:center;
  font-size:16px;
  line-height:26px;
  padding-top: 29.5px;
  padding-bottom: 29.5px;
  font-weight:500;
  font-family: var(--text-font);
  opacity:1;
  color: var(--title-color);
  z-index:1;
  -webkit-transition:all 500ms ease;
  -moz-transition:all 500ms ease;
  -ms-transition:all 500ms ease;
  -o-transition:all 500ms ease;
  transition:all 500ms ease;
}

.main-menu .navigation > li.dropdown > a{
   padding-right: 17px;
}

/* Menu item arrows */
.main-menu .navigation > li > a .menu-arrow {
    margin-left: 5px;
    font-size: 12px;
    transition: transform 0.3s ease;
    display: inline-block;
    opacity: 0.7;
}

.main-menu .navigation > li:hover > a .menu-arrow {
    transform: rotate(180deg);
    opacity: 1;
}

.main-menu .navigation > li.current > a,
.main-menu .navigation > li:hover > a{

}

.main-menu .navigation > li.dropdown > a:before{
  position: absolute;
  content: "";
  font-family: 'Font Awesome 5 Pro';
  top: 29px;
  right: 0px;
  font-weight: 500;
  transition: all 500ms ease;
}

.main-menu .navigation > li > a:after{
  position: absolute;
  content: '';
  width: 100%;
  height: 2px;
  left: 0px;
  bottom: 0px;
  transform: scale(0,0);
  transition: all 500ms ease;
}

.main-menu .navigation > li:hover > a:after{
  transform: scale(1,1);
}

.main-menu .navigation > li > ul,
.main-menu .navigation > li > .megamenu{
  position:absolute;
  left: inherit;
  top:100%;
  width:230px;
  padding: 15px;
  z-index:100;
  display:none;
  background: #fff;
  opacity: 0;
  transform: scaleY(0);
  transform-origin: top center;
  border-bottom: solid;
  border-width: 3px;
  visibility: hidden;
  box-shadow: 0 12px 12px rgba(0, 80, 191, 3%);
  border-radius: 0 0 6px 6px;
  transition: all .21s cubic-bezier(.3,.02,0,.6);
}

.main-menu .navigation > li > ul.from-right{
  left:auto;
  right:0px;
}

.main-menu .navigation > li > ul > li{
  position:relative;
  width:100%;
}

.main-menu .navigation > li > ul > li > a,
.main-menu .navigation > li > .megamenu li > a{
  position:relative;
  display:block;
  padding: 10px 16px;
  line-height:24px;
  font-weight:500;
  font-size:15px;
  text-transform:capitalize;
  font-family: var(--text-font);
  color:#555;
  text-align: left;
  transition:all 0.3s ease;
  border-radius: 8px;
  margin-bottom: 8px;
}

.main-menu .navigation > li > ul > li > a:before,
.main-menu .navigation > li > .megamenu li > a:before{
  display: block;
  position: absolute;
  content: "";
  width: 100%;
  height: 0%;
  top: auto;
  left: 0%;
  bottom: 0%;
  z-index: -1;
  opacity: 0;
  visibility: hidden;
  transition: all .4s ease-in-out;
  border-radius: 5px;
}

.main-menu .navigation > li > ul > li > a:hover:before,
.main-menu .navigation > li > .megamenu li > a:hover:before{
  top: 0;
  height: 100%;
  opacity: 1;
  visibility: visible;
}

.main-menu .navigation > li > .megamenu h4{
  display: block;
  font-size: 20px;
  line-height: 30px;
  color: #ffffff;
}

.main-menu .navigation > li > ul > li > a:hover,
.main-menu .navigation > li > .megamenu li > a:hover{
  color: #007bff;
  background: rgba(0, 123, 255, 0.1);
  transform: translateX(4px);
}

.main-menu .navigation > li > ul > li:last-child > a,
.main-menu .navigation > li > .megamenu li:last-child > a{
  border-bottom: none;
}

.main-menu .navigation > li > ul > li.dropdown > a:after{
  font-family: 'Font Awesome 5 Pro';
  content: "\f105";
  position:absolute;
  right:20px;
  top:10px;
  display:block;
  line-height:24px;
  font-size:16px;
  font-weight:800;
  text-align:center;
  z-index:5;
}

.main-menu .navigation > li > ul > li > ul{
  position:absolute;
  left:100%;
  top:0%;
  margin-top: 15px;
  background: var(--secondary-color);
  border-top: solid;
  border-width: 2px;
  width:230px;
  z-index:100;
  display:none;
  border-radius: 0px;
  transition:all 500ms ease;
  -moz-transition:all 500ms ease;
  -webkit-transition:all 500ms ease;
  -ms-transition:all 500ms ease;
  -o-transition:all 500ms ease;
}

.main-menu .navigation > li > ul > li > ul.from-right{
  left:auto;
  right:0px;
}

.main-menu .navigation > li > ul > li > ul > li{
  position:relative;
  width:100%;
}

.main-menu .navigation > li > ul > li > ul > li:last-child{
  border-bottom:none;
}

.main-menu .navigation > li > ul > li > ul > li > a{
  position:relative;
  display:block;
  padding:10px 25px;
  line-height:24px;
  font-weight:500;
  font-size:15px;
  text-transform:capitalize;
  font-family: var(--text-font);
  color:#fff;
  border-bottom: 1px solid rgba(255,255,255,0.1);
  text-align: left;
  transition:all 500ms ease;
  -moz-transition:all 500ms ease;
  -webkit-transition:all 500ms ease;
  -ms-transition:all 500ms ease;
  -o-transition:all 500ms ease;
}

.main-menu .navigation > li > ul > li > ul > li:last-child > a{
  border-bottom: none;
}

.main-menu .navigation > li > ul > li > ul > li > a:hover{
  padding-left: 35px;
}

.main-menu .navigation > li > ul > li > ul > li.dropdown > a:after{
  font-family: 'Font Awesome 5 Pro';
  content: "\f105";
  position:absolute;
  right:20px;
  top:12px;
  display:block;
  line-height:24px;
  font-size:16px;
  font-weight:900;
  z-index:5;
}

.main-menu .navigation > li.dropdown:hover > ul{
  visibility:visible;
  opacity:1;
  transform: scaleY(1);
  top: 100%;
}

.main-menu .navigation > li.dropdown:hover > .megamenu{
  visibility:visible;
  opacity:1;
  transform: translateX(-50%) translateY(0);
  top: 100%;
}

.main-menu .navigation li > ul > li.dropdown:hover > ul{
  visibility:visible;
  opacity:1;
  top: 0%;
  margin-top: 0px;
}

.main-menu .navigation li.dropdown .dropdown-btn{
  position:absolute;
  right:-32px;
  top:66px;
  width:34px;
  height:30px;
  text-align:center;
  font-size:18px;
  line-height:26px;
  color:#3b3b3b;
  cursor:pointer;
  display: none;
  z-index:5;
  transition: all 500ms ease;
}

.main-menu .navigation li.current.dropdown .dropdown-btn,
.main-menu .navigation li:hover .dropdown-btn{

}

.main-menu .navigation li.dropdown ul li.dropdown .dropdown-btn{
  display: none;
}

.menu-area .mobile-nav-toggler {
  position: relative;
  float: right;
  font-size: 30px;
  line-height: 40px;
  cursor: pointer;
  background: var(--theme-color);
  display: none;
}

.mobile-menu .nav-logo img{
  max-width: 160px;
}

.menu-area .mobile-nav-toggler .icon-bar{
  position: relative;
  height: 2px;
  width: 24px;
  display: block;
  margin-bottom: 5px;
  background-color: #fff;
  -webkit-transition: all 300ms ease;
  -moz-transition: all 300ms ease;
  -ms-transition:all 300ms ease;
  -o-transition:all 300ms ease;
  transition:all 300ms ease;
}

.menu-area .mobile-nav-toggler .icon-bar:last-child{
  margin-bottom: 0px;
}


/** megamenu-style **/

.main-menu .navigation > li.dropdown > .megamenu{
  position: absolute;
  width: fit-content;
  max-width: min(600px, 50vw);
  padding: 30px;
  left: 50%;
  transform: translateX(-50%);
  border: none;
  border-radius: 16px;
  background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
  backdrop-filter: blur(20px);
  box-shadow: 0 20px 40px rgba(0, 0, 0, 0.15);
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
  gap: 24px;
  opacity: 0;
  transform: translateX(-50%) translateY(-10px);
  transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
  z-index: 1000;
}

.main-menu .navigation li.dropdown .megamenu li h5{
  font-size: 18px;
  line-height: 28px;
  margin-bottom: 15px;
  padding-left: 16px;
}

.main-menu .navigation > li.dropdown > .megamenu .advice-box img {
  width: 100%;
  height: 100%;
  object-fit: cover;   /* keeps aspect ratio, crops overflow */
}

.main-menu .navigation > li.dropdown > .megamenu .advice-box{
  display: none;
}

.main-menu .navigation > li.dropdown > .megamenu .advice-box .text{
  position: relative;
  display: block;
  font-size: 14px;
  line-height: 20px;
  color: #fff;
  margin-bottom: 12px;
}

.main-menu .navigation > li.dropdown > .megamenu .advice-box h3{
  display: block;
  font-size: 28px;
  line-height: 30px;
  color: #fff;
  margin-bottom: 10px;
}

.main-menu .navigation > li.dropdown > .megamenu .advice-box h4{
  display: block;
  font-size: 20px;
  line-height: 24px;
  color: #fff;
  font-weight: 800;
  margin-bottom: 110px;
}

.main-menu .navigation > li.dropdown > .megamenu .advice-box h4 span{
  position: relative;
  display: inline-block;
  font-weight: 400;
}

.main-menu .navigation > li.dropdown > .megamenu .advice-box .theme-btn{
  padding: 3px 22px;
}

.main-menu .navigation > li > .megamenu li{
  background: rgba(255, 255, 255, 0.8);
  border-radius: 12px;
  padding: 20px;
  transition: all 0.3s ease;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.main-menu .navigation > li > .megamenu li:hover{
  transform: translateY(-4px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.15);
  background: rgba(255, 255, 255, 0.9);
}

.main-menu .navigation > li > .megamenu h4{
  font-size: 20px;
  line-height: 30px;
  color: #333;
  font-weight: 600;
  margin-bottom: 15px;
}

.megamenu-column {
  display: flex;
  flex-direction: column;
}

.megamenu-mobile-hidden {
  display: none;
}

.submenu-mobile-hidden {
  display: none;
}


/** mobile-menu **/

.nav-outer .mobile-nav-toggler{
  position: relative;
  float: right;
  font-size: 40px;
  line-height: 50px;
  cursor: pointer;
  color:#3786ff;
  display: none;
}

.mobile-menu{
  position: fixed;
  right: 0;
  top: 0;
  width: 300px;
  padding-right:30px;
  max-width:100%;
  height: 100%;
  opacity: 0;
  visibility: hidden;
  z-index: 999999;
  transition: all 900ms ease;
}

.mobile-menu .navbar-collapse{
  display:block !important;
}

.mobile-menu .nav-logo{
  position:relative;
  padding:50px 25px;
  text-align:left;
  padding-bottom: 100px;
}

.mobile-menu-visible{
  overflow: hidden;
}

.mobile-menu-visible .mobile-menu{
  opacity: 1;
  visibility: visible;
}

.mobile-menu .menu-backdrop{
  position: fixed;
  left: 0%;
  top: 0;
  width: 100%;
  height: 100%;
  z-index: 1;
  transition: all 900ms ease;
  background-color: #000;
}

.mobile-menu-visible .mobile-menu .menu-backdrop{
  opacity: 0.70;
  visibility: visible;
  left: 100%;
  -webkit-transition: all .8s ease-out 0s;
  -o-transition: all .8s ease-out 0s
}

.mobile-menu .menu-box{
  position: absolute;
  left: 0px;
  top: 0px;
  width: 100%;
  height: 100%;
  max-height: 100%;
  overflow-y: auto;
  background: #141417;
  padding: 0px 0px;
  z-index: 5;
  opacity: 0;
  visibility: hidden;
  border-radius: 0px;
  -webkit-transform: translateX(100%);
  -ms-transform: translateX(100%);
  transform: translateX(-100%);
  transition: all 900ms ease !important;
}

.mobile-menu-visible .mobile-menu .menu-box{
  opacity: 1;
  visibility: visible;
  -webkit-transition: all 0.7s ease;
  -o-transition: all 0.7s ease;
  transition: all 0.7s ease;
  -webkit-transform: translateX(0%);
  -ms-transform: translateX(0%);
  transform: translateX(0%);
}

.mobile-menu .close-btn{
  position: absolute;
  right: 25px;
  top: 10px;
  line-height: 30px;
  width: 24px;
  text-align: center;
  font-size: 18px;
  color: #ffffff;
  cursor: pointer;
  z-index: 10;
}

.mobile-menu .navigation{
  position: relative;
  display: block;
  width: 100%;
  float: none;
}

.mobile-menu .navigation li{
  position: relative;
  display: block;
  border-top: 1px solid rgba(255,255,255,0.10);
}

.mobile-menu .navigation:last-child{
  border-bottom: 1px solid rgba(255,255,255,0.10);
}

.mobile-menu .navigation li > ul > li:first-child{
  border-top: 1px solid rgba(255,255,255,0.10);
}

.mobile-menu .navigation li > a{
  position: relative;
  display: block;
  line-height: 24px;
  padding: 10px 25px;
  font-size: 15px;
  font-weight: 500;
  color: #ffffff;
  text-transform: uppercase;
  -webkit-transition: all 500ms ease;
  -moz-transition: all 500ms ease;
  -ms-transition: all 500ms ease;
  -o-transition: all 500ms ease;
  transition: all 500ms ease;
}

.mobile-menu .navigation li ul li > a{
  font-size: 16px;
  margin-left: 20px;
  text-transform: capitalize;
}

.mobile-menu .navigation li > a:before{
  content:'';
  position:absolute;
  left:0;
  top:0;
  height:0;
  border-left:5px solid #fff;
  -webkit-transition: all 500ms ease;
  -moz-transition: all 500ms ease;
  -ms-transition: all 500ms ease;
  -o-transition: all 500ms ease;
  transition: all 500ms ease;
}

.mobile-menu .navigation li.current > a:before{
  height:100%;
}

.mobile-menu .navigation li.dropdown .dropdown-btn{
  position:absolute;
  right:6px;
  top:6px;
  width:32px;
  height:32px;
  text-align:center;
  font-size:16px;
  line-height:32px;
  color:#ffffff;
  background:rgba(255,255,255,0.10);
  cursor:pointer;
  border-radius:2px;
  -webkit-transition: all 500ms ease;
  -moz-transition: all 500ms ease;
  -ms-transition: all 500ms ease;
  -o-transition: all 500ms ease;
  transition: all 500ms ease;
  z-index:5;
}

.mobile-menu .navigation li.dropdown .dropdown-btn.open{
  color: #ffffff;
  -webkit-transform:rotate(90deg);
  -ms-transform:rotate(90deg);
  transform:rotate(90deg);
}

.mobile-menu .navigation li > ul,
.mobile-menu .navigation li > ul > li > ul,
.mobile-menu .navigation > li.dropdown > .megamenu{
  display: none;
}

.mobile-menu .social-links{
  position:relative;
  padding:0px 25px;
}

.mobile-menu .social-links li{
  position:relative;
  display:inline-block;
  margin:0px 10px 10px;
}

.mobile-menu .social-links li a{
  position:relative;
  line-height:32px;
  font-size:16px;
  color:#ffffff;
  -webkit-transition: all 500ms ease;
  -moz-transition: all 500ms ease;
  -ms-transition: all 500ms ease;
  -o-transition: all 500ms ease;
  transition: all 500ms ease;
}

.mobile-menu .social-links li a:hover{

}

div#mCSB_1_container{
  top: 0px !important;
}

.mobile-menu .contact-info {
  position: relative;
  padding: 120px 30px 20px 30px;
}

.mobile-menu .contact-info h4 {
  position: relative;
  font-size: 20px;
  color: #ffffff;
  font-weight: 700;
  margin-bottom: 20px;
}

.mobile-menu .contact-info ul li {
  position: relative;
  display: block;
  font-size: 15px;
  color: rgba(255,255,255,0.80);
  margin-bottom: 3px;
}

.mobile-menu .contact-info ul li a{
  color: rgba(255,255,255,0.80);
}

.mobile-menu .contact-info ul li a:hover{

}

.mobile-menu .contact-info ul li:last-child{
  margin-bottom: 0px;
}


/** header-style-two **/

.header-style-two .main-menu .navigation > li > a{
  font-size: 14px;
  font-weight: 700;
  text-transform: uppercase;
}

.main-header .search-inner{
  position: relative;
  width: 300px;
}

.main-header .search-inner .form-group{
  position: relative;
}

.main-header .search-inner .form-group input[type='search']{
  position: relative;
  display: block;
  width: 100%;
  height: 40px;
  border-bottom: solid;
  border-width: 1px;
  border-color: #E5E5E5;
  font-size: 15px;
  color: var(--title-color);
  padding: 10px 0px;
  padding-right: 25px;
  transition: all 500ms ease;
}

.main-header .search-inner .form-group input:focus{

}

.main-header .search-inner .form-group button[type='submit']{
  position: absolute;
  top: 8px;
  right: 0px;
  font-size: 16px;
  color: var(--title-color);
  cursor: pointer;
  transition: all 500ms ease;
}

.main-header .search-inner .form-group input:focus + button,
.main-header .search-inner .form-group button:hover{

}

.mobile-menu .logo-box{
  display: none !important;
}


/** header-style-three **/

.header-style-three{
  position: relative;
}

.header-upper{
  position: relative;
  width: 100%;
  padding: 20px 0px;
  border-bottom: dashed;
  border-width: 2px;
  border-color: #D8D8D8;
}

.header-upper .upper-inner{
  position: relative;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

.header-upper .search-box{
  position: relative;
  width: 850px;
}

.header-upper .search-box .form-group{
  position: relative;
  display: block;
  margin-bottom: 0px;
}

.header-upper .search-box .form-group input[type='search']{
  position: relative;
  display: block;
  width: 100%;
  height: 50px;
  border: dashed;
  border-width: 2px;
  border-radius: 50px;
  bbackground: #F8EDF0;
  font-size: 15px;
  color: #111111;
  padding: 10px 60px 10px 20px;
  transition: all 500ms ease;
}

.header-upper .search-box .form-group button[type='submit']{
  position: absolute;
  top: 5px;
  right: 5px;
  display: inline-block;
  width: 40px;
  height: 40px;
  line-height: 42px;
  text-align: center;
  font-size: 16px;
  color: #fff;
  border-radius: 50%;
}

.main-header .category-toggle{
  position: relative;
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 16px;
  line-height: 22px;
  font-weight: 600;
  color: var(--title-color);
  cursor: pointer;
  transition: all 500ms ease;
}

.main-header .category-toggle:hover{

}

.main-header .category-toggle i{
  font-size: 28px;
}


/** header-style-four **/

.header-style-four{
  position: relative;
}

.header-style-four .header-top{
  background: #E91A3E;
}

.header-style-four .header-upper{
  padding-bottom: 0px;
  border-bottom: none;
}

.header-style-four .header-lower .shape{
  height: 163px;
  background-repeat: no-repeat;
  background-position: bottom center;
  z-index: -1;
  bottom: -40px;
  background-size: cover;
}


/** header-style-five **/

.header-style-five .outer-box .left-column{
  position: relative;
  display: flex;
  align-items: center;
  gap: 70px;
}

.header-style-five .outer-box .logo-box:before{
  position: absolute;
  content: '';
  border-right: dashed;
  border-width: 2px;
  border-color: #666666;
  height: 30px;
  top: 17px;
  right: -36px;
}

.main-header .header-top .option-list li button,
.main-header .header-top .option-list li a{
  color: #fff;
}

.main-header .header-top .option-list li.shop-cart button span{
  background: #fff;
  color: var(--theme-color);
}

.header-style-one{
  box-shadow: 0px 40px 60px 0px rgba(0, 0, 0, 0.03);
}



/** rtl-css **/

.rtl .main-header .category-toggle{
  padding-right: 0px;
  padding-left: 28px;
}

.rtl .main-header .category-toggle:before{
  right: inherit;
  left: 0px;
}

.rtl .header-style-five .outer-box .logo-box:before{
  right: inherit;
  left: -36px;
}

.advice-box-2 {
  width: 80px ;   /* set a fixed width for logo */
  height: 80px;  /* set a fixed height */
  overflow: hidden; /* hide any overflow */
  display: flex;
  align-items: center;
  justify-content: center;
}

.advice-box-2 img {
  max-width: 100%;
  max-height: 100%;
  object-fit: contain; /* keeps the aspect ratio */
}



/** responsive-css **/

@media (max-width: 768px) {
  .main-menu .navigation > li.dropdown > .megamenu {
    grid-template-columns: 1fr;
    max-width: 90vw;
    padding: 20px;
  }
}


@media only screen and (max-width: 1299px){
  .main-header .outer-box .support-box{
    display: none;
  }

  .header-style-three .outer-box .support-box{
    display: flex;
    padding: 20px 0px;
  }
}

@media only screen and (max-width: 1200px){
  .header-upper .search-box{
    width: 440px;
  }
}

@media only screen and (max-width: 991px){
  .header-top .top-inner{
    display: block;
    text-align: center;
  }

  .header-top .top-inner .info-list,
  .header-top .top-inner .right-column{
    justify-content: center;
  }
}

@media only screen and (max-width: 767px){
  .main-header .search-box{
    display: none;
  }

  .header-style-five .menu-right-content{
    display: none;
  }
}

@media only screen and (max-width: 599px){
  .main-header .search-inner{
    width: 250px;
  }
}

@media only screen and (max-width: 499px){
  .main-header .logo-box{
    max-width: 90px;
  }

  .header-top .top-inner .info-list{
    display: block;
    text-align: center;
  }

  .header-top .top-inner .info-list li{
    display: inline-block;
  }

  .main-header .search-inner{
    display: none;
  }

  .header-style-three .outer-box .support-box{
    display: none;
  }

  .header-style-three .outer-box{
    padding: 15px 0px;
  }

  .header-style-five .logo-box{
    display: none;
  }

  .header-style-five .outer-box{
    padding: 15px 0px;
  }
}

.navbar-logo {
    width: 237px;
    height: 65px;
    overflow: hidden;
    display: inline-block;
}

.navbar-logo img {
    width: 100%;
    height: 100%;
    object-fit: contain; /* This maintains aspect ratio */
    object-position: center;
}









</style>
<header class="main-header header-style-two">
    <div class="header-top" style="background-color: {{ get_setting('top_bar_base_color') }};">
        <div class="large-container">
            <div class="top-inner">
                @if (get_setting('helpline_title'))
                    <ul class="info-list" style="margin-bottom: 0px">
                        <li class="!flex !flex-row !items-center !text-center !justify-center">
                            <i class="icon-1"></i><span>{{ get_setting('helpline_title') }}</span>
                        </li>
                    </ul>
                @endif
                <div class="text">
                    <p style="margin-bottom: 0px">
                        {{ get_setting('helpline_number') }}
                    </p>
                </div>
            </div>
        </div>
    </div>
    <div class="header-lower p_relative" style="background-color:{{ get_setting('header_base_color') }};">
        <div class="large-container">
            <div class="outer-box">

                <figure class="navbar-logo pt-1 !hidden xl:!flex">
                    <a href="/"><img src="{{ uploaded_asset(get_setting('site_icon')) }}" alt="" /></a>
                </figure>

                <div class="menu-area">
                    <div class="mobile-nav-toggler !rounded-md">
                        <i class="icon-bar"></i>
                        <i class="icon-bar"></i>
                        <i class="icon-bar"></i>
                    </div>
                    <div class="mobile-logo-box !bg-white">
                        <figure class="navbar-logo !mb-0">
                            <a href="/"><img src="{{ uploaded_asset(get_setting('site_icon')) }}"
                                    alt="" /></a>
                        </figure>
                    </div>
                    <nav class="main-menu navbar-expand-md navbar-light clearfix">
                        <div class="" id="navbarSupportedContent">
                            <ul class="navigation clearfix">

                                @foreach ($menu_items as $item)
                                    @include('frontend.parts.menu-item', ['item' => $item])
                                @endforeach
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="menu-right-content">

                    <div class="search-inner">
                        <form action="{{ route('products.index') }}" method="get" class="pt-3">
                            <div class="form-group">
                                <input type="search" name="search" placeholder="Search Products"
                                    value="{{ request()->get('search') }}" required />
                                <button type="submit">
                                    <i class="icon-4"></i>
                                </button>
                            </div>
                        </form>
                    </div>

                    @php
                        $user = getUser();
                        $cartCount = 0;

                        if ($user['users_id'] == null) {
                            $cartCount = 0;
                        } else {
                            $cartCount = cartCount();
                        }

                    @endphp

                    <ul class="option-list !gap-0 md:!gap-5 !flex !flex-row !items-center !pl-0 md:!pl-[2rem]">
                        <li class="search-icon-mobile">
                            <a href="#" id="mobile-search-trigger" style="display: flex"><i
                                    class="icon-4"></i></a>
                        </li>
                        <li class="shop-cart">
                            <button type="button">
                                <a href="{{ route('cart.items') }}">
                                    <i class="fas fa-cart-shopping"></i><span class="bg-red-500"
                                        id="cart-count-header">{{ $cartCount }}</span>
                                </a>
                            </button>
                        </li>
                        <li>
                            <a href="{{ route('orders.index') }}"><i class="far fa-user"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>


    <!-- Mobile Search Popup -->
    <div class="mobile-search-popup" id="mobile-search-popup" style="display: none;">
        <div class="search-popup-overlay" id="search-popup-overlay"></div>
        <div class="search-popup-content">
            <div class="search-popup-header">
                <h4>Search Products</h4>
                <span class="close-search-popup" id="close-search-popup">&times;</span>
            </div>
            <div class="search-popup-body">
                <form action="{{ route('products.index') }}" method="get">
                    <div class="form-group">
                        <input type="search" name="search" placeholder="Search Products"
                            value="{{ request()->get('search') }}" required />
                        <button type="submit"><i class="icon-4"></i></button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</header>
