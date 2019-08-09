<?php 
namespace Interfaces;

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use DI\Container;

interface ControllerInterfaces{
    
    function __invoke(Request $request, Response $response, $arg);
    function getData(Request $request, Response $response, $arg);
    // function addData();
    // function setData();
    // function deleteData();
}