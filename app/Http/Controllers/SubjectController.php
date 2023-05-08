<?php

namespace App\Http\Controllers;

use App\Traits\HelperTrait;
use Illuminate\Http\Request;
use Laravel\Passport\HasApiTokens;

use App\Models\Subject;

class SubjectController extends Controller
{
    use HelperTrait;

    public function index(Request $request){

        return $this->processSubjects($request);

    }

    public function store(Request $request){
        return response() ->json(['error'=>'Do momento nao e possivel adicionar  Disciplinas'], status: 403);
    }

    public function show (Request $request, Subject $subject){
        return response() ->json(['error'=>'Do momento, nao e possivel mostrar detalhes da Disciplinas'], status: 403);
    }

    public function update (Request $request, Subject $subject){
        return response() ->json(['error'=>'Do momento, nao e possivel actualizar a Disciplinas'], status: 403);
    }

    public function destroy (Request $request, Subject $subject){
        return response() ->json(['error'=>'Do momento, nao e possivel remover a Disciplinas'], status: 403);
    }
}
