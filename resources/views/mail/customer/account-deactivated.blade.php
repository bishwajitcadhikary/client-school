<x-mail::message>
# We're sad to see you go.

We canceled your {{ auth()->user()->plan->name }} subscription which will end on {{ \App\Space\Wovo::formatDate(auth()->user()->plan_expire_at)  }}}.

When your account deactivates, you will no longer be able to access your account or any of your data. If you change your mind, you can reactivate your account at any time.

<x-mail::button url="/contact">
Contact Support
</x-mail::button>

Thanks,<br>
{{ config('app.name') }}
</x-mail::message>
