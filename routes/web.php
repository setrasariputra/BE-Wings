<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

$router->group(['prefix' => 'api'], function () use ($router) {
    //$router->get('/v1/pwd', 'AuthController@Pwd');
    $router->post('/v1/login', 'AuthController@Login');


    $router->group(['middleware' => 'auth'], function () use ($router) {
        $router->get('/v1/logout', 'AuthController@Logout');
        // products
        $router->get('/v1/products', 'ProductController@Read');
        $router->post('/v1/product/store', 'ProductController@Store');
        $router->post('/v1/product/update', 'ProductController@Update');
        $router->get('/v1/product/delete/{id}', 'ProductController@Delete');
        $router->post('/v1/product/image/store/{id}', 'ProductController@StoreImage');

        // transactions
        $router->get('/v1/transaction', 'TransactionController@Read');
        $router->post('/v1/transaction/checkout', 'TransactionController@Checkout');
    });
});
