<?php

namespace App\Listeners;

use App\Events\VerifikasiEmail;
use App\Mail\SendVerifikasiemail;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;

class VerifikasiEmailListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  \App\Events\VerifikasiEmail  $event
     * @return void
     */
    public function handle(VerifikasiEmail $event)
    {
        Mail::to($event->data['email'])->send(new SendVerifikasiemail($event));
    }
}
