<?php
namespace App\Src;

use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface as RequestHandler;
use Slim\Psr7\Response;

// validation
use Sirius\Validation\RuleFactory;
use Sirius\Validation\ErrorMessage;
use Sirius\Validation\Validator;

// Dependency Injection
use DI\Container;

class Controller{

    private $datavalidate;
    public $errorHandler;

    public function __construct(Container $container, \App\Src\ErrorHandler $errorHandler){
        $this->container = $container;
        $this->errorHandler = $errorHandler;
        // validate
        $ruleFactory = new RuleFactory;
        $errorMessagePrototype = new ErrorMessage;
        $this->validator = new Validator($ruleFactory, $errorMessagePrototype);
    }

    public function addValidate($data){
        $this->validator->add($data);
    }

    public function validate($data_post){

        parse_str($data_post,$validate_data);

        if ($this->validator->validate($validate_data)) {
        } else {
            // send the error messages to the view
            return $this->validator->getMessages();
        }
    }

    public function sendResponse(){

    }

    public function sendError(){
        return $this->container->get('errorHandler');
    }

    public function response($payload){
        if ($payload) {
            $this->send_payload($payload);
        } else {
            $this->no_data();
        }
    }
}