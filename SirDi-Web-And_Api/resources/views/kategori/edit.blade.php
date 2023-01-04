@extends('layouts.app')

@section('content')
    @if (Auth::user()->role == 'admin')
        <div class="row bg-white">
            <div class="col-lg-12 mt-2 bg-white">
                <div>
                    <h2>Edit Kategori</h2>
                </div>
                <div>
                    <a class="btn btn-danger mb-2" href="{{ route('kategori.index') }}"> Kembali</a>
                </div>
            </div>
        </div>

        @if ($errors->any())
            <div class="alert alert-danger">
                <strong>Whoops!</strong> Maaf, Periksa Ulang Inputan Anda.<br><br>
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <form action="{{ route('kategori.update', $kategori->kategori_id) }}" method="POST">
            @csrf
            @method('PUT')

            <div class="row bg-white">
                <div class="col-xs-12 col-sm-12 col-md-12 bg-white">
                    <div class="form-group">
                        <strong>Name:</strong>
                        <input type="text" name="nama" value="{{ $kategori->nama }}" class="form-control"
                            placeholder="Name">
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
