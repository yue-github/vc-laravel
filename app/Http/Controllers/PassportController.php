<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Support\Facades\Auth;
use Validator;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Db;

class PassportController extends Controller
{

    public $successStatus = 200;
    // private $user="";
    /**
     * login api
     *
     * @return \Illuminate\Http\Response
     */
      function __construct(){
        date_default_timezone_set("PRC");
    }
    public function login(){
        // echo 'hello';
        // $auth=Auth::attempt(['mobile' => request('mobile'), 'password' => request('password')]);
        // echo json_encode($auth);
        if(Auth::attempt(['mobile' => request('phone'), 'password' => request('password')])){
            $user = Auth::user();
            $token = $user->createToken('MyApp')->accessToken;
            // 获取user表的内容并做相应的更改，达到前端返回数据要求的格式
            $userMsg=DB::table('users')->where(['mobile'=>request('phone')])->get(["id",'email','avatar','created_at','updated_at']);
            $userMsg=json_decode($userMsg,true);
            $userMsg[0]['name']=request('phone');
            $userMsg[0]['phone']=request('phone');
            
            return response()->json(['status'=>200,'msg'=>'登录成功','user'=> $userMsg[0],'token' => $token], $this->successStatus);
        }
        else{
            return response()->json(['error'=>'Unauthorised'], 401);
        }
    }

    /**
     * Register api
     *
     * @return \Illuminate\Http\Response
     */
    public function register(Request $request)
    {
        // $mobile=request("mobile");
        // $boo=DB::table("users")->where("mobile",$mobile)->get(["mobile"]);
        // if(!$boo->isEmpty()){
        //      return json_encode(['status'=>503,'msg'=>'用户已存在','ok'=>false]);
        // }
        
        $validator = Validator::make($request->all(), [
            // 'uname' => 'required',
            'mobile' => 'required',
            'password' => 'required',

            // 'c_password' => 'required|same:password'
        ]);

        if ($validator->fails()) {
            return response()->json(['error'=>$validator->errors()], 401);            
        }

        $input = $request->all();
        $input['password'] = bcrypt($input['password']);
        $user = User::create($input);
        $success['token'] =  $user->createToken('MyApp')->accessToken;

        DB::table("users")->where(['mobile'=>request('mobile')])->update(['avatar'=>'uploads/user_logo.jpg']);
        $userMsg=DB::table('users')->where(['mobile'=>request('mobile')])->get(["id",'email','avatar','created_at','updated_at']);
        $userMsg=json_decode($userMsg,true);
        $userMsg[0]['name']=request('mobile');
        $userMsg[0]['phone']=request('mobile');
        
        return response()->json(['status'=>200,'user'=>$userMsg[0],'success'=>$success], $this->successStatus);
    }

    /**
     * details api
     *
     * @return \Illuminate\Http\Response
     */
    public function getDetails()
    {
        $user = Auth::user();
        return response()->json(['success' => $user], $this->successStatus);
    }
}