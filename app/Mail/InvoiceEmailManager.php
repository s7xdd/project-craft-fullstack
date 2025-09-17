<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class InvoiceEmailManager extends Mailable
{
    use Queueable, SerializesModels;

    public $array;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($array)
    {
        $this->array = $array;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        // Get logo path
        $logoPath = public_path('assets/images/Black-logo.png');
        if (!file_exists($logoPath)) {
            $logoPath = public_path('uploads/all.png');
        }
        
        $this->array['imagePath'] = $logoPath;
        
        return $this->view($this->array['view'])
                    ->subject($this->array['subject'])
                    ->with([
                        'order' => $this->array['order'],
                        'imagePath' => $this->array['imagePath']
                    ]);
    }
}