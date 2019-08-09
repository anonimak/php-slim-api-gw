<?php

use DI\Container;
use Monolog\Handler\StreamHandler;
use Monolog\Logger;
use Monolog\Processor\UidProcessor;
use Slim\App;

return function (App $app) {
    /** @var Container $container */
    $container = $app->getContainer();

    $container->set("monolog", function (Container $c) {
        $settings = $c->get('settings');

        $loggerSettings = $settings['logger'];
        $logger = new Logger($loggerSettings['name']);

        $processor = new UidProcessor();
        $logger->pushProcessor($processor);

        $handler = new StreamHandler($loggerSettings['path'], $loggerSettings['level']);
        $logger->pushHandler($handler);

        return $logger;
    });


    // PDO Connection
    $container->set("pdo", function (Container $c){
        
        $settings = $c->get('settings');
        $dbsetting = $settings['db'];

        $dsn = "mysql:host=$dbsetting[dbhost];dbname=$dbsetting[dbname];charset=utf8";
        $usr = $dbsetting['username'];
        $pwd = $dbsetting['password'];

        return new \FaaPz\PDO\Database($dsn, $usr, $pwd);
    });
};
