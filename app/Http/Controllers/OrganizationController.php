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
class OrganizationController extends Controller{
	
	// public $user_id;
	// public function __construct(){
	// 	$this->getUserId();
	// 	$this->initFun();
	// }
	// private function getUserId(){
	// 	$this->user_id=Auth::user();
	// }

	public function init(){
		 date_default_timezone_set('PRC');
	}
	// 获取MyIns数据操作
	public function getMyIns(){
		$user_id=Auth::user()["id"];
		$spacemenu=DB::table("spacemenu")->where('user_id',$user_id)->get(["id","name"]);
		// 更新表，便于统一查询输出
		DB::table('organization_institution')->where('user_id',$user_id)->update(['spacemenu'=>$spacemenu]);

		$myInss=json_decode(DB::table('organization_institution')->where('user_id',$user_id)->get(),true);
		for ($i=0;$i<count($myInss);$i++) {
			foreach ($myInss[$i] as $key => $value) {
				if($key=='spacemenu'){
					$myInss[$i][$key]=json_decode($value,true)[0];
				};
			};
			
		};
		$byInviteInss=DB::table('byInviteInss')->where('user_id',$user_id)->get();

		$arr=array('myInss'=>$myInss,'byInviteInss'=>$byInviteInss);
		return json_encode($arr);
	}
	
	// 添加ins操作
	public function addIns(Request $request){
		$user_id=Auth::user()["id"];
		$this->init();
		$nowTime=date('Y-m-d H:i:s',time());
		 // {"insname":"qwyeq","contactname":"wutongyue","contacttel":"18814131232","contactadress":"福建"}
		$insertDate=$request->all();
		$insertDate['user_id']=$user_id;
		$insertDate['created_at']=$insertDate['updated_at']=$nowTime;
		$insertDate['mealtype']=1;
		$is_success=DB::table('organization_institution')->where(['user_id'=>$user_id])->insert($insertDate);
		if($is_success){
			// 成功后对权限进行默认添加
		    $insertAuth=json_decode(DB::table('authority')->where('default',1)->get(),true);
		    $insertAuth[0]['user_id']=$user_id;
		    $maxId=DB::table('organization_institution')->max("id");
		    $insertAuth[0]['ins_id']=$maxId;
		    $insertAuth[0]['default']=0;

			$authorityBoo=DB::table('authority')->insert($insertAuth);
			if($authorityBoo){
				return response()->json(['status'=>200,'msg'=>'创建成功']);
			}else{
				return response()->json(['status'=>503,'msg'=>'创建失败']);
				// 添加不成功删除操作
				DB::table('organization_institution')->where('id',$maxId)->delete();
			};
			
		}else{
			return response()->json(['status'=>503,'msg'=>'创建失败']);
		}


	}
    // 更新ins操作
	public function updateIns(){
		echo "updateIns";
	}
	// 获取权限数据相关操作
	public function getAuthority(){
		$user_id=Auth::user()["id"];
		$authority=json_decode(DB::table('authority')->where(['ins_id'=>request('insid'),'user_id'=>$user_id])->get(),true);
		foreach ($authority as $key => $value) {
			 foreach ($authority[$key] as $key_f => $value_f) {
			 	 $authority[$key][$key_f]=$value_f==1?true:false;
			 }
		}
		return json_encode($authority[0]);
	}
	// projectAdd: true,
 //        projectDel: true,
 //        projectEdit: true,
 //        projectInfo: true,
 //        fundAdd: true,
 //        fundDel: true,
 //        fundEdit: true,
 //        fundInfo: true,
 //        investorAdd: true,
 //        investorDel: true,
 //        investorEdit: true,
 //        investorInfo: true,
 //        fileUpload: true,
 //        fileDown: true,
 //        fileDel: true,
 //        fileCreateDir: true,
 //        roleUpdate: true,
 //        roleAdd: true,
 //        roleDel: true,
 //        roleInvitation: true,
 //        roleDelUser: true,
 //        taskInfo: true,
 //        taskAdd: true,

}



 ?>