<?php

namespace App\Http\Controllers\Admin\Settings;

use App\Http\Controllers\Controller;
use App\Models\Currency;
use App\Models\Gateway;
use Illuminate\Http\Request;
use Inertia\Inertia;

class GatewayController extends Controller
{
    public function index()
    {
        $gateways = Gateway::latest()->paginate(10);

        return Inertia::render('Admin/Settings/Gateway/Index', [
            'gateways' => $gateways
        ]);
    }

    public function create()
    {
        $currencies = Currency::selectRaw('code as title, id as value, rate, code')->get();

        return Inertia::render('Admin/Settings/Gateway/Create', [
            'currencies' => $currencies
        ]);
    }

    public function store(Request $request)
    {
        try {
            Gateway::createGateway($request);
            Session::flash('success', __("Gateway Created Successfully"));

            return to_route('admin.settings.gateways.index');
        }catch (Throwable $e){
            Session::flash('error', $e->getMessage());
        }
    }

    public function edit(Gateway $language)
    {
        return Inertia::render('Admin/Settings/Gateway/Edit', [
            'language' => $language
        ]);
    }

    public function update(Request $request, Gateway $language)
    {
        try {
            $language->updateGateway($request);

            Session::flash('success', __("Gateway Updated Successfully"));
            return to_route('admin.settings.gateways.index');
        }catch (Throwable $e){
            Session::flash('error', $e->getMessage());
        }
    }

    public function destroy(Gateway $language)
    {
        try {
            //TODO:: Remove comments after development complete
            /*$path = lang_path($language->code.'.json');
            if (File::exists($path)){
                File::delete($path);
            }*/

            $language->destroyGateway();

            Session::flash('success', __('Gateway Deleted Successfully'));
        }catch (Throwable $e){
            Session::flash('error', $e->getMessage());
        }
    }

    public function changeStatus(Request $request, Gateway $language)
    {
        $data = $request->validate([
            'is_active' => ['required', 'boolean']
        ]);

        try {
            $language->update([
                'is_active' => $data['is_active']
            ]);

            Session::flash('success', __("Gateway Status Changed Successfully"));
        } catch (Throwable $e) {
            Session::flash('error', $e->getMessage());
        }
    }

    public function changeDefault(Request $request, Gateway $language)
    {
        $data = $request->validate([
            'is_default' => ['required', 'boolean']
        ]);

        try {
            Gateway::updateDefaultGateways();
            $language->update([
                'is_default' => true
            ]);

            Session::flash('success', __("Gateway set as default"));
        } catch (Throwable $e) {
            Session::flash('error', $e->getMessage());
        }
    }

    public function editPhrases(Gateway $language)
    {
        $path = lang_path($language->code.'.json');
        if (!File::exists($path)){
            File::copy(lang_path(config('app.locale').'.json'), $path);
        }

        $phrases = json_decode(File::get($path));

        return Inertia::render('Admin/Settings/Gateway/Phrases', [
            'language' => $language,
            'phrases' => $phrases ?? []
        ]);
    }

    public function updatePhrases(Request $request, Gateway $language)
    {
        $request->validate([
            'phrases' => ['required', 'array'],
            'phrases.*' => ['required', 'string']
        ]);

        try {
            $path = lang_path($language->code.'.json');

            File::put($path, json_encode($request->phrases, JSON_PRETTY_PRINT));

            Session::flash('success', __("Phrases Updated Successfully"));

            return to_route('admin.settings.gateways.index');
        } catch (Throwable $e) {
            Session::flash('error', $e->getMessage());
        }
    }
}
