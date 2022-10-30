<x-mail::message>
# New Account Created

Here is your login information:

Email: {{ $email }}
Password: {{ $password }}

<x-mail::button :url="route('login')">
Login
</x-mail::button>

Thanks,<br>
{{ config('app.name') }}
</x-mail::message>
