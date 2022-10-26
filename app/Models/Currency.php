<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Casts\Attribute;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Validation\Rule;

class Currency extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    protected function rate(): Attribute
    {
        return Attribute::make(
            get: fn ($value) => $value / 100,
            set: fn ($value) => $value * 100,
        );
    }

    public static function createCurrency(Request $request): Currency
    {
        $data = $request->validate([
            "name" => ['required', 'string', Rule::unique('currencies')],
            "code" => ['required', 'string', Rule::unique('currencies')],
            "rate" => ['required', 'numeric'],
            "symbol" => ['required', 'string'],
            "precision" => ['required', 'integer'],
            "thousand_separator" => ['required', 'string'],
            "decimal_separator" => ['required', 'string'],
            "swap_currency_symbol" => 'nullable', ['boolean'],
            "is_active" => ['nullable', 'boolean'],
            "is_default" => ['nullable', 'boolean'],
        ]);

        if ($request->is_default) {
            self::updateDefaults();
        }

        return self::create($data);
    }

    public function updateCurrency(Request $request)
    {
        $data = $request->validate([
            "name" => ['required', 'string', Rule::unique('currencies')->ignore($this->id)],
            "code" => ['required', 'string', Rule::unique('currencies')->ignore($this->id)],
            "rate" => ['required', 'numeric'],
            "symbol" => ['required', 'string'],
            "precision" => ['required', 'integer'],
            "thousand_separator" => ['required', 'string'],
            "decimal_separator" => ['required', 'string'],
            "swap_currency_symbol" => 'nullable', ['boolean'],
            "is_active" => ['nullable', 'boolean'],
            "is_default" => ['nullable', 'boolean'],
        ]);

        if (! $this->is_default) {
            if ($request->is_default) {
                self::updateDefaults();
            }

            $data['is_default'] = $request->is_default;
        }

        $this->update($data);

        return $this;
    }

    public static function updateDefaults(): bool
    {
        $currencies = self::get();

        foreach ($currencies as $currency) {
            $currency->is_default = false;
            $currency->save();
        }

        return true;
    }

    public static function sync()
    {
        $defaultCurrency = Currency::whereIsDefault(1)->firstOrFail();
        $allCurrencies = Currency::whereNotIn('is_default', [1])->pluck('code');

        if ($allCurrencies->count() > 0 ){
            $allCurrencies = $allCurrencies->map(fn($currency) => $currency)->implode(',');

            $curl = curl_init();

            curl_setopt_array($curl, array(
                CURLOPT_URL => "https://api.apilayer.com/exchangerates_data/latest?symbols=".$allCurrencies."&base=".$defaultCurrency->code,
                CURLOPT_HTTPHEADER => array(
                    "Content-Type: text/plain",
                    "apikey:".config('wovo.api_layer_key')
                ),
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => "",
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => "GET"
            ));

            $response = curl_exec($curl);
            curl_close($curl);

            $response = json_decode($response, true);

            if (isset($response['success'])){
                foreach ($response['rates'] as $code => $rate) {
                    Currency::whereCode($code)->first()->update([
                        'rate' => round($rate, 2)
                    ]);
                }

                Setting::setSetting('currency_last_sync_at', now());

                Session::flash('success', __('Currency Synced Successfully'));

                return true;
            }


            Session::flash('success', __('Currency Synced Failed'));

            return false;
        }
    }
}
