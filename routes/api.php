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
    // 获取权限数据
    Route::post('institution/getAuthority', 'OrganizationController@getAuthority');
    // 获取未读消息
    Route::post('institution/getUnReads', 'UserController@getUnReads');
    // 获取首页初始数据展示，数据看板
    Route::post('institution/getDataStatis', 'DashboardController@getDataStatis');
    // 与我相关
    Route::post('institution/getMyRelation', 'DashboardController@getMyRelation');
    // 工作统计
    Route::post('institution/getWorkStatis', 'DashboardController@getWorkStatis');
    // 系统日志
    Route::post('institution/getSysLog', 'DashboardController@getSysLog');
    // 文件的增删改查
    Route::post('file/fileList', 'FilesController@fileList');
    Route::post('file/delectFile', 'FilesController@delectFile');
    Route::post('file/ceateFile', 'FilesController@ceateFile');
    Route::post('file/updateFile', 'FilesController@updateFile');
    Route::post('file/uploadFile', 'FilesController@uploadFile');
    // 角色增删改查
    Route::post('role/getRoles', 'RolesController@getRoles');
    Route::post('role/getRoleUsers', 'RolesController@getRoleUsers');
    // 角色权限管理
    Route::post('role/authListForId', 'RolesController@authListForId');
    // 更新权限数据
    Route::post('role/updatePermissions', 'RolesController@updatePermissions');
    // 项目模块
    // 项目信息获取
    Route::post('project/getInfo', 'ProjectController@getInfo');
    // 项目添加
    Route::post('project/add', 'ProjectController@add');
    // 获取筛选节点
    Route::post('project/getFilterParam', 'ProjectController@getFilterParam');
    // 获取相关数据
    Route::post('project/getData', 'ProjectController@getData');
    // 获取相关文档
    Route::post('project/getFile', 'ProjectController@getFile');
    // 获取相关任务
    Route::post('project/tasks', 'ProjectController@tasks');
    // 增加行业领域
    Route::post('project/addProCates', 'ProjectController@addProCates');
    // 更新行业领域
    Route::post('project/updateProCates', 'ProjectController@updateProCates');
    // 删除行业领域
    Route::post('project/delProCates', 'ProjectController@delProCates');
    // 删除项目
    Route::post('project/delete', 'ProjectController@delete');
    
    
    
    

    // 任务添加
    Route::post('task/createTask', 'TaskController@createTask');
    // 任务获取
    Route::post('task/getTaskList', 'TaskController@getTaskList');
    // 任务详情
    Route::post('task/taskinfo', 'TaskController@taskinfo');
    // 删除任务
    Route::post('task/deleteTask', 'TaskController@deleteTask');
    Route::post('task/users', 'TaskController@users');
    // 获取任务用户
    
    
    
    


    
 
});