<?php

use App\Http\Controllers\QuestionController;
use App\Http\Controllers\SubjectController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
//use Laravel\Passport\HasApiTokens;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!

Essas routas se testam de forma diferente: devem ser testadas baixando o postman.
apiResources define todos metodos necessarios para todas operacoes do CRUD.

|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {

//     Route::get('/user', function (Request $request){



//     return $request->user();
// });


// // Route::get('/subjects', [SubjectController::class, 'getData']);

// // Route::get('/questions', [QuestionController::class, 'getData']);
// });
Route::middleware('auth:api')->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    Route::apiResources([
        //registro automatico das rotas de recursos
        'subjects'=> SubjectController::class, // operações CRUD em relação aos "Disciplinas" serão direcionadas para o controlador "SubjectController"
        'questions'=>QuestionController::class,  // operações CRUD em relação aos "Perguntas" serão direcionadas para o controlador "QuestionController"
    ]);
});



















// Route::group(['middleware' => 'auth:api'], function () {
//     Route::get('/user', function (Request $request) {
//         return $request->user();
//     });

//     Route::apiResources([
//         //registro automatico das rotas de recursos
//         'subjects'=> SubjectController::class, // operações CRUD em relação aos "Disciplinas" serão direcionadas para o controlador "SubjectController"
//         'questions'=>QuestionController::class,  // operações CRUD em relação aos "Perguntas" serão direcionadas para o controlador "QuestionController"
//     ]);
// });


// Route::middleware('auth')->group( function (Request $request) {
//     Route::resource('subjects', SubjectController::class);


// });





