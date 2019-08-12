<?php 
namespace App\Controllers;

use App\Interfaces\ControllerInterfaces;

class CobaCtrls implements ControllerInterfaces
{
    public function __invoke($request,$response, $arg)
    {
        $response->getBody()->write("oke sip");
        return $response;
    }

    public function getData($request,$response, $arg)
    {
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
    }
    
    public function home($request,$response, $arg){
        $response->getBody()->write($arg['home']);
        return $response;
    }
}
