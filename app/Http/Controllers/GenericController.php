<?php

namespace App\Http\Controllers;
//use view\displayTokens;

use App\Models\User;
use Illuminate\Http\Request;
//use Laravel\Passport\HasApiTokens;


class GenericController extends Controller
{
    public function landing(Request $request){

        return view(view:'landing');
    }

    public function generateToken(Request $request){

       // dd('generateToken', $request->all());

       if(auth()->user()->hasRole('admin')){

        $user = User::find(auth()->id());


        $tokenName = $request->name? $request->name:$user->name.'\'s Token';

        $token = $user->createToken($tokenName)->accessToken; //criacao do token

       return view('displayTokens', compact('token'));
    //    return redirect()->to('/admin/oauth-access-tokens')->with(['token'=>$token]);
     }else{
        //TODO: erro que indica que o user não tem permissao para gerar o token'

        dd('Error: Nao tem permissao para gerar o token');
     }
    }
}
