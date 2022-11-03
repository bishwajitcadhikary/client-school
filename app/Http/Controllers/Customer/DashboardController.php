<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Models\PlanOrder;
use App\Models\School;
use Illuminate\Http\Request;
use Inertia\Inertia;

class DashboardController extends Controller
{
    public function index()
    {
        $orders = PlanOrder::with(['gateway', 'plan'])->whereCustomerId(auth()->user()->id)->latest()->paginate();
        $schools = School::whereCustomerId(auth()->id())
            ->select(['id', 'name', 'domain', 'created_at', 'is_active', 'database_created'])
            ->latest()
            ->paginate();

        return Inertia::render('Customer/Dashboard/Index', [
            'orders' => $orders,
            'schools' => $schools,
        ]);
    }
}
