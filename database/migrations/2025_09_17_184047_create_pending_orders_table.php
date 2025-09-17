<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('pending_orders', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('user_id')->nullable();
            $table->string('temp_user_id')->nullable();
            $table->longText('order_data'); // JSON encoded order data
            $table->string('payment_method');
            $table->string('order_code')->unique();
            $table->timestamp('expires_at')->nullable(); // For cleanup of old pending orders
            $table->timestamps();
            
            $table->index(['user_id', 'temp_user_id']);
            $table->index('order_code');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('pending_orders');
    }
};
