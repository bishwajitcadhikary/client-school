<?php

namespace App\Http\Controllers\Admin\Settings;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Inertia\Inertia;
use Session;
use Spatie\Permission\Models\Role;

class RoleController extends Controller
{
    public function __construct()
    {
        $this->middleware('permission:roles-create')->only('create', 'store');
        $this->middleware('permission:roles-read')->only('index', 'show');
        $this->middleware('permission:roles-update')->only('edit', 'update');
        $this->middleware('permission:roles-delete')->only('destroy');
    }

    public function index()
    {
        $roles = Role::latest()->paginate(1);

        return Inertia::render('Admin/Settings/Roles/Index', [
            'roles' => $roles
        ]);
    }

    public function create()
    {
        return Inertia::render('Admin/Settings/Roles/Create');
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'string', Rule::unique('roles', 'name')]
        ]);

        Role::create([
            'name' => $data['name']
        ]);

        Session::flash('success', __("Role Created Successfully"));

        return to_route('admin.settings.roles.index');
    }

    public function edit(Role $role)
    {
        return Inertia::render('Admin/Settings/Roles/Edit', [
            'role' => $role
        ]);
    }

    public function update(Request $request, Role $role)
    {
        $data = $request->validate([
            'name' => ['required', 'string', Rule::unique('roles', 'name')->ignore($role->id)]
        ]);

        $role->update([
            'name' => $data['name']
        ]);

        Session::flash('success', __("Role Updated Successfully"));

        return to_route('admin.settings.roles.index');
    }

    public function destroy(Role $role)
    {
        $role->delete();

        Session::flash('success', __('Role Deleted Successfully'));

        return to_route('admin.settings.roles.index');
    }
}
