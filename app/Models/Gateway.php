<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Http\Request;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Gateway extends Model implements HasMedia
{
    use HasFactory, InteractsWithMedia;

    protected $guarded = ['id'];

    protected $appends = ['logo', 'logo_path'];

    public function currency(): BelongsTo
    {
        return $this->belongsTo(Currency::class);
    }

    protected function charge(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value / 100,
            set: fn ($value) => $value * 100,
        );
    }

    protected function minAmount(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value / 100,
            set: fn ($value) => $value * 100,
        );
    }

    protected function maxAmount(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value / 100,
            set: fn ($value) => $value * 100,
        );
    }

    public static function createGateway(Request $request): Gateway
    {
        $data = $request->validate([
            'name' => ['required', 'string'],
            'currency' => ['required', 'exists:currencies,id'],
            'charge' => ['required', 'numeric'],
            'is_active' => ['boolean'],
        ]);
        $data['currency_id'] = $data['currency'];

        return self::create($data);
    }

    public function getLogoPathAttribute()
    {
        $logo = $this->getMedia('logo')->first();

        $isSystem = FileDisk::whereSetAsDefault(true)->first()->isSystem();

        if ($logo) {
            if ($isSystem) {
                return $logo->getPath();
            } else {
                return $logo->getFullUrl();
            }
        }

        return null;
    }

    public function getLogoAttribute()
    {
        $logo = $this->getMedia('logo')->first();

        if ($logo) {
            return $logo->getFullUrl();
        }

        return null;
    }
}
