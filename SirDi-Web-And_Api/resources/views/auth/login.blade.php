<!DOCTYPE html>
<html lang="en">

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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="{!! asset('assets/css/login.css') !!}">
</head>

<body>
    <div class="container ">

        <div class="row justify-content-center ">

            <div class="col-md-8 mt-auto  justify-content-center">
                <div class="card justify-content-center mt-5 " style="">
                    <div class="card-header text-center">{{ __('LOGIN') }}</div>

                    <div class="card-body justify-content-center ">
                        <form method="POST" action="{{ route('login') }}">
                            @csrf

                            <div class="row mb-3  justify-content-center">


                                <div class="col-md-6 offset-sm-1 text-center">
                                    <input style="" id="email" type="email" placeholder="Email Address"
                                        class="form-control @error('email') is-invalid @enderror  justify-content-center"
                                        name="email" value="{{ old('email') }}" required autocomplete="email"
                                        autofocus>

                                    @error('email')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center ">


                                <div class="col-md-6 offset-sm-1 text-center">
                                    <input style="" id="password" type="password"
                                        class=" justify-content-center form-control @error('password') is-invalid @enderror"
                                        placeholder="Password" name="password" required autocomplete="current-password">

                                    @error('password')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                    @enderror
                                </div>
                            </div>

                            <div class="row mb-3 justify-content-center">
                                <div class="col-md-6 offset-sm-1 ">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="remember" id="remember"
                                            {{ old('remember') ? 'checked' : '' }}>

                                        <label style="font-size:12px;color:#495057;margin-right:1px;"
                                            class="form-check-label" for="remember">
                                            {{ __('Ingat Saya') }}
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-3  justify-content-center">


                                <div class="col-md-6 offset-sm-1 text-center d-grid gap-2">
                                    <button type="submit" class="btn btn-primary btn-lg btn-block button-login ">
                                        {{ __('Login') }}
                                    </button>
                                </div>
                            </div>
                            <div class="row mb-0 justify-content-center">
                                <div class="col-md-8 offset-sm-1 text-center">


                                    @if (Route::has('password.request'))
                                        <a style="color:#3F0071 " class="btn btn-link"
                                            href="{{ route('password.request') }}">
                                            {{ __('Lupa Password?') }}
                                        </a>
                                    @endif
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous">
    </script>
</body>

</html>
