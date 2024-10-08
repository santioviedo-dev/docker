<?php

namespace App\Http\Controllers;

use App\Models\Person;
use Illuminate\Support\Str;
use Illuminate\Support\Arr;

class PersonController extends Controller
{
    public function index()
    {
        $people = Person::all();
        return response()->json($people);
    }

    public function store()
    {
        $name = Str::random(10);
        $email = Str::lower($name) . '@' . Arr::random(['example.com', 'test.com', 'demo.com']);

        $person = Person::create([
            'name' => $name,
            'email' => $email,
        ]);
        return response()->json($person);
    }
}
