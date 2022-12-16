<?php

namespace App\Models\Sass;

use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Enroll extends Model
{
    use HasFactory;

    protected $table = 'enroll';

    protected $connection = 'school';

    public function student(): BelongsTo
    {
        return $this->belongsTo(Student::class, 'student_id');
    }

    public function theClass(): BelongsTo
    {
        return $this->belongsTo(Classes::class, 'class_id');
    }

    public function section(): BelongsTo
    {
        return $this->belongsTo(Section::class, 'section_id');
    }

    public function branch(): BelongsTo
    {
        return $this->belongsTo(Branch::class, 'branch_id');
    }

    public function session(): BelongsTo
    {
        return $this->belongsTo(SchoolYear::class, 'session_id', 'id');
    }

    public static function attendants($today, $sessionId): Builder|Enroll
    {
        return Enroll::whereHas('session', function ($query) use ($sessionId) {
            $query->where('id', $sessionId);
        })
            ->leftJoin('student', function ($join) {
                $join->on('student.id', '=', 'enroll.student_id');
            })
            ->leftJoin('student_attendance', function ($join) use ($today) {
                $join->on('student_attendance.student_id', '=', 'enroll.student_id')
                    ->whereDate('student_attendance.date', '=', $today);
            })
            ->selectRaw(
                'enroll.student_id,
            enroll.branch_id,
            student.register_no,
            student_attendance.id as att_id,
            student_attendance.status as att_status,
            student_attendance.remark as att_remark'
            );
    }
}
