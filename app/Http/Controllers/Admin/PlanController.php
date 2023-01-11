<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Plan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;

class PlanController extends Controller
{
    public function index()
    {
        $plans = Plan::withCount('customers')->latest()->paginate(10);

        return Inertia::render('Admin/Plan/Index', [
            'plans' => $plans,
        ]);
    }

    public function create()
    {
        return Inertia::render('Admin/Plan/Create');
    }

    public function store(Request $request)
    {
        Plan::createPlan($request);

        Session::flash('success', __('Plan Created Successfully'));

        return to_route('admin.plans.index');
    }

    public function show(Plan $plan)
    {
        return Inertia::render('Admin/Plan/Show', [
            'plan' => $plan
        ]);
    }

    public function edit(Plan $plan)
    {
        return Inertia::render('Admin/Plan/Edit', [
            'plan' => $plan,
        ]);
    }

    public function update(Request $request, Plan $plan)
    {
        $plan->updatePlan($request);

        Session::flash('success', __('Plan Updated Successfully'));

        return to_route('admin.plans.index');
    }

    public function destroy(Plan $plan)
    {
        // TODO:: Check customers

        $plan->delete();

        Session::flash('success', __('Plan Deleted Successfully'));

        return to_route('admin.plans.index');
    }
}
