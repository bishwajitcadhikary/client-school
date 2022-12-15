<?php

namespace App\Http\Controllers\Admin\School;

use App\Http\Controllers\Controller;
use App\Models\FPDevice;
use App\Models\School;
use App\Space\StellarBD;
use Illuminate\Http\Request;
use Inertia\Inertia;

class FingerPrintController extends Controller
{
    public function index(School $school)
    {
        $devices = $school->devices()->latest()->paginate();

        return Inertia::render('Admin/School/Settings/FingerPrint/Index', [
            'school' => $school,
            'devices' => $devices,
        ]);
    }

    public function create(School $school)
    {
        return Inertia::render('Admin/School/Settings/FingerPrint/Create', [
            'school' => $school,
        ]);
    }

    public function store(Request $request, School $school)
    {
        $data = $request->validate([
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
