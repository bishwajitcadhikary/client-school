<?php

namespace App\Http\Controllers\Admin\Settings;

use App\Http\Controllers\Controller;
use App\Jobs\CreateBackupJob;
use App\Models\FileDisk;
use App\Rules\PathToZip;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Session;
use Inertia\Inertia;
use Spatie\Backup\BackupDestination\Backup;
use Spatie\Backup\BackupDestination\BackupDestination;
use Spatie\Backup\Helpers\Format;
use Symfony\Component\HttpFoundation\StreamedResponse;

class BackupController extends Controller
{
    public function index(Request $request)
    {
        try {
            $backupDestination = BackupDestination::create(config('filesystems.default'), config('backup.backup.name'));

            $backups = Cache::remember("backups-{$request->file_disk_id}", now()->addSeconds(4), function () use ($backupDestination) {
                return $backupDestination
                    ->backups()
                    ->map(function (Backup $backup) {
                        return [
                            'path' => $backup->path(),
                            'created_at' => $backup->date()->format('Y-m-d H:i:s'),
                            'size' => Format::humanReadableSize($backup->sizeInBytes()),
                        ];
                    })
                    ->toArray();
            });
        } catch (\Exception $e) {
            Session::flash('error', $e->getMessage());
        }

        return Inertia::render('Admin/Settings/Backup/Index', [
            'backups' => $backups ?? [],
            'disks' => $configuredBackupDisks ?? [],
        ]);
    }

    public function create()
    {
        $disks = FileDisk::selectRaw('name as title, id as value, set_as_default')->get();

        return Inertia::render('Admin/Settings/Backup/Create', [
            'disks' => $disks,
        ]);
    }

    public function store(Request $request)
    {
        dispatch(new CreateBackupJob($request->all()))->onQueue(config('backup.queue.name'));

        Session::flash('success', __('Backup Created Successfully'));

        return to_route('admin.settings.backups.index');
    }

    public function destroy(Request $request, $backup)
    {
        $validated = $request->validate([
            'path' => ['required', new PathToZip()],
        ]);

        $backupDestination = BackupDestination::create(config('filesystems.default'), config('backup.backup.name'));

        $backupDestination
            ->backups()
            ->first(function (Backup $backup) use ($validated) {
                return $backup->path() === $validated['path'];
            })
            ->delete();

        Session::flash('success', __('Backup Deleted Successfully'));

        return redirect()->back();
    }

    public function download(Request $request)
    {
        $validated = $request->validate([
            'path' => ['required', new PathToZip()],
        ]);

        $backupDestination = BackupDestination::create(config('filesystems.default'), config('backup.backup.name'));

        $backup = $backupDestination->backups()->first(function (Backup $backup) use ($validated) {
            return $backup->path() === $validated['path'];
        });

        if (! $backup) {
            Session::flash('error', __('Backup Not Found!'));
        }

        return $this->respondWithBackupStream($backup);
    }

    public function respondWithBackupStream(Backup $backup): StreamedResponse
    {
        $fileName = pathinfo($backup->path(), PATHINFO_BASENAME);

        $downloadHeaders = [
            'Cache-Control' => 'must-revalidate, post-check=0, pre-check=0',
            'Content-Type' => 'application/zip',
            'Content-Length' => $backup->sizeInBytes(),
            'Content-Disposition' => 'attachment; filename="'.$fileName.'"',
            'Pragma' => 'public',
        ];

        return response()->stream(function () use ($backup) {
            $stream = $backup->stream();

            fpassthru($stream);

            if (is_resource($stream)) {
                fclose($stream);
            }
        }, 200, $downloadHeaders);
    }
}
