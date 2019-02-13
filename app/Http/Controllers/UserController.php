<?php 
//吴同岳，2019-1-17，联系微信wty1079051908;
namespace App\Http\Controllers;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Db;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
class UserController extends Controller{
	public function init(){
		 date_default_timezone_set('PRC');
	}
 	public function getUnReads(){
 		$userId=Auth::user()['id'];
 		$msgCounts=DB::table('organization_institution')->where(['id'=>request('insid'),'user_id'=>$userId])->get(["msgCounts"]);
 		if(json_decode($msgCounts,true)!=null){
 			return json_decode($msgCounts,true)[0];
 		}else{
 			return response()->json(['msgCounts'=>'']);
 		}
 		
 	}

}



 ?>
