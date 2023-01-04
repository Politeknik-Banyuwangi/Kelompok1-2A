@extends('layouts.app')

@section('content')
    @if (Auth::user()->role == 'admin')
        <div class="row">
            <div class="col-sm-12 bg-white">
                <h2 class="mt-2">Daftar Kategori</h2>


            </div>
            <div class="col-md-6 bg-white">
                <a class="btn btn-galang mb-3" href="{{ route('kategori.create') }}"> Tambah Kategori</a>
            </div>
            <div class="col-md-6 bg-white">
                <form class="form" method="get" action="{{ route('carikategori') }}">
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
                <th>Nama Kategori</th>

                <th width="280px">Action</th>
            </tr>
            @foreach ($kategoris as $kategori)
                <tr>
                    <th scope="row">{{ ++$i }}</th>
                    <td>{{ $kategori->nama }}</td>

                    <td>
                        <form action="{{ route('kategori.destroy', $kategori->kategori_id) }}" method="POST">

                            <a class="btn btn-galang" href="{{ route('kategori.edit', $kategori->kategori_id) }}">Edit</a>

                            @csrf
                            @method('DELETE')

                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </table>
        <div class="row d-flex justify-content-center text-center bg-white">
            {{ $kategoris->links() }}
        </div>
    @else
        <script>
            window.alert('Anda tidak memiliki akses ke halaman ini');
            window.location = '/home';
        </script>
    @endif
@endsection
