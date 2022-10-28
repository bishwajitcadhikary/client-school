<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Rules\GoogleRecaptcha;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules;
use Inertia\Inertia;

class RegisteredUserController extends Controller
{
    public function create()
    {
        return Inertia::render('Auth/Register', [
            'showRecaptcha' => config('wovo.show_repcaptcha'),
            'recaptchaSiteKey' => config('wovo.recaptcha_site_key'),
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
            'terms' => ['accepted'],
            'recaptcha' => [Rule::requiredIf(function (){
                return config('wovo.show_repcaptcha');
            }), new GoogleRecaptcha()],
        ], [
            'recaptcha.required' => __('Please verify that you are not a robot.'),
        ]);

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'username' => $this->generateUsername($request->email)
        ]);

        event(new Registered($user));

        Auth::login($user);

        return redirect()->route('customer.dashboard.index');
    }

    public function generateUsername($email): string
    {
        $explodeEmail = explode('@', $email);
        $username = $explodeEmail[0];
        $count_username = User::where('username', $username)->count();
        if ($count_username > 0) {
            $username = $username . $count_username + 1;
        }

        return $username;
    }
}
