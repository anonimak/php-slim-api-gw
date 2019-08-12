<?php
namespace App\Routes;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use Slim\Psr7\Response;
use Slim\Interfaces\RouteCollectorProxyInterface as Group;

class NewsRoute{
    public function __invoke(Group $group){

        $group->get('/coba',\App\Controllers\CobaCtrls::class. ":getData");
        $group->get('/',\App\Controllers\CobaCtrls::class);
        $group->get('/home/{home}',\App\Controllers\CobaCtrls::class. ":home");

        $group->get('/test', function ($request, $response, $args) {
            $response->getBody()->write("oke sip");
            return $response
                ->withHeader('Content-Type', 'application/json')
                ->withStatus(200);
        })->add(function (Request $request, RequestHandler $handler) {
            $response = $handler->handle($request);
            $existingContent = (string) $response->getBody();
        
            $response = new Response();
            $response->getBody()->write('BEFORE ' . $existingContent);
        
            return $response;
        });
        
    }
}
