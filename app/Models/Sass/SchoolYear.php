<?php

namespace App\Models\Sass;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SchoolYear extends Model
{
    protected $table = 'schoolyear';

    protected $connection = 'school';
}
