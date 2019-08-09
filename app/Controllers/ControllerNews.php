<?php 
namespace App\Controller;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use DI\Container;

class ControllerNews
{
    function __invoke(Request $request, Response $response, $arg){

    }
    function getData(Request $request, Response $response, $arg){
        $response->getBody()->write("oke sip");
                return $response
                    ->withHeader('Content-Type', 'application/json')
                    ->withStatus(200);
    }
}
