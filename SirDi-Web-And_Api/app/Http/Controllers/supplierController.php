<?php

namespace App\Http\Controllers;

use App\Models\Supplier;
use Illuminate\Http\Request;

class supplierController extends Controller
{

    public function index()
    {
        $suppliers = Supplier::latest()->paginate(5);

        return view('supplier.index', compact('suppliers'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }

    public function create()
    {
        return view('supplier.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama_supplier' => 'required',

        ]);

        Supplier::create($request->all());

        return redirect()->route('supplier.index')
            ->with('success', 'Supplier Berhasil Ditambahkan');
    }

    public function show(Supplier $supplier)
    {
        return view('supplier.show', compact('supplier'));
    }


    public function edit(Supplier $supplier)
    {
        return view('supplier.edit', compact('supplier'));
    }


    public function update(Request $request, Supplier $supplier)
    {
        $request->validate([
            'nama_supplier' => 'required',
        ]);

        $supplier->update($request->all());

        return redirect()->route('supplier.index')
            ->with('success', 'Supplier updated successfully');
    }


    public function destroy(Supplier $supplier)
    {
        $supplier->delete();

        return redirect()->route('supplier.index')
            ->with('success', 'Supplier deleted successfully');
    }
    public function search(Request $request)
    {
        $keyword = $request->search;
        $suppliers = Supplier::where('nama_supplier', 'like', "%" . $keyword . "%")
            ->orwhere('supplier_id', 'like', "%" . $keyword . "%")
            ->paginate(5);
        return view('supplier.index', compact('suppliers'))->with('i', (request()->input('page', 1) - 1) * 5);
    }
}
