<?php

namespace App\Jobs;

use App\Models\FileDisk;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Spatie\Backup\Tasks\Backup\BackupJobFactory;

class CreateBackupJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    private $data;

    public function __construct($data = null)
    {
        $this->data = $data;
    }

    public function handle()
    {
        $fileDisk = FileDisk::find($this->data['file_disk_id']);
        $fileDisk->setConfig();

        $prefix = env('DYNAMIC_DISK_PREFIX', 'temp_');

        config(['backup.backup.destination.disks' => [$prefix.$fileDisk->driver]]);

        $backupJob = BackupJobFactory::createFromArray(config('backup'));

        if ($this->data['backup_type'] === 'only-db') {
            \Artisan::call('backup:run --only-db');
            //$backupJob->dontBackupFilesystem();
        }

        if ($this->data['backup_type'] === 'only-files') {
            \Artisan::call('backup:run --only-files');
            //$backupJob->dontBackupDatabases();
        }

        if (! empty($this->data['backup_type'])) {
            $prefix = str_replace('_', '-', $this->data['backup_type']).'-';

            $backupJob->setFilename($prefix.date('Y-m-d-H-i-s').'.zip');
        }

        if ($this->data['backup_type'] === 'full') {
            \Artisan::call('backup:run');
        }

//        $backupJob->run();
    }
}
