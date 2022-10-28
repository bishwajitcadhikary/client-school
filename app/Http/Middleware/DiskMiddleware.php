<?php

namespace App\Http\Middleware;

use App\Models\FileDisk;
use Closure;
use Illuminate\Http\Request;

class DiskMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse)  $next
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if ($request->has('file_disk_id')) {
            $file_disk = FileDisk::find($request->file_disk_id);
        } else {
            $file_disk = FileDisk::whereSetAsDefault(true)->first();
        }

        if ($file_disk) {
            $file_disk->setConfig();
        }

        return $next($request);
    }
}
