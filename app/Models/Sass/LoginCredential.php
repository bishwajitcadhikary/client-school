<?php

namespace App\Models\Sass;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LoginCredential extends Model
{
    protected $table = 'login_credential';

    protected $connection = 'school';
}
