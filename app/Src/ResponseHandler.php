<?php

namespace App\Src;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use Slim\Psr7\Response;

class ResponseHandler {

    private $data;
    private $code;


    public function __construct($data=[], $code=200){
        $this->data = $data;
        $this->code = $code;
        $this->send_payload();
    }

    private function send_payload(Request $request, Response $response){

        $payload = json_encode($this->data);
        $response->getBody()->write($payload);
        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus($this->code);
    }

}
