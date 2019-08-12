<?php 
namespace App\Controllers;

class CobaCtrls
{
    public function __invoke($request,$response, $arg)
    {
        $response->getBody()->write("oke sip");
        return $response;
    }

    public function home($request,$response, $arg)
    {
        $response->getBody()->write("oke home");
        return $response;
    }
}
