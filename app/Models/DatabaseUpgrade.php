<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DatabaseUpgrade extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected $casts = [
        'success' => 'json',
        'failed' => 'json',
    ];
}
