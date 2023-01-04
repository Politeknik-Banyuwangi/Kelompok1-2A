@extends('layouts.app')

@section('content')
    @if (Auth::user()->role == 'admin')
        <div class="row">
            <div class="col-md-12 bg-white">
                <div>
                    <h2 class="mt-3">Tambah Supplier Baru</h2>
                </div>
                <div>
                    <a class="btn btn-galang mb-2" href="{{ route('supplier.index') }}"> Kembali </a>
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

        <form action="{{ route('supplier.store') }}" method="POST">
            @csrf

            <div class="row bg-white">
                <div class="col-xs-12 col-sm-12 col-md-12 bg-white">
                    <div class="form-group">
                        <strong>Nama supplier :</strong>
                        <input type="text" name="nama_supplier" class="form-control" placeholder="Nama">
                    </div>
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
