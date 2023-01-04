@extends('layouts.app')

@section('content')
    @if (Auth::user()->role == 'admin')
        <div class="row">
            <div class="col-md-12 bg-white">
                <div>
                    <h2 class="mt-3">Tambah Barang</h2>
                </div>
                <div>
                    <a class="btn btn-galang mb-2" href="{{ route('barang.index') }}"> Kembali </a>
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

        <form action="{{ route('barang.store') }}" method="POST">
            @csrf

            <div class="row bg-white">
                <div class="col-xs-12 col-sm-12 col-md-12 bg-white">
                    <div class="form-group">
                        <strong>Kode Barang :</strong>
                        <div class="row">
                            <div class="col-md-6"> <input type="text" name="barang_id" class="form-control"
                                    placeholder="kode barang" id="barang_id"></div>
                            <div class="col-md-6"> <input type="button" onclick="Random();"
                                    class="btn btn-galang d-flex justify-content-end" value="GENERATE"></div>
                        </div>
                    </div>
                    <div class="form-group">
                        <strong>Nama Barang :</strong>
                        <input type="text" name="nama" class="form-control" placeholder="Nama">

                    </div>
                    <div class="form-group">
                        <strong> Kategori :</strong>
                        <select class="form-control" id="position-option" name="kategori_id">
                            @foreach ($kategoris as $item)
                                <option value="{{ $item->kategori_id }}">{{ $item->nama }}</option>
                            @endforeach
                        </select>

                    </div>
                    <div class="form-group">
                        <strong> Supplier :</strong>
                        <select class="form-control" id="position-option" name="supplier_id">
                            @foreach ($suppliers as $item)
                                <option value="{{ $item->supplier_id }}">{{ $item->nama_supplier }}</option>
                            @endforeach
                        </select>

                    </div>
                    <div class="form-group">
                        <strong>Harga Beli :</strong>
                        <input type="number" name="harga_beli" class="form-control" placeholder="Harga Beli">

                    </div>
                    <div class="form-group">
                        <strong>Harga Jual :</strong>
                        <input type="number" name="harga_jual" class="form-control" placeholder="Harga Jual">

                    </div>
                    <div class="form-group">
                        <strong>Jumlah Stok</strong>
                        <input type="number" name="stok" class="form-control" placeholder="Stok">

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
    <script>
        function Random() {
            // var rnd = Math.floor(Math.random() * 100000);
            var rnd = (Math.random() + 1).toString(36).substring(3);
            document.getElementById('barang_id').value = rnd;
        }
    </script>
@endsection
