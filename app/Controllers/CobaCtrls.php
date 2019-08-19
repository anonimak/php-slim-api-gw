<?php 
namespace App\Controllers;

use App\Interfaces\ControllerInterfaces;
use App\Src\Controller;

class CobaCtrls extends Controller implements ControllerInterfaces
{

    public function __invoke($request,$response, $arg)
    {
        $response->getBody()->write("oke sip");
        return $response;
    }

    public function getData($request,$response, $arg)
    {
        $pdo = $this->container->get("pdo");
            // SELECT * FROM users WHERE id = ?
            $selectStatement = $pdo->select()
                            ->from('news')
                            ->where('id', '=', 1234);

            $stmt = $selectStatement->execute();
            $data = $stmt->fetchAll();

            $payload = json_encode($data);
            $response->getBody()->write($payload);
            return $response
                ->withHeader('Content-Type', 'application/json')
                ->withStatus(200);
    }

    public function setData($request,$response, $arg){
        $this->role_validate();
        $parsedBody = $request->getBody()->getContents();

        $data = $this->validate($parsedBody);
        if(!$data){
            $this->sendResponse($data);
        } else {
            $this->errorHandler->setData($data);
            return $this->errorHandler->send($response);
        }
    }

    private function role_validate(){
        // validasi disini
        // $validator->add($selector, $name = null, $options = null, $messageTemplate = null, $label = null);
        // examples
        $this->validator->add('username', 'required', null, ' Username is required.');
        $this->validator->add('password', 'required', null, ' Password is required.');
        $this->validator->add('password', 'minLength', array('min' => 6), '{label} must have at least {min} characters', 'Password');
        $this->validator->add('additional_emails[*]', 'email', array(), 'Email address is not valid');
    }
}
