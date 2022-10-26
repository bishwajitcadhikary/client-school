<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Inertia\Inertia;

class CustomerController extends Controller
{
    public function index()
    {
        $customers = User::whereRole('customer')->latest()->paginate(10);

        return Inertia::render('Admin/Customer/Index', [
            'customers' => $customers,
        ]);
    }
}
