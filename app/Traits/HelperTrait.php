<?php

namespace App\Traits;

use App\Models\Question;
use Illuminate\Http\Request;
use App\Models\Subject;


trait HelperTrait
{
    public function processSubjects(Request $request){

        $orderDirection = $request->query('direction', 'desc');

        $orderColumn = $request->query('column', 'id');

        $totalPerPage = $request->query('per_page', 3);

        // $subjects = Subject::all();

        // $subjects = Subject::orderBy('created_at', 'desc')->get();

        $subjects = Subject::orderBy($orderColumn, $orderDirection)->paginate( $totalPerPage);


        return response() ->json(['Success'=> $subjects], status: 200);
    }

    public function processQuestions(Request $request){

        $orderDirection = $request->query('direction', 'desc');

        $orderColumn = $request->query('column', 'id');

        $totalPerPage = $request->query('per_page', 3);

        // $subjects = Subject::all();

        // $subjects = Subject::orderBy('created_at', 'desc')->get();

        $questions = Question::orderBy($orderColumn, $orderDirection)->paginate( $totalPerPage);


        return response() ->json(['Success'=> $questions], status: 200);
    }

}
