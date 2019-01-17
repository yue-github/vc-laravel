<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::post('user/login', 'PassportController@login');
Route::post('user/register', 'PassportController@register');
Route::get('Index/getTops', 'IndexController@getTops');
 // 普通测试测试接口
Route::any('test','Test@test');
 // vc测试测试接口
Route::any('vcTest','VcTest@vc');

 

// 组
Route::group(['middleware' => 'auth:api'], function(){
    Route::post('info', 'PassportController@getDetails');
    // 重置密码
    Route::post('auth/resetPassSms', 'Auth\ResetPasswordController@resetPassword');
    // 组织调用接口
    Route::post('institution/getMyIns', 'OrganizationController@getMyIns');
    Route::post('institution/getAuthority', 'OrganizationController@getAuthority');
    Route::post('institution/addIns', 'OrganizationController@addIns');
    Route::post('institution/updateIns', 'OrganizationController@updateIns');
 
});