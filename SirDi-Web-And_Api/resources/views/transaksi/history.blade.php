@extends('layouts.app')

@section('content')
    @if (Auth::user()->role == 'admin')
        <div class="row">
            <div class="col-sm-12 bg-white">
                <h2 class="mt-2">Transaksi</h2>


            </div>

            {{-- <div class="col-md-6 bg-white">
                <form class="form" method="get" action="{{ route('caribarang') }}">
                    <div class="form-group w-100 mb-3">

                        <input type="text" name="search" class="form-control w-75 d-inline" id="search"
                            placeholder="Masukkan keyword">
                        <button type="submit" class="btn btn-galang">Cari</button>
                    </div>
                </form>
            </div> --}}
        </div>

        @if ($message = Session::get('success'))
            <div class="alert alert-success">
                <p>{{ $message }}</p>
            </div>
        @endif
        @php
            // dd($history);
        @endphp
        <div class="row bg-white">
            <div class="col">
                <form action="/lihathistory" method="GET">
                    <label for="tanggal_mulai">Tanggal Mulai:</label>
                    <input type="date" name="tanggal_mulai" value="{{ request('tanggal_mulai') }}">
                    <label for="tanggal_akhir">Tanggal Akhir:</label>
                    <input type="date" name="tanggal_akhir" value="{{ request('tanggal_akhir') }}">
                    <button type="submit" class="btn btn-galang">Filter</button>
                </form>
            </div>

        </div>


        <table class="table table-bordered m-0 mt-2 bg-white ">
            <tr>
                <th style="width: 5%">No</th>
                {{-- <th>Kode Transaksi</th> --}}
                <th>Nama Barang</th>
                <th>Harga Jual</th>
                <th>Harga Beli</th>
                <th>Quantity</th>
                <th>Total</th>
                <th>Laba</th>
                <th>Waktu Transaksi</th>

                {{-- <th width="280px">Action</th> --}}
            </tr>
            @foreach ($history as $item)
                <tr>
                    <th scope="row">{{ ++$i }}</th>
                    {{-- <td>{{ $item->history_transaksi_id }}</td> --}}
                    @foreach ($item['barang'] as $barang)
                        <td>{{ $barang->nama }}</td>
                        <td>{{ $barang->harga_jual }}</td>
                        <td>{{ $barang->harga_beli }}</td>
                    @endforeach
                    <td>{{ $item->jumlah }}</td>
                    <td>{{ $item->total }}</td>
                    <td>{{ $item->laba }}</td>
                    <td>{{ $item->updated_at }}</td>




                    {{-- <td>
                        <form action="{{ route('barang.destroy', $barang->barang_id) }}" method="POST">

                            <a class="btn btn-galang" href="{{ route('barang.edit', $barang->barang_id) }}">Edit</a>

                            @csrf
                            @method('DELETE')

                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td> --}}
                </tr>
            @endforeach

        </table>
        <div class="row m-0 mt-1 bg-white">
            @php
                $totalterjual = 0;
                $totallaba = 0;
                foreach ($history as $item) {
                    $totalterjual += $item->total;
                    $totallaba += $item->laba;
                }
            @endphp
            <div class="col-md-3">
                <h5>Total Penjualan: <b>Rp. {{ $totalterjual }}</b></h5>
            </div>
            <div class="col">
                <h5>Total Laba: <b>Rp. {{ $totallaba }}</b></h5>


            </div>

        </div>
        {{-- <div class="row d-flex justify-content-center text-center bg-white">
            {{ $history->links() }}
        </div> --}}
    @else
        <script>
            window.alert("Anda tidak memiliki akses ke halaman ini");
            window.location.href = "/home";
        </script>
    @endif
@endsection
