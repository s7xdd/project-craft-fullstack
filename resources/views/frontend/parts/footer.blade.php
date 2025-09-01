   <footer class="main-footer home-3 footer-light">
       <div class="widget-section p_relative pt_100 pb_80">
           <div class="large-container">
               <div class="row clearfix">
                   <div class="col-lg-3 col-md-6 col-sm-12 footer-column">
                       <div class="tp-footer-widget logo-widget">
                           <figure class="footer-logo">
                               <a href="/"><img src="{{ uploaded_asset(get_setting('site_icon_light')) }}"
                                       alt="Site Logo" /></a>
                           </figure>
                           <div class="widget-content">
                               <ul class="info-list clearfix">
                                   <li>
                                       {{ get_setting('site_motto') }}
                                   </li>
                               </ul>
                           </div>
                       </div>
                   </div>

                   @if (isset($menu_items) && count($menu_items) > 0)
                       @foreach ($menu_items as $menu)
                           <div class="col-lg-2 col-md-6 col-sm-12 footer-column">
                               <div class="tp-footer-widget links-widget">
                                   <div class="widget-title">
                                       <h4>{{ $menu->label }}</h4>
                                   </div>
                                   <div class="widget-content">
                                       <ul class="links-list clearfix">
                                           @if ($menu->child)
                                               @foreach ($menu->child as $child)
                                                   <li>
                                                       <a href={{ $child->link }}>{{ $child->label }}</a>
                                                   </li>
                                               @endforeach
                                           @endif

                                       </ul>
                                   </div>
                               </div>
                           </div>
                       @endforeach
                   @endif

                   <div class="col-lg-3 col-md-6 col-sm-12 footer-column">
                       <div class="tp-footer-widget subscribe-widget">
                           <div class="widget-title">
                               <h4>Support</h4>
                           </div>
                           <div class="widget-content">
                               <ul class="info-list clearfix">
                                   <li>
                                       {{ get_setting('footer_address') }}
                                   </li>
                                   <li>
                                       <a
                                           href="mailto:{{ get_setting('footer_email') }}">{{ get_setting('footer_email') }}</a>
                                   </li>
                                   <li>
                                       <a
                                           href="tel:{{ get_setting('footer_phone') }}">{{ get_setting('footer_phone') }}</a>
                                   </li>
                               </ul>
                               @php
                                   $socialLinks = [
                                       'facebook_link' => 'icon-14',
                                       'twitter_link' => 'icon-15',
                                       'instagram_link' => 'icon-16',
                                       'youtube_link' => 'icon-17',
                                   ];
                               @endphp
                               <ul class="social-links">
                                   @foreach ($socialLinks as $key => $icon)
                                       @if (get_setting($key))
                                           <a href="{{ get_setting($key) }}"
                                               class="hover:text-[#c38a42] transition-all"><i
                                                   class="{{ $icon }}"></i></a>
                                       @endif
                                   @endforeach
                               </ul>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
       </div>
       <div class="footer-bottom">
           <div class="large-container">
               <div class="bottom-inner">
                   <div class="copyright">
                       <p>
                           Copyright &copy; 2025
                           <span class="text-white">Grostore</span>, All
                           Rights Reserved
                       </p>
                   </div>

                   @if (get_setting('payment_method_images'))
                       <ul class="footer-card">
                           @php
                               $paymentMethods = explode(',', get_setting('payment_method_images'));

                           @endphp
                           @foreach ($paymentMethods as $key => $image)
                               <li>
                                   <a href=""><img src="{{ uploaded_asset($image) }}"
                                           alt="Payment Method" /></a>
                               </li>
                           @endforeach
                       </ul>
                   @endif
               </div>
           </div>
       </div>
   </footer>
