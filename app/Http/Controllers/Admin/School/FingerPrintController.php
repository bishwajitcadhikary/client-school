<?php

namespace App\Http\Controllers\Admin\School;

use App\Http\Controllers\Controller;
use App\Models\FPDevice;
use App\Models\Sass\Branch;
use App\Models\School;
use App\Space\StellarBD;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;
use Inertia\Inertia;

class FingerPrintController extends Controller
{
    public function index(School $school)
    {
        //set database connection
        Config::set([
            'database.connections.school.host' => $school->host,
            'database.connections.school.port' => $school->port,
            'database.connections.school.database' => $school->database,
            'database.connections.school.username' => $school->username,
            'database.connections.school.password' => $school->password,
        ]);

        $devices = $school->devices()
            ->with('branch')
            ->latest()
            ->paginate();

        return Inertia::render('Admin/School/Settings/FingerPrint/Index', [
            'school' => $school,
            'devices' => $devices,
        ]);
    }

    public function create(School $school)
    {
        // check database connection
        try {
            \Config::set([
                'database.connections.school.host' => $school->host,
                'database.connections.school.port' => $school->port,
                'database.connections.school.database' => $school->database,
                'database.connections.school.username' => $school->username,
                'database.connections.school.password' => $school->password,
            ]);

            \DB::connection('school')->getPdo();
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Database connection failed');
        }

        $branches = Branch::selectRaw('name as title, id as value')->get();

        return Inertia::render('Admin/School/Settings/FingerPrint/Create', [
            'school' => $school,
            'branches' => $branches,
        ]);
    }

    public function store(Request $request, School $school)
    {
        $data = $request->validate([
            'branch_id' => ['required', 'integer'],
            'name' => ['required', 'string'],
            'device_id' => ['required', 'string', 'unique:fp_devices,device_id'],
            'auth_code' => ['required', 'string'],
            'auth_user' => ['required', 'string'],
            'is_active' => ['required', 'boolean'],
        ]);

        // Check Device is valid or not
        $stellarBD = new StellarBD($data['auth_code'], $data['auth_user']);

        if ($stellarBD->checkDevice($data['device_id'])){
            $school->devices()->create($data);

            return redirect()->route('admin.schools.settings.fingerprint-devices.index', $school)
                ->with('success', __('Fingerprint device added successfully.'));
        }

        return back()->with('error', __('Device not found. Please contact with StellarBD.'));
    }

    public function edit(School $school, FPDevice $fingerprintDevice)
    {
        return Inertia::render('Admin/School/Settings/FingerPrint/Edit', [
            'school' => $school,
            'device' => $fingerprintDevice,
        ]);
    }

    public function update(Request $request, School $school, FPDevice $fingerprintDevice)
    {
        $data = $request->validate([
            'name' => ['required', 'string'],
            'device_id' => ['required', 'string', 'unique:fp_devices,device_id,' . $fingerprintDevice->id],
            'auth_code' => ['required', 'string'],
            'auth_user' => ['required', 'string'],
            'is_active' => ['required', 'boolean'],
        ]);

        // Check Device is valid or not
        $stellarBD = new StellarBD($data['auth_code'], $data['auth_user']);

        if ($stellarBD->checkDevice($data['device_id'])){
            $fingerprintDevice->update($data);

            return redirect()->route('admin.schools.settings.fingerprint-devices.index', $school)
                ->with('success', __('Fingerprint device updated successfully.'));
        }

        return back()->with('error', __('Device not found. Please contact with StellarBD.'));
    }

    public function destroy(School $school, FPDevice $fingerprintDevice)
    {
        $fingerprintDevice->delete();

        return redirect()->route('admin.schools.settings.fingerprint-devices.index', $school)
                ->with('success', __('Fingerprint device deleted successfully.'));
    }
}
