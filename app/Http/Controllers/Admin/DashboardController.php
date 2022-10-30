<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\PlanOrder;
use App\Models\User;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        $totalEarnings = PlanOrder::selectRaw('SUM(amount / 100) as totalEarnings')->first()->totalEarnings ?? 0;
        $totalOrders = PlanOrder::count();
        $totalCustomers = User::count();

        $orders = PlanOrder::with(['customer', 'plan', 'gateway'])->latest()->paginate(10);

        return Inertia::render('Admin/Dashboard/Index', [
            'totalEarnings' => $totalEarnings,
            'totalOrders' => $totalOrders,
            'totalCustomers' => $totalCustomers,
            'orders' => $orders,
        ]);
    }
}
