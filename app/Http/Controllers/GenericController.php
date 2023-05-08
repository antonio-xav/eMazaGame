<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Laravel\Passport\HasApiTokens;


class GenericController extends Controller
{
    public function landing(Request $request){

        return view(view:'landing');
    }

    public function generateToken(Request $request){

       if(auth()->user()->hasRole('admin')){

        $user = User::find(auth()->id());



        $token = $user->createToken($user->name.'\'s Token')->accessToken;

        dd($token);
     }else{
        //TODO: erro que indica que o user não tem permissao para gerar o token'

        dd('Error: Nao tem permissao para gerar o token');
     }
    }
}
