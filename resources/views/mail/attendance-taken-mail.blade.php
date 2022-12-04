<x-mail::message>
    <x-mail::header>
        Attendance Taken
    </x-mail::header>

    <x-mail::body>
        <p>Hi {{ $user->name }},</p>

        <p>Attendance has been taken for the {{ $attendance->date->format('l, F jS') }} class.</p>

        <p>View the attendance <a href="{{ route('attendance.show', $attendance) }}">here</a>.</p>
    </x-mail::body>

Thanks,<br>
{{ config('app.name') }}
</x-mail::message>
