<x-mail::message>
# Database Upgrade


The database has been upgraded to version {{ $databaseUpgrade->version }}.

<div style="max-height: 500px; overflow: auto">
<x-mail::panel>
Successfully Upgraded Schools Database
</x-mail::panel>
<x-mail::table>
| School        | Domain        | View     |
| ------------- |:-------------:| --------:|
@foreach($success as $school)
|{{ $school['name'] }}|{{ $school['domain'] }}|<a href="{{ route('admin.schools.show', $school['id']) }}">Show</a>|
@endforeach
</x-mail::table>
</div>

<div style="max-height: 500px; overflow: auto">
<x-mail::panel>
Failed To Upgrade Schools Database
</x-mail::panel>
<x-mail::table>
| School        | Domain        | Message       | View     |
| ------------- |:-------------:|:-------------:| --------:|
@foreach($failed as $school)
|{{ $school['name'] }}|{{ $school['domain'] }}|<textarea>{!! str($school['error'])->remove(["\r", "\n"]) !!}</textarea>|<a href="{{ route('admin.schools.show', $school['id']) }}">Show</a>|
@endforeach
</x-mail::table>
</div>
</x-mail::message>
