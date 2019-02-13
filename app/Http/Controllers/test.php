<?php
/**
 * 测试接口
 */

namespace App\Http\Controllers;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Db;

class Test extends Controller
{
    public function test(){
       // $this->delete();
       // $this->insert();
       // $this->select();
       // $this->update();
       // $this->select();
      // return $this->getRedux();
      $this->getJustData();

    }
    public function getRedux(){
      $result=DB::table('roles_auth_menu1')->get();
      return $result;
    }
    public function insert(){
    	// 数据库插入
       $inBoo=DB::table("test_user")->insert([
    	 		['name'=>"test0","age"=>18,'sex'=>"男"],
    	 		['name'=>"test2","age"=>19,'sex'=>"男"],
    	 		['name'=>"test1","age"=>rand(1,100),'sex'=>"女"]
    	 	]);
       // echo $inBoo;

    }
    public function select(){
    		// $data=DB::table("test_user")->join('test_user_join','test_user.id','=','test_user_join.join_id')->select('test_user.*','test_user_join.join_id','test_user_join.is_handsome')->get();
      //    // $str=is_array($data);
      //     $arr=json_decode($data,true);
      //     $str=$arr[1];
      // 		echo json_encode($str);
      $data=DB::table("test_user")->get();
      echo $data;
    }
    public function delete(){
    		$deBoo=DB::table("test_user")->delete();
    		// echo $deBoo;
    }
    public function update(){
    		DB::table("test_user")->where("age","18")->update(['name'=>"hello world"]);
    }
    public function getJustData(){
      date_default_timezone_set('PRC');
      echo date('Y-m-d H:i:s',time());
    }
}

?>