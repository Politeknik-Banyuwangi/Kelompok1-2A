<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

    <!-- Scripts -->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
    {{-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"> --}}
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/css/bootstrap.css') !!}">
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/css/app.css') !!}">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

    @yield('head')
</head>

<body id="body-pd">
    <header class="header" id="header">
        <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
        <div class="header_img"> <img src="https://i.pravatar.cc/25" alt=""> </div>
    </header>
    <div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div>
                <a href="/home" class="nav_logo">
                    <i class='bx bx-layer nav_logo-icon'></i>
                    <span class="nav_logo-name">SirDi</span>
                </a>
                <div class="nav_list">
                    <a href="/home" class="nav_link  {{ request()->is('home*') ? 'active' : '' }} ">
                        <i class='bx bx-home nav_icon'></i>
                        <span class="nav_name">Dashboard</span>
                    </a>
                    <a href="/transaksi" class="nav_link {{ request()->is('transaksi*') ? 'active' : '' }} ">
                        <i class='bx bx-folder nav_icon'></i>
                        <span class="nav_name">Transaksi</span>
                    </a>
                    <a href="/barang" class="nav_link {{ request()->is('barang*') ? 'active' : '' }} ">
                        <i class='bx bx-box nav_icon'></i>
                        <span class="nav_name">Barang</span>
                    </a>
                    <a href="/kategori" class="nav_link {{ request()->is('kategori*') ? 'active' : '' }} ">
                        <i class='bx bx-category nav_icon'></i>
                        <span class="nav_name">Kategori</span>
                    </a>
                    <a href="/supplier" class="nav_link {{ request()->is('supplier*') ? 'active' : '' }} ">
                        <i class='bx bx-store-alt nav_icon'></i>
                        <span class="nav_name">Supplier</span>
                    </a>

                    <a href="/lihathistory" class="nav_link {{ request()->is('lihathistory*') ? 'active' : '' }} ">
                        <i class='bx bx-history nav_icon'></i>
                        <span class="nav_name">Lihat history</span>
                    </a>
                    <a href="/user" class="nav_link {{ request()->is('user*') ? 'active' : '' }} ">
                        <i class='bx bx-user nav_icon'></i>
                        <span class="nav_name">Karyawan</span>
                    </a>
                </div>
            </div>


            <a onclick="event.preventDefault();
            document.getElementById('logout-form').submit();"
                {{ __('Logout') }} href="{{ route('logout') }}" class="nav_link"> <i
                    class='bx bx-log-out nav_icon'></i> <span class="nav_name">SignOut</span> </a>
            <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                @csrf
            </form>
        </nav>
    </div>
    <!--Container Main start-->
    <div class="bg-light">
        @yield('content')
    </div>
    <!--Container Main end-->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener("DOMContentLoaded", function(event) {

            const showNavbar = (toggleId, navId, bodyId, headerId) => {
                const toggle = document.getElementById(toggleId),
                    nav = document.getElementById(navId),
                    bodypd = document.getElementById(bodyId),
                    headerpd = document.getElementById(headerId)

                // Validate that all variables exist
                if (toggle && nav && bodypd && headerpd) {
                    toggle.addEventListener('click', () => {
                        // show navbar
                        nav.classList.toggle('show')
                        // change icon
                        toggle.classList.toggle('bx-x')
                        // add padding to body
                        bodypd.classList.toggle('body-pd')
                        // add padding to header
                        headerpd.classList.toggle('body-pd')
                    })
                }
            }

            showNavbar('header-toggle', 'nav-bar', 'body-pd', 'header')

            /*===== LINK ACTIVE =====*/
            const linkColor = document.querySelectorAll('.nav_link')

            function colorLink() {
                if (linkColor) {
                    linkColor.forEach(l => l.classList.remove('active'))
                    this.classList.add('active')
                }
            }
            linkColor.forEach(l => l.addEventListener('click', colorLink))

            // Your code to run since DOM is loaded and ready
        });
    </script>
</body>

</html>
