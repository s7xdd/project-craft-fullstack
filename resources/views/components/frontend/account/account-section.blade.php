<section class="account-section pb_120">
    <div class="large-container">
        <div class="sec-title centred mb_60">
            <h2>Order <span>History</span></h2>
        </div>
        
        {{ $orderIdFilter ?? '' }}
        
        <div class="history-box pt_100" id="orderHistoryList">
            {{ $slot }}
        </div>
    </div>
</section>