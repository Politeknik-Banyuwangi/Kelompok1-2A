@extends('layouts.app')

@section('content')
    @if (Auth::user()->role == 'admin')
        <div class="row">
            <div class="col-sm-12 bg-white">
                <h2 class="mt-2">Daftar Barang</h2>


            </div>
            <div class="col-md-6 bg-white">
                <a class="btn btn-galang mb-3" href="{{ route('barang.create') }}"> Tambah Barang</a>
            </div>
            <div class="col-md-6 bg-white">
                <form class="form" method="get" action="{{ route('caribarang') }}">
                    <div class="form-group w-100 mb-3">

                        <input type="text" name="search" class="form-control w-75 d-inline" id="search"
                            placeholder="Masukkan keyword">
                        <button type="submit" class="btn btn-galang">Cari</button>
                    </div>
                </form>
            </div>
        </div>

        @if ($message = Session::get('success'))
            <div class="alert alert-success">
                <p>{{ $message }}</p>
            </div>
        @endif

        <table class="table table-bordered bg-white">
            <tr>
                <th style="width: 5%">No</th>
                <th>Kode Barang</th>
                <th>Nama Barang</th>
                <th>Nama Kategori</th>
                <th>Harga Beli</th>
                <th>Harga Jual</th>
                <th>Stok</th>
                <th>Nama Supplier</th>

                <th width="280px">Action</th>
            </tr>
            @foreach ($barangs as $barang)
                <tr>
                    <th scope="row">{{ ++$i }}</th>
                    <td>{{ $barang->barang_id }}</td>
                    <td>{{ $barang->nama }}</td>
                    <td>{{ $barang->kategori->nama }}</td>
                    <td>{{ $barang->harga_beli }}</td>
                    <td>{{ $barang->harga_jual }}</td>
                    <td>{{ $barang->stok ?? '' }}</td>
                    <td>{{ $barang->supplier->nama_supplier }}</td>



                    <td>
                        <form action="{{ route('barang.destroy', $barang->barang_id) }}" method="POST">

                            <a class="btn btn-galang" href="{{ route('barang.edit', $barang->barang_id) }}">Edit</a>

                            @csrf
                            @method('DELETE')

                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </table>
        <div class="row d-flex justify-content-center text-center bg-white">
            {{ $barangs->links() }}
        </div>
    @else
        <script>
            window.alert("Anda tidak memiliki akses ke halaman ini");
            window.location.href = "/home";
        </script>
    @endif
@endsection
