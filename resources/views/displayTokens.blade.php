@extends('voyager::master')

@section('content')

<div style="padding: 30px">

    <h1>Token Criado:</h1>

<div style="font-size: 16pt; color: red; font-weight: bold">
    <span>Atenção: Copie e conserve esse token num locar seguro, pois não será mostrado novamente!!</span>
</div>

<div style="margin: 20px 0; font-size: 14pt">
    <p>
        {{ $token }}
    </p>

</div>

</div>
@endsection
