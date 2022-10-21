<?php

namespace App\Http\Controllers\Admin\Settings;

use App\Http\Controllers\Controller;
use App\Jobs\CreateBackupJob;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Inertia\Inertia;
use Session;
use Spatie\Backup\BackupDestination\Backup;
use Spatie\Backup\BackupDestination\BackupDestination;
use Spatie\Backup\Helpers\Format;

class BackupController extends Controller
{
    public function index(Request $request)
    {
        $configuredBackupDisks = config('backup.backup.destination.disks');

        try {
            $backupDestination = BackupDestination::create(config('filesystems.default'), config('backup.backup.name'));

            $backups = Cache::remember("backups-{$request->file_disk_id}", now()->addSeconds(4), function () use ($backupDestination) {
                return $backupDestination
                    ->backups()
                    ->map(function (Backup $backup) {
                        return [
                            'path' => $backup->path(),
                            'created_at' => $backup->date()->format('Y-m-d H:i:s'),
                            'size' => Format::humanReadableSize($backup->size()),
                        ];
                    })
                    ->toArray();
            });
        } catch (\Exception $e) {
            Session::flash('error', $e->getMessage()se
        )
        }

        return Inertia::render('Admin/Settings/Backup/Index', [
            'backups' => $backups ?? [],
            'disks' => $configuredBackupDisks ?? [],
        ]);
    }

    public function create()
    {
        Inertia::render('Admin/Settings/Backup/Create');
    }

    public function store(Request $request)
    {
        dispatch(new CreateBackupJob($request->all()))->onQueue(config('backup.queue.name'));

        Session::flash('success', __("Backup Created Successfully"));

        return to_route('admin.settings.backups.index');
    }

    public function show(Backup $backup)
    {
        //
    }

    public function edit(Backup $backup)
    {
        //
    }

    public function update(Request $request, Backup $backup)
    {
        //
    }

    public function destroy(Backup $backup)
    {
        //
    }
}
