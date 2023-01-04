<?php

namespace App\Providers;

use App\Events\VerifikasiEmail;
use App\Listeners\VerifikasiEmailListener;
use App\Models\Barang;
use App\Models\BarangMasuk;
use App\Models\Stok;
use App\Observers\BarangMasukObserver;
use App\Observers\BarangObserver;
use App\Observers\StokObserver;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event to listener mappings for the application.
     *
     * @var array<class-string, array<int, class-string>>
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        Event::listen(
            VerifikasiEmail::class,
            [VerifikasiEmailListener::class, 'handle']
        );
    }
    protected $observers = [
        Barang::class => [BarangObserver::class],
        BarangMasuk::class => [BarangMasukObserver::class],
        Stok::class => [StokObserver::class],
    ];

    /**
     * Determine if events and listeners should be automatically discovered.
     *
     * @return bool
     */
    public function shouldDiscoverEvents()
    {
        return false;
    }
}
