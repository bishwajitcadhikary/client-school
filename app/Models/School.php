<?php

namespace App\Models;

use App\Models\Sass\Branch;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class School extends Model
{
    protected $guarded = ['id'];

    public function customer(): BelongsTo
    {
        return $this->belongsTo(User::class, 'customer_id', 'id');
    }

    public function devices(): HasMany
    {
        return $this->hasMany(FPDevice::class);
    }

    public function setting(): HasMany
    {
        return $this->hasMany(SchoolSetting::class);
    }

    public function settings(): HasMany
    {
        return $this->hasMany(SchoolSetting::class);
    }

    public function branches()
    {
        //set database connection
        \Config::set([
            'database.connections.school.host' => $this->host,
            'database.connections.school.port' => $this->port,
            'database.connections.school.database' => $this->database,
            'database.connections.school.username' => $this->username,
            'database.connections.school.password' => $this->password,
        ]);
        return Branch::all();
    }

    protected static function boot()
    {
        parent::boot();

        static::created(function (self $school) {
            $settings = [
                [
                    'option' => 'school_year',
                    'value' => 1,
                ],
                [
                    'option' => 'attendance_update_at',
                    'value' => '16:00',
                ],
                [
                    'option' => 'late_time',
                    'value' => '12:00',
                ],
                [
                    'option' => 'absent_time',
                    'value' => '14:00',
                ],
                [
                    'option' => 'weekends',
                    'value' => json_encode(["friday", "saturday"]),
                ],
                [
                    'option' => 'holidays',
                    'value' => null,
                ],
                [
                    'option' => 'staff_attendance_update_at',
                    'value' => '16:00',
                ],
                [
                    'option' => 'staff_late_time',
                    'value' => '11:00',
                ],
                [
                    'option' => 'staff_absent_time',
                    'value' => '13:00',
                ],
                [
                    'option' => 'staff_holidays',
                    'value' => null,
                ],
                [
                    'option' => 'staff_weekends',
                    'value' => json_encode(["friday", "saturday"]),
                ],
            ];

            foreach ($settings as $setting) {
                $school->settings()->create($setting);
            }
        });
    }
}
