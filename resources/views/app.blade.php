<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title inertia>{{ config('app.name', 'Laravel') }}</title>

        <!-- Scripts -->
        @routes
        @vite('resources/js/app.js')
        @inertiaHead

        <link rel="stylesheet" type="text/css" href="{{ asset('loader.css') }}" />
    </head>
    <div id="app" data-page="{{ json_encode($page) }}">
        <div id="loading-bg">
        {{--    <div class="loading-logo">
                <img src="{{ asset('static/logo.jpg') }}" height="50" alt="Logo" />
            </div>--}}
            <div class="loading">
                <div class="effect-1 effects"></div>
                <div class="effect-2 effects"></div>
                <div class="effect-3 effects"></div>
            </div>
        </div>
    </div>

    <script>
        const loaderColor = localStorage.getItem('Materio-initial-loader-bg') || '#FFFFFF'
        const primaryColor = localStorage.getItem('Materio-initial-loader-color') || '#9155FD'

        if (loaderColor)
            document.documentElement.style.setProperty('--initial-loader-bg', loaderColor)
        if (primaryColor)
            document.documentElement.style.setProperty('--initial-loader-color', primaryColor)

    </script>
</html>
