<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Http\Request;

class Plan extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected function monthlyPrice(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value / 100,
            set: fn ($value) => $value * 100,
        );
    }

    protected function yearlyPrice(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value / 100,
            set: fn ($value) => $value * 100,
        );
    }


    public function customers(): HasMany
    {
        return $this->hasMany(User::class, 'plan_id', 'id');
    }

    public function scopeSelectOptions($query)
    {
        $query->where('is_active', '=', true)
            ->selectRaw('name as title, id as value');
    }

    public static function createPlan(Request $request): Plan
    {
        $data = $request->validate([
            'name' => ['required', 'string'],
            'price' => ['required', 'numeric', 'min:0'],
            'school_limit' => ['required', 'integer', 'min:0'],
            'max_limit' => ['required', 'integer', 'min:0'],
            'description' => ['nullable', 'string'],
            'is_active' => ['boolean'],
            'is_trial' => ['boolean'],
        ]);

        return self::create($data);
    }

    public function updatePlan(Request $request): Plan
    {
        $data = $request->validate([
            'name' => ['required', 'string'],
            'price' => ['required', 'numeric', 'min:0'],
            'school_limit' => ['required', 'integer', 'min:0'],
            'max_limit' => ['required', 'integer', 'min:0'],
            'description' => ['nullable', 'string'],
            'is_active' => ['boolean'],
            'is_trial' => ['boolean'],
        ]);

        $this->update($data);

        return $this;
    }
}
