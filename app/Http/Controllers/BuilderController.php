<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class BuilderController extends Controller
{
    public function create()
    {
        return view('builder')->with([
            'definition' => null,
        ]);
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'definition' => 'required|json'
        ]);

        dump($data['definition']);
    }
}
