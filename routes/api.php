<?php

use App\Http\Controllers\PersonController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

Route::get('/', [PersonController::class, 'index']);
Route::get('/create', [PersonController::class, 'store']);
