<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Mail\Customer\AccountDeactivated;
use App\Models\Currency;
use App\Models\Language;
use App\Rules\Phone;
use App\Space\Countries;
use App\Space\TimeZone;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\Password;
use Inertia\Inertia;
use Jenssegers\Agent\Agent;
use Laravel\Fortify\Features;

class ProfileController extends Controller
{
    public function index(Request $request)
    {
        $customer = Auth::user();
        $languages = Language::selectOptions()->get();
        $countries = Countries::getCountriesArray();
        $currencies = Currency::selectOptions()->get();
        $timeZones = TimeZone::get_list();

        return Inertia::render('Customer/Profile/Index', [
            'customer' => $customer,
            'languages' => $languages,
            'countries' => $countries,
            'currencies' => $currencies,
            'timeZones' => $timeZones,
            'confirmsTwoFactorAuthentication' => Features::optionEnabled(Features::twoFactorAuthentication(), 'confirm'),
            'sessions' => $this->sessions($request)->all(),
        ]);
    }

    public function updateProfileInformation(Request $request)
    {
        $data = $request->validate([
            'avatar' => ['nullable', 'file', 'max:1024'],
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users,email,' . Auth::id()],
            'username' => ['required', 'string', 'max:255', 'unique:users,username,' . Auth::id()],
            'phone' => ['required', 'string', new Phone],
            'website' => ['nullable', 'string', 'max:255'],
            'language' => ['required', 'integer', Rule::exists('languages', 'id')->where('is_active', true)],
            'currency' => ['required', 'integer', Rule::exists('currencies', 'id')->where('is_active', true)],
            'country' => ['required', 'string'],
            'timezone' => ['nullable', 'string'],
        ]);
        $data['language_id'] = $data['language'];
        $data['currency_id'] = $data['currency'];
        unset($data['language'], $data['currency'], $data['avatar']);

        if ($request->hasFile('avatar')){
            if ($request->file('avatar')->getClientOriginalName() !== 'blob'){
                Auth::user()->clearMediaCollection('avatar');
                Auth::user()->addMedia($request->file('avatar'))->toMediaCollection('avatar');
            }
        }

        Auth::user()->update($data);

        Session::flash('success', __('Profile Information Updated Successfully.'));
    }

    public function deactivateAccount(Request $request)
    {
        $request->validate([
            'deactivation_confirmation' => ['accepted'],
            'confirm_password' => ['required', 'string', 'min:8'],
        ]);

        if(Hash::check($request->confirm_password, Auth::user()->password)) {
            Auth::user()->update([
                'status' => false,
            ]);

            if (config('queue.connections.database.driver') === 'database'){
                Mail::to(Auth::user()->email)->queue(new AccountDeactivated());
            } else {
                Mail::to(Auth::user()->email)->send(new AccountDeactivated());
            }

            Session::flash('success', __('Account Deactivated Successfully.'));

            Auth::logout();
            return redirect()->route('login');
        }
    }

    public function changePassword(Request $request)
    {
        $request->validate([
            'current_password' => ['required', 'string', 'min:8'],
            'password' => ['required', 'string', 'min:8', 'confirmed', Password::default()],
        ]);

        if(Hash::check($request->current_password, Auth::user()->password)) {
            Auth::user()->update([
                'password' => Hash::make($request->password),
            ]);

            Session::flash('success', __('Password Changed Successfully.'));
        }else{
            Session::flash('error', __('Current Password is incorrect.'));
        }
    }

    /**
     * Get the current sessions.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Support\Collection
     */
    public function sessions(Request $request)
    {
        if (config('session.driver') !== 'database') {
            return collect();
        }

        return collect(
            DB::connection(config('session.connection'))->table(config('session.table', 'sessions'))
                ->where('user_id', $request->user()->getAuthIdentifier())
                ->orderBy('last_activity', 'desc')
                ->get()
        )->map(function ($session) use ($request) {
            $agent = $this->createAgent($session);

            return (object) [
                'agent' => [
                    'is_desktop' => $agent->isDesktop(),
                    'platform' => $agent->platform(),
                    'browser' => $agent->browser(),
                ],
                'ip_address' => $session->ip_address,
                'is_current_device' => $session->id === $request->session()->getId(),
                'last_active' => Carbon::createFromTimestamp($session->last_activity)->diffForHumans(),
            ];
        });
    }

    /**
     * Create a new agent instance from the given session.
     *
     * @param  mixed  $session
     * @return \Jenssegers\Agent\Agent
     */
    protected function createAgent($session)
    {
        return tap(new Agent, function ($agent) use ($session) {
            $agent->setUserAgent($session->user_agent);
        });
    }
}
