<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Models\PlanOrder;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        $orders = PlanOrder::with(['gateway', 'plan'])->whereCustomerId(auth()->user()->id)->latest()->paginate();

        return Inertia::render('Customer/Dashboard/Index', [
            'orders' => $orders
        ]);
    }
}
