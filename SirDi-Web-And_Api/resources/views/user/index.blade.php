@extends('layouts.app')

@section('content')
    @if (Auth::user()->role == 'admin')
        <div class="row">
            <div class="col-sm-12 bg-white">
                <h2 class="mt-2">Daftar Karyawan</h2>


            </div>
            <div class="col bg-white">
                <a class="btn btn-galang mb-3" href="{{ route('user.create') }}"> Tambah Karyawan</a>
            </div>

        </div>

        @if ($message = Session::get('success'))
            <div class="alert alert-success">
                <p>{{ $message }}</p>
            </div>
        @endif
        @if ($message = Session::get('error'))
            <div class="alert alert-danger">
                <p>{{ $message }}</p>
            </div>
        @endif

        <table class="table table-bordered bg-white">
            <tr>
                <th style="width: 5%">No</th>
                <th>Nama </th>
                <th>Email</th>

                <th width="280px">Action</th>
            </tr>
            @foreach ($user as $item)
                <tr>
                    <th scope="row">{{ ++$i }}</th>
                    <td>{{ $item->name }}</td>
                    <td>{{ $item->email }}</td>

                    <td>
                        <form action="{{ route('user.destroy', $item->id) }}" method="POST">

                            <a class="btn btn-galang" href="{{ route('user.edit', $item->id) }}">Edit</a>

                            @csrf
                            @method('DELETE')

                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
            @endforeach
        </table>
        <div class="row d-flex justify-content-center text-center bg-white">
            {{ $user->links() }}
        </div>
    @else
        <script>
            window.alert('Anda tidak memiliki akses ke halaman ini');
            window.location = '/home';
        </script>
    @endif
@endsection
