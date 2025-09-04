<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class DisableWebRoutes
{
    public function handle(Request $request, Closure $next)
    {
        abort(404);
    }
}
