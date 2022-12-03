<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class FPDevice extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected $table = 'fp_devices';

    public function school(): BelongsTo
    {
        return $this->belongsTo(School::class);
    }
}
