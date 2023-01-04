<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Supplier;
use Illuminate\Support\Facades\Validator;

class SupplierController extends Controller
{
    public function index()
    {
        return response()->json([
            'status' => true,
            'data'  => Supplier::all()
        ]);
    }

    public function create(Request $request)
    {
        $validate = Validator::make($request->all(), [

            'nama_supplier'          => 'required',

        ]);
        $validated = $validate->validated();

        try {
            $kategori = Supplier::create($validated);
            return response()->json([
                'status'   =>  true,
                'message'   =>  "Sukses Tambah Supplier",
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'status'   =>  false,
                'message'   =>  $e->getMessage(),
            ]);
        }
    }

    public function update(supplier $supplier, Request $request)
    {
        $validate = Validator::make($request->all(), [
            'nama_supplier'          => 'required',
        ]);
        $validated = $validate->validated();
        try {
            $supplier->update($validated);
            return response()->json([
                'status'   =>  true,
                'message'   =>  "Sukses Update Supplier",
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'status'   =>  false,
                'message'   =>  $e->getMessage(),
            ]);
        }
    }

    public function destroy(Supplier $supplier)
    {
        try {
            $supplier->delete();
            return response()->json([
                'status'   =>  true,
                'message'   =>  "Sukses hapus Supplier",
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'status'   =>  false,
                'message'   =>  $e->getMessage(),
            ]);
        }
    }
}
