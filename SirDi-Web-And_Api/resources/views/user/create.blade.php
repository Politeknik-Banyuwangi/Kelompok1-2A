@extends('layouts.app')

@section('content')
    @if (Auth::user()->role == 'admin')
        <div class="row">
            <div class="col-md-12 bg-white">
                <div>
                    <h2 class="mt-3">Tambah Karyawan</h2>
                </div>
                <div>
                    <a class="btn btn-galang mb-2" href="{{ route('user.index') }}"> Kembali </a>
                </div>
            </div>
        </div>

        @if ($errors->any())
            <div class="alert alert-danger">
                <strong>Whoops!</strong> There were some problems with your input.<br><br>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form action="{{ route('user.store') }}" method="POST">
            @csrf

            <div class="row bg-white">
                <div class="col-xs-12 col-sm-12 col-md-12 bg-white">
                    <div class="form-group">
                        <strong>Nama :</strong>
                        <div class="row">
                            <input type="text" name="name" class="form-control" placeholder="Nama" id="name">

                        </div>
                    </div>
                    <div class="form-group">
                        <strong>Email :</strong>
                        <input type="email" name="email" class="form-control" placeholder="Email">

                    </div>




                    <div class="form-group">
                        <strong>Password</strong>
                        <input type="password" name="password" class="form-control" placeholder="Password">

                    </div>
                    {{-- <div class="form-group">
                        <strong> Level :</strong>
                        <select class="form-control" id="position-option" name="role">

                            <option value="admin">Admin</option>
                            <option value="user">User</option>
                        </select>

                    </div> --}}

                </div>

                <div class="col-xs-12 col-sm-12 col-md-12 text-center mt-3">
                    <button type="submit" class="btn btn-galang">Simpan</button>
                </div>
            </div>

        </form>
    @else
        <script>
            window.alert("Anda tidak memiliki akses ke halaman ini");
            window.location.href = "/home";
        </script>
    @endif

@endsection
