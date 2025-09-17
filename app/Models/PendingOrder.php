<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PendingOrder extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'temp_user_id',
        'order_data',
        'payment_method',
        'order_code',
        'expires_at',
        'razorpay_order_id',
        'razorpay_payment_link_id',
    ];

    protected $casts = [
        'order_data' => 'array',
        'expires_at' => 'datetime',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
