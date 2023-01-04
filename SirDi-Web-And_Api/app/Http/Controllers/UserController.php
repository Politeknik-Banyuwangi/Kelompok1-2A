<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Validator;

use Illuminate\Support\Facades\Hash;
use app\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $user = User::latest()->paginate(5);
        return view('user.index', compact('user'))
            ->with('i', (request()->input('page', 1) - 1) * 5);
    }
    public function create()
    {

        return view('user.create');
    }

    public function store(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'name'      =>  'required',
            'email'     =>  'required',
            'password'  =>  'required',
            'role'      =>  'required',

        ]);
        $validated = $validate->validated();
        $validated['password'] = Hash::make($validated['password']);
        try {
            $user = User::create($validated);
            // Event::dispatch(new VerifikasiEmail($user));
            return redirect()->route('user.index')
                ->with('success', 'User Berhasil Ditambahkan');
        } catch (\Throwable $th) {
            return redirect()->route('user.index')
                ->with('error', 'User gagal Ditambahkan');
        }
    }




    public function edit(user $user)
    {

        return view('user.edit', compact('user'));
    }


    public function update(Request $request, User $user)
    {

        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'password' => 'required',
        ]);
        $request['password'] = Hash::make($request['password']);
        $user->update($request->all());

        return redirect()->route('user.index')
            ->with('success', 'user updated successfully');
    }


    public function destroy(User $user)
    {
        $user->delete();

        return redirect()->route('user.index')
            ->with('success', 'user deleted successfully');
    }
}
