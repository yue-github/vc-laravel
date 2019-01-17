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
		
		// 回复的数据
		// {"myInss":[{"id":40,"insname":"小手机","contactname":"小手机","contacttel":"17633190977","contactadress":"小手机","mealtype":1,"userid":86,"created_at":"2018-10-06 15:40:20","updated_at":"2018-10-06 15:40:20","spacemenu":{"id":1,"name":"免费型"}},{"id":41,"insname":"测试机构","contactname":"联系人姓名","contacttel":"17633190977","contactadress":"测试地址","mealtype":1,"userid":86,"created_at":"2018-10-06 15:40:20","updated_at":"2018-10-06 15:40:20","spacemenu":{"id":1,"name":"免费型"}}],"byInviteInss":[]}

		// $myInss=json_decode(DB::table('organization_institution')->where('user_id',$user_id)->get(),true);
		// $spacemenu=json_decode(DB::table("spacemenu")->where('user_id',$user_id)->get(["id","name"]),true)[0];
		// $byInviteInss=DB::table('byInviteInss')->where('user_id',$user_id)->get();
		// $myInss["spacemenu"]=$spacemenu;
		// $insArr=array('myInss'=>array($myInss),'byInviteInss'=>[]);
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
	// 获取权限数据相关操作
    public function getAuthority(){
		echo "getAuthority";
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
			return response()->json(['status'=>200,'msg'=>'创建成功']);
		}else{
			return response()->json(['status'=>503,'msg'=>'创建失败']);
		}


	}
    // 更新ins操作
	public function updateIns(){

		echo "updateIns";
	}

}



 ?>