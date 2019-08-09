<?php
use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\Middleware\RoutingMiddleware;
use Slim\Middleware\MethodOverrideMiddleware;
use Slim\Factory\AppFactory;
use DI\Container;

require __DIR__ . '/../vendor/autoload.php';

// Instantiate PHP-DI Container
$container = new Container();
// Instantiate the app
AppFactory::setContainer($container);
$app = AppFactory::create();

// $routeResolver = $app->getRouteResolver();
// $routingMiddleware = new RoutingMiddleware($routeResolver);
// $app->add($routingMiddleware);

$methodOverrideMiddleware= new MethodOverrideMiddleware;
$app->add($methodOverrideMiddleware);

$app->addRoutingMiddleware();
$routeCollector = $app->getRouteCollector();

// Set up settings
$settings = require __DIR__ . '/../core/settings.php';
$settings($app);

// Set up dependencies
$dependencies = require __DIR__ . '/../core/dependencies.php';
$dependencies($app);

// Register middleware
$middleware = require __DIR__ . '/../core/middleware.php';
$middleware($app);

// Set up repositories
$repositories = require __DIR__ . '/../core/repositories.php';
$repositories($app);

// Register routes
$routes = require __DIR__ . '/../core/routes.php';
$routes($app);

$errorMiddleware = $app->addErrorMiddleware(true, true, true);

// Run App
$app->run();
