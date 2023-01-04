<?php

namespace App\Http\Controllers;

use App\Models\Kategori;
use Illuminate\Http\Request;

class kategoriController extends Controller
{

    public function index()
    {
        $kategoris = Kategori::latest()->paginate(5);

        return view('kategori.index', compact('kategoris'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    public function create()
    {
        return view('kategori.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama' => 'required',

        ]);

        Kategori::create($request->all());

        return redirect()->route('kategori.index')
            ->with('success', 'Kategori Berhasil Ditambahkan');
    }

    public function show(Kategori $kategori)
    {
        return view('kategori.show', compact('kategori'));
    }


    public function edit(Kategori $kategori)
    {
        return view('kategori.edit', compact('kategori'));
    }


    public function update(Request $request, Kategori $kategori)
    {
        $request->validate([
            'nama' => 'required',
        ]);

        $kategori->update($request->all());

        return redirect()->route('kategori.index')
            ->with('success', 'Student updated successfully');
    }


    public function destroy(Kategori $kategori)
    {
        $kategori->delete();

        return redirect()->route('kategori.index')
            ->with('success', 'Student deleted successfully');
    }
    public function search(Request $request)
    {
        $keyword = $request->search;
        $kategoris = Kategori::where('nama', 'like', "%" . $keyword . "%")
            ->orwhere('kategori_id', 'like', "%" . $keyword . "%")
            ->paginate(5);
        return view('kategori.index', compact('kategoris'))->with('i', (request()->input('page', 1) - 1) * 5);
    }
}
