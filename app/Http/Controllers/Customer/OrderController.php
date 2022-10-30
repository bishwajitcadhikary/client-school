<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Models\PlanOrder;
use Illuminate\Http\Request;
use Inertia\Inertia;

class OrderController extends Controller
{
    public function index()
    {
        $orders = PlanOrder::with(['gateway', 'plan'])->whereCustomerId(auth()->user()->id)->latest()->paginate();

        return Inertia::render('Customer/Order/Index', [
            'orders' => $orders
        ]);
    }
}
