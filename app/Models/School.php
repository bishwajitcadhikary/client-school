<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;

class School extends Model
{
    use HasFactory;

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
}
