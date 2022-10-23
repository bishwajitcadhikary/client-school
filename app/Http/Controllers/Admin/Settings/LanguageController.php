<?php

namespace App\Http\Controllers\Admin\Settings;

use App\Http\Controllers\Controller;
use App\Models\Language;
use App\Space\Languages;
use App\Space\Wovo;
use File;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Inertia\Inertia;
use Session;
use Throwable;

class LanguageController extends Controller
{
    public function index()
    {
        $languages = Language::latest()->paginate();

        return Inertia::render('Admin/Settings/Language/Index', [
            'languages' => $languages
        ]);
    }

    public function create()
    {
        $languages = Languages::getLanguagesArray();

        return Inertia::render('Admin/Settings/Language/Create', [
            'languages' => $languages
        ]);
    }

    public function store(Request $request)
    {
        try {
            Language::createLanguage($request);
            Session::flash('success', __("Language Created Successfully"));

            return to_route('admin.settings.languages.index');
        }catch (Throwable $e){
            Session::flash('error', $e->getMessage());
        }
    }

    public function edit(Language $language)
    {
        return Inertia::render('Admin/Settings/Language/Edit', [
            'language' => $language
        ]);
    }

    public function update(Request $request, Language $language)
    {
        try {
            $language->updateLanguage($request);

            Session::flash('success', __("Language Updated Successfully"));
            return to_route('admin.settings.languages.index');
        }catch (Throwable $e){
            Session::flash('error', $e->getMessage());
        }
    }

    public function destroy(Language $language)
    {
        try {
            //TODO:: Remove comments after development complete
            /*$path = lang_path($language->code.'.json');
            if (File::exists($path)){
                File::delete($path);
            }*/

            $language->destroyLanguage();

            Session::flash('success', __('Language Deleted Successfully'));
        }catch (Throwable $e){
            Session::flash('error', $e->getMessage());
        }
    }

    public function changeStatus(Request $request, Language $language)
    {
        $data = $request->validate([
            'is_active' => ['required', 'boolean']
        ]);

        try {
            $language->update([
                'is_active' => $data['is_active']
            ]);

            Session::flash('success', __("Language Status Changed Successfully"));
        } catch (Throwable $e) {
            Session::flash('error', $e->getMessage());
        }
    }

    public function changeDefault(Request $request, Language $language)
    {
        $data = $request->validate([
            'is_default' => ['required', 'boolean']
        ]);

        try {
            Language::updateDefaultLanguages();
            $language->update([
                'is_default' => true
            ]);

            Session::flash('success', __("Language set as default"));
        } catch (Throwable $e) {
            Session::flash('error', $e->getMessage());
        }
    }

    public function editPhrases(Language $language)
    {
        $path = lang_path($language->code.'.json');
        if (!File::exists($path)){
            File::copy(lang_path(config('app.locale').'.json'), $path);
        }

        $phrases = json_decode(File::get($path));

        return Inertia::render('Admin/Settings/Language/Phrases', [
            'language' => $language,
            'phrases' => $phrases ?? []
        ]);
    }

    public function updatePhrases(Request $request, Language $language)
    {
        $request->validate([
            'phrases' => ['required', 'array'],
            'phrases.*' => ['required', 'string']
        ]);

        try {
            $path = lang_path($language->code.'.json');

            File::put($path, json_encode($request->phrases, JSON_PRETTY_PRINT));

            Session::flash('success', __("Phrases Updated Successfully"));

            return to_route('admin.settings.languages.index');
        } catch (Throwable $e) {
            Session::flash('error', $e->getMessage());
        }
    }
}
