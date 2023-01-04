<?php

namespace App\Http\Controllers;

use App\Models\Barang;
use App\Models\Kategori;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Supplier;
use PDF;

class barangwebController extends Controller
{

    public function index()
    {

        $barangs = Barang::latest()->paginate(5);
        // foreach ($barangs as $barang) {
        //     echo  $barang->kategori->nama;
        // }

        return view('barang.index', compact('barangs'))->with('i', (request()->input('page', 1) - 1) * 5,);
        // return view('barang.index')->with('barangs', $barangs);
    }

    public function create()
    {
        // $barangs = Barang::with(['stok', 'kategori', 'barangMasuk'])->get();
        $kategoris = Kategori::all();
        $suppliers = Supplier::all();
        // echo $barangs;
        return view('barang.create',  compact('kategoris', 'suppliers'));
    }

    public function store(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'barang_id'     => 'required',
            'kategori_id'   => 'required',
            'supplier_id'   => 'required',
            'nama'          => 'required',
            'harga_beli'    => 'required',
            'harga_jual'    => 'required',
            'stok'          => 'required'
        ]);
        $validated = $validate->validated();
        // unset($validated['stok']);
        try {
            $barang = Barang::create($validated);
            // $barang->stok()->create(['jumlah' => $request->stok]);
            return redirect()->route('barang.index')
                ->with('success', 'Barang Berhasil Ditambahkan');
        } catch (\Throwable $e) {
            return response()->json([
                'status'   =>  false,
                'message'   =>  $e->getMessage(),
            ]);
        }
    }

    public function show(Barang $barang)
    {
        return view('barang.show', compact('barang'));
    }


    public function edit(Barang $barang)
    {
        $kategori = Kategori::all();
        $supplier = Supplier::all();
        return view('barang.edit', compact('barang', 'kategori', 'supplier'));
    }


    public function update(Request $request, Barang $barang)
    {
        $validate = Validator::make($request->all(), [
            'barang_id'     => 'required',
            'kategori_id'   => 'required',
            'supplier_id'   => 'required',
            'nama'          => 'required',
            'harga_beli'    => 'required',
            'harga_jual'    => 'required',
            'stok'          => 'required'
        ]);
        $validated = $validate->validated();
        // unset($validated['stok']);
        try {
            $barang->update($validated);
            // $barang->stok()->create(['jumlah' => $request->stok]);
            return redirect()->route('barang.index')
                ->with('success', 'Barang Berhasil Ditambahkan');
        } catch (\Throwable $e) {
            return response()->json([
                'status'   =>  false,
                'message'   =>  $e->getMessage(),
            ]);
        }
    }


    public function destroy(Barang $barang)
    {
        $barang->delete();

        return redirect()->route('barang.index')
            ->with('success', 'Student deleted successfully');
    }
    public function search(Request $request)
    {
        $keyword = $request->search;
        $barangs = Barang::where('nama', 'like', "%" . $keyword . "%")
            ->orWhere('barang_id', 'like', "%" . $keyword . "%")
            ->paginate(5);
        return view('barang.index', compact('barangs'))->with('i', (request()->input('page', 1) - 1) * 5);
    }
}
