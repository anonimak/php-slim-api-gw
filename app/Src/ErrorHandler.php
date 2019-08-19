<?php
namespace App\Src;
use Psr\Http\Message\ResponseInterface as Response;

class ErrorHandler {

    private $data;
    private $responseHandler;

    public function __construct(\App\Src\ResponseHandler $responseHandler){
        $this->responseHandler = $responseHandler;
    }

    public function setData($data=[]){
        $this->data = $data;
    }

    public function send(Response $response){
        $payload = json_encode($this->data);
        $response->getBody()->write($payload);
        return $response
            ->withHeader('Content-Type', 'application/json')
            ->withStatus(500);
    }


}