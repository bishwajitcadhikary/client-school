<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\FPDevice;
use App\Space\StellarBD;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Date;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;

class FPDeviceController extends Controller
{
    public function index()
    {
        $devices = FPDevice::latest()->paginate();

        return Inertia::render('Admin/FPDevices/Index', [
            'devices' => $devices,
        ]);
    }

    public function syncDevices()
    {
        try {
            $stellarBD = new StellarBD();

            $devices = $stellarBD->getDeviceInfo();
            $devices = json_decode($devices, true);

            if (count($devices) > 0) {
                foreach ($devices as $device) {
                    $device = FPDevice::updateOrCreate(
                        ['device_id' => $device['device_id']],
                        [
                            'name' => $device['name'],
                            'last_connected' => Date::parse($device['last_connected']),
                        ]
                    );
                }
            }

            Session::flash('success', __('Devices Synced successfully'));

        }catch (\Exception $e) {
            return redirect()->back()->with('error', $e->getMessage());
        }
    }
}
