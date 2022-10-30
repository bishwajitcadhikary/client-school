<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Mail\SendOauthRegisteredUserPassword;
use App\Models\User;
use Illuminate\Http\Request;
use Laravel\Socialite\Facades\Socialite;
use Mail;

class OAuthController extends Controller
{
    public function redirect($provider)
    {
        abort_if(!config("services.{$provider}.client_id"), 404);

        return Socialite::driver($provider)->redirect();
    }

    public function callback($provider)
    {
        $user = Socialite::driver($provider)->user();
        $hasUser = User::where(str($provider)->append('_id'), $user->id)->first();
        $otherUser = User::where('email', $user->getEmail())->first();

        if ($hasUser) {
            auth()->login($hasUser, true);

            return redirect()->route('customer.dashboard.index');
        } elseif ($otherUser){
            $otherUser->update([
                str($provider).'_id' => $user->getId(),
            ]);

            auth()->login($otherUser, true);

            return redirect()->route('customer.dashboard.index');
        }else {
            $password = \Str::random(10);
            $newUser = User::create([
                'name' => $user->name,
                'email' => $user->email,
                'username' => $this->generateUsername($user->getEmail()),
                str($provider).'_id' => $user->getId(),
                'password' => bcrypt($password),
                'email_verified_at' => now(),
            ]);

            if ($user->getAvatar()){
                $newUser->addMediaFromUrl($user->getAvatar())->toMediaCollection('avatar');
            }

            auth()->login($newUser, true);

            Mail::to($newUser)->send(new SendOauthRegisteredUserPassword($newUser->email, $password));

            return redirect()->route('customer.dashboard.index');
        }
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
