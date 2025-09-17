<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\PendingOrder;

class CleanupExpiredPendingOrders extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'cleanup:expired-pendings';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Clean up expired pending orders';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $deletedCount = PendingOrder::where('expires_at', '<', now())->delete();
        
        $this->info("Deleted {$deletedCount} expired pending orders.");
        
        return 0;
    }
}
