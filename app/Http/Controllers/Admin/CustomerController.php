<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Currency;
use App\Models\Language;
use App\Models\Plan;
use App\Models\User;
use App\Rules\Phone;
use App\Space\Countries;
use Auth;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\Password;
use Inertia\Inertia;

class CustomerController extends Controller
{
    public function index()
    {
        $customers = User::where('role', '=', 'customer')
            ->latest()
            ->paginate(10);

        return Inertia::render('Admin/Customer/Index', [
            'customers' => $customers,
        ]);
    }

    public function create()
    {
        $plans = Plan::selectOptions()->get();
        $currencies = Currency::selectOptions()->get();
        $countries = Countries::getCountriesArray();

        return Inertia::render('Admin/Customer/Create', [
            'plans' => $plans,
            'currencies' => $currencies,
            'countries' => $countries,
        ]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'avatar' => ['nullable', 'image'],
            'name' => ['required', 'string'],
            'username' => ['required', 'alpha', 'unique:users'],
            'email' => ['required', 'email', 'indisposable', 'unique:users'],
            'phone' => ['nullable', new Phone],
            'password' => ['required', Password::default()],
            'currency' => ['required', 'exists:currencies,id'],
            'country' => ['required'],
            'website' => ['nullable', 'active_url'],
            'plan' => ['required', 'exists:plans,id'],
            'interval' => ['required_if:plan !==,' . null, 'in:monthly,yearly'],
        ]);

        $data['currency_id'] = $data['currency'];
        $data['plan_id'] = $data['plan'];

        if ($data['plan_id']) {
            // $plan = Plan::findOrFail($data['plan_id']);
            $will_expire = now()->add('1 ' . str($data['interval'])->remove('ly'));
            // TODO:: Add transactions
        }

        $user = User::create([
                'role' => 'customer',
                'language_id' => Language::whereIsDefault(1)->first()->id ?? null,
                'password' => $data['password'] ? bcrypt($data['password']) : bcrypt('password'),
                'status' => 1,
                'plan_expire_at' => $will_expire ?? null,
                'created_by' => Auth::id(),
            ] + $data);

        $userId = $user->id;

        if ($request->hasFile('avatar')) {
            $user->addMedia($request->file('avatar'))
                ->toMediaCollection('avatar');
        }

        Session::flash('success', __('Customer Created Successfully'));

        return to_route('admin.customers.show', $userId);
    }

    public function show(User $customer)
    {
        $customer->load(['plan', 'language', 'currency']);
        $customer->append(['avatar']);

        $expireAt = \Date::parse($customer->plan_expire_at);
        $expiration = $expireAt->diffForHumans();

        $percent = $expireAt->isPast() ? 100 : ($customer->interval === 'monthly' ? $expireAt->subMonth()->diffInDays(today()): $expireAt->subYear()->diffInDays(today()));

        return Inertia::render('Admin/Customer/Show', [
            'customer' => $customer,
            'expiration' => $expiration,
            'percent' => $percent
        ]);
    }

    public function edit(User $customer)
    {
        $customer->append(['avatar']);
        $currencies = Currency::selectOptions()->get();

        return Inertia::render('Admin/Customer/Edit', [
            'currencies' => $currencies,
            'customer' => $customer,
        ]);
    }

    public function changePassword(Request $request, User $customer)
    {
        $data = $request->validate([
            'password' => ['required', 'confirmed', Password::default()],
        ]);

        $customer->update([
            'password' => bcrypt($data['password']),
        ]);

        Session::flash('success', __('Password Updated Successfully'));
    }

    public function update(Request $request, User $customer)
    {
        $data = $request->validate([
            'avatar' => ['nullable', 'image'],
            'name' => ['required', 'string'],
            'username' => ['required', 'alpha', Rule::unique('users')->ignore($customer->id)],
            'email' => ['required', 'email', 'indisposable', Rule::unique('users')->ignore($customer->id)],
            'phone' => ['nullable', new Phone],
            'password' => ['nullable', Password::default()],
            'currency' => ['required', 'exists:currencies,id'],
            'website' => ['nullable', 'active_url'],
        ]);

        $data['currency_id'] = $data['currency'];

        $customer->update([
                'role' => 'customer',
                'language' => 'en',
                'password' => $data['password'] ? bcrypt($data['password']) : bcrypt('password'),
                'status' => 1,
            ] + $data);

        if ($request->hasFile('avatar')) {
            $customer->clearMediaCollection('avatar');
            $customer->addMedia($request->file('avatar'))->toMediaCollection('avatar');
        }

        Session::flash('success', __('Customer Updated Successfully'));

        return to_route('admin.customers.show', $customer->id);
    }

    public function toggleSuspend(User $customer)
    {
        $customer->update([
            'status' => $customer->status == 2 ? 1 : 2,
        ]);

        Session::flash('success', __('Customer account status updated'));
    }
}
