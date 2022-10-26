<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;

class FileDisk extends Model
{
    use HasFactory;

    public const DISK_TYPE_SYSTEM = 'SYSTEM';

    public const DISK_TYPE_REMOTE = 'REMOTE';

    protected $guarded = [
        'id',
    ];

    protected $casts = [
        'set_as_default' => 'boolean',
    ];

    public function setCredentialsAttribute($value)
    {
        $this->attributes['credentials'] = json_encode($value);
    }

    public function setConfig()
    {
        $driver = $this->driver;

        $credentials = collect(json_decode($this['credentials']));

        self::setFilesystem($credentials, $driver);
    }

    public function setAsDefault()
    {
        return $this->set_as_default;
    }

    public static function setFilesystem($credentials, $driver)
    {
        $prefix = env('DYNAMIC_DISK_PREFIX', 'temp_');

        config(['filesystems.default' => $prefix.$driver]);

        $disks = config('filesystems.disks.'.$driver);

        foreach ($disks as $key => $value) {
            if ($credentials->has($key)) {
                $disks[$key] = $credentials[$key];
            }
        }

        config(['filesystems.disks.'.$prefix.$driver => $disks]);
    }

    public static function validateCredentials($credentials, $disk)
    {
        $exists = false;

        self::setFilesystem(collect($credentials), $disk);

        $prefix = env('DYNAMIC_DISK_PREFIX', 'temp_');

        try {
            $root = '';
            if ($disk == 'dropbox') {
                $root = $credentials['root'].'/';
            }
            \Storage::disk($prefix.$disk)->put($root.'crater_temp.text', 'Check Credentials');

            if (\Storage::disk($prefix.$disk)->exists($root.'crater_temp.text')) {
                $exists = true;
                \Storage::disk($prefix.$disk)->delete($root.'crater_temp.text');
            }
        } catch (\Exception $e) {
            $exists = false;
        }

        return $exists;
    }

    public static function createDisk($request)
    {
        if ($request->set_as_default) {
            self::updateDefaultDisks();
        }

        $disk = self::create([
            'credentials' => $request->only(['local_root', 'aws_root', 'aws_key', 'aws_secret', 'aws_region', 'aws_bucket']),
            'name' => $request->name,
            'driver' => $request->driver,
            'set_as_default' => $request->set_as_default,
        ]);

        return $disk;
    }

    public static function updateDefaultDisks()
    {
        $disks = self::get();

        foreach ($disks as $disk) {
            $disk->set_as_default = false;
            $disk->save();
        }

        return true;
    }

    public function updateDisk(Request $request)
    {
        $data = [
            'credentials' => $request->only(['local_root', 'aws_root', 'aws_key', 'aws_secret', 'aws_region', 'aws_bucket']),
            'name' => $request->name,
            'driver' => $request->driver,
        ];

        if (! $this->setAsDefault()) {
            if ($request->set_as_default) {
                self::updateDefaultDisks();
            }

            $data['set_as_default'] = $request->set_as_default;
        }

        $this->update($data);

        return $this;
    }

    public function setAsDefaultDisk()
    {
        self::updateDefaultDisks();

        $this->set_as_default = true;
        $this->save();

        return $this;
    }

    public function isSystem()
    {
        return $this->type === self::DISK_TYPE_SYSTEM;
    }

    public function isRemote()
    {
        return $this->type === self::DISK_TYPE_REMOTE;
    }
}
