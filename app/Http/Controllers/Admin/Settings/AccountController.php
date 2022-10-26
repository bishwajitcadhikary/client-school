<?php

namespace App\Http\Controllers\Admin\Settings;

use App\Http\Controllers\Controller;
use App\Models\Language;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\Password;
use Inertia\Inertia;

class AccountController extends Controller
{
    public function index(Request $request)
    {
        $languages = Language::whereIsActive(1)->selectRaw('name as title, code as value')->get();

        return Inertia::render('Admin/Settings/Account/Index', [
            'languages' => $languages,
            'user' => $request->user(),
        ]);
    }

    public function update(Request $request)
    {
        $validated = $request->validate([
            'name' => ['required', 'string'],
            'email' => ['required', 'email', Rule::unique('users')->ignore(Auth::id())],
            'password' => ['nullable', Password::default(), 'confirmed'],
            'language' => ['required', 'exists:languages,code'],
        ]);

        Auth::user()->update([
            'name' => $validated['name'],
            'email' => $validated['email'],
            'password' => $validated['password'] ? bcrypt($validated['password']) : Auth::user()->password,
            'language' => $validated['language'],
        ]);

        \Session::flash('success', __('Account Settings Updated Successfully'));

        return redirect()->back();
    }
}
