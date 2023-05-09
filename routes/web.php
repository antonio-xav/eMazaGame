<?php

use App\Http\Controllers\GenericController;
use Illuminate\Support\Facades\Route;
//use Laravel\Passport\HasApiTokens;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/',[GenericController::class,'landing']);

Route::get('/generate-token',[GenericController::class,'generateToken']);


Route::group(['prefix' => 'admin'], function () {

   Voyager::routes();

Route::post('/oauth-access-tokens',[GenericController::class, 'generateToken'])->name('voyager.oauth-access-tokens.store');
});
