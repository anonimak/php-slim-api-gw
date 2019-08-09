<?php

use Slim\App;
use Slim\Interfaces\RouteCollectorProxyInterface as Group;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use Slim\Psr7\Response;
use DI\Container;
use App\controller\ControllerNews;

return function (App $app) {

    $container = $app->getContainer();

    $app->group('/api', function (Group $group) use ($container){
        $group->get('/test','App\controller\ControllerNews');

        $group->group('/v1', function (Group $group) use ($container){

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
            
        });
    });

    $app->group('/users', function (Group $group) use ($container) {
        // $group->get('', ListUsersAction::class);
        // $group->get('/{id}', ViewUserAction::class);

        $group->get('/test', function ($request, $response, $args) {
            $logger = $this->get("monolog");
            $pdo = $this->get("pdo");
            // SELECT * FROM users WHERE id = ?
            $selectStatement = $pdo->select()
                            ->from('sysware_news');

            $stmt = $selectStatement->execute();
            $data = $stmt->fetchAll();

            $logger->info("Oke.");
            $payload = json_encode($data);
            $response->getBody()->write($payload);
            return $response
                ->withHeader('Content-Type', 'application/json')
                ->withStatus(200);
        });

        $group->patch('/edit', function($request, $response, $args){
            $headerValueArray = $request->getHeader('Authorization');
            
            $parsedBody = $request->getBody()->getContents();
            parse_str($parsedBody,$new);

            $payload = json_encode($headerValueArray);
            $response->getBody()->write($payload);
            return $response
                ->withHeader('Content-Type', 'application/json')
                ->withStatus(200);
        });

    });

    $app->get('/edit', function ($request, $response, $args) {
        $data = $request->getParsedBody();
        var_dump($data);
        return $response;
            // $response->getBody()->write($data);
            // return $response
            //     ->withHeader('Content-Type', 'application/json')
            //     ->withStatus(200);
    });




    // $app->map(['GET', 'POST', 'PUT', 'DELETE', 'PATCH'], '/{routes:.+}', function ($request, $response) {
    //     throw new HttpNotFoundException($request);
    // });
    
};