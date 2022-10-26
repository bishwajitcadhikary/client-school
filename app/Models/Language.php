<?php

namespace App\Models;

use App\Space\Languages;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class Language extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public static function updateDefaultLanguages(): bool
    {
        $disks = self::get();

        foreach ($disks as $disk) {
            $disk->is_default = false;
            $disk->save();
        }

        return true;
    }

    public static function createLanguage(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'string', Rule::unique('languages')],
            'code' => ['required', 'string', Rule::unique('languages')],
            'is_active' => ['required', 'boolean'],
            'is_default' => ['required', 'boolean'],
        ]);

        if ($request->is_default) {
            self::updateDefaultLanguages();
        }

        return self::create([
            'name' => Languages::getByCode($data['name'])['name'],
            'code' => $data['code'],
            'is_active' => $data['is_active'],
            'is_default' => $data['is_default'],
        ]);
    }

    public function updateLanguage(Request $request)
    {
        $data = $request->validate([
            'name' => ['required', 'string', Rule::unique('languages')->ignore($this->id)],
            'is_active' => ['required', 'boolean'],
            'is_default' => ['required', 'boolean'],
        ]);

        if (! $this->is_default) {
            if ($request->is_default) {
                self::updateDefaultLanguages();
            }

            $data['is_default'] = $request->is_default;
        }

        $this->update([
            'name' => $data['name'],
            'is_active' => $data['is_active'],
            'is_default' => $data['is_default'],
        ]);

        return $this;
    }

    public function destroyLanguage(): bool
    {
        if (\File::exists(lang_path($this->code.'.json'))) {
            \File::delete(lang_path($this->code.'.json'));
        }

        $this->delete();

        return true;
    }
}
