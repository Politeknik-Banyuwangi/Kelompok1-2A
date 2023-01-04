<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Kategori;
use Illuminate\Support\Facades\Validator;


class kategoriController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return response()->json([
            'status' => true,
            'data'  => Kategori::all()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        $validate = Validator::make($request->all(), [

            'nama'          => 'required',

        ]);
        $validated = $validate->validated();

        try {
            $kategori = Kategori::create($validated);
            return response()->json([
                'status'   =>  true,
                'message'   =>  "Sukses Tambah Kategori",
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'status'   =>  false,
                'message'   =>  $e->getMessage(),
            ]);
        }
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(kategori $kategori, Request $request)
    {
        $validate = Validator::make($request->all(), [

            'nama'          => 'required',

        ]);
        $validated = $validate->validated();
        try {
            $kategori->update($validated);
            return response()->json([
                'status'   =>  true,
                'message'   =>  "Sukses Update Kategori",
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'status'   =>  false,
                'message'   =>  $e->getMessage(),
            ]);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Kategori $kategori)
    {
        try {
            $kategori->delete();
            return response()->json([
                'status'   =>  true,
                'message'   =>  "Sukses hapus Kategori",
            ]);
        } catch (\Throwable $e) {
            return response()->json([
                'status'   =>  false,
                'message'   =>  $e->getMessage(),
            ]);
        }
    }
}
