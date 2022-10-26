<?php

namespace App\Http\Controllers\Admin\Settings;

use App\Http\Controllers\Controller;
use App\Models\FileDisk;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Inertia\Inertia;
use Session;

class FileDiskController extends Controller
{
    public function index()
    {
        $disks = FileDisk::latest()->paginate(10);

        return Inertia::render('Admin/Settings/FileDisk/Index', [
            'disks' => $disks,
        ]);
    }

    public function create()
    {
        $local_root = storage_path('app');

        return Inertia::render('Admin/Settings/FileDisk/Create', [
            'local_root' => $local_root,
        ]);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => ['required', Rule::unique('file_disks')],
            'driver' => ['required', Rule::in(['local', 's3'])],
            'set_as_default' => ['required', 'boolean'],

            'local_root' => ['required_if:driver,local'],

            'aws_root' => ['required_if:driver,s3'],
            'aws_key' => ['required_if:driver,s3'],
            'aws_secret' => ['required_if:driver,s3'],
            'aws_region' => ['required_if:driver,s3'],
            'aws_bucket' => ['required_if:driver,s3'],
        ]);

        FileDisk::createDisk($request);

        Session::flash('success', __('File Disk Created Successfully'));

        return to_route('admin.settings.file-disks.index');
    }

    public function show(FileDisk $fileDisk)
    {
        //
    }

    public function edit(FileDisk $fileDisk)
    {
        return Inertia::render('Admin/Settings/FileDisk/Edit', [
            'disk' => $fileDisk,
        ]);
    }

    public function update(Request $request, FileDisk $fileDisk)
    {
        $request->validate([
            'name' => ['required', Rule::unique('file_disks')->ignore($fileDisk->id)],
            'driver' => ['required', Rule::in(['local', 's3'])],
            'set_as_default' => ['required', 'boolean'],

            'local_root' => ['required_if:driver,local'],

            'aws_root' => ['required_if:driver,s3'],
            'aws_key' => ['required_if:driver,s3'],
            'aws_secret' => ['required_if:driver,s3'],
            'aws_region' => ['required_if:driver,s3'],
            'aws_bucket' => ['required_if:driver,s3'],
        ]);

        $credentials = $request->only(['local_root', 'aws_root', 'aws_key', 'aws_secret', 'aws_region', 'aws_bucket']);
        $driver = $request->driver;

        if ($credentials && $driver && $fileDisk->type !== 'SYSTEM') {
            if (! FileDisk::validateCredentials($credentials, $driver)) {
                return dd('error');
            }

            $fileDisk->updateDisk($request);
        } elseif ($request->set_as_default) {
            $fileDisk->setAsDefaultDisk();
        }

        Session::flash('success', __('File Disk Updated Successfully'));

        return to_route('admin.settings.file-disks.index');
    }

    public function destroy(FileDisk $fileDisk)
    {
        if ($fileDisk->setAsDefault() && $fileDisk->type === 'SYSTEM') {
            Session::flash('error', 'Not Allowed');

            return redirect()->back();
        }

        $fileDisk->delete();
        Session::flash('success', __('File Disk Deleted Successfully'));

        return redirect()->back();
    }
}
