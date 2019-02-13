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
class RolesController extends Controller{
	public function init(){
		 date_default_timezone_set('PRC');
	}
	public function initID(){
		$this->ins_id=request('insid');
 		$this->user_id=Auth::user()['id'];
 	 	
	}
	public function getRoles(){
		$this->initID();
		$result=DB::table('roles')
		->where(['user_id'=>$this->user_id])
		->get();
		if(!$result->isEmpty()){
			return response()->json(['roles'=>$result]);
		}else{
			return response()->json(['status'=>503,'msg'=>'数据获取失败']);
		};

	}
	// 获取用户角色
	public function getRoleUsers(){
		$this->initID();
		$result=DB::table('roles_users')
		->where(['user_id'=>$this->user_id,'ins_id'=>$this->ins_id])
		->get();
		if(!$result->isEmpty()){
			return response()->json(['users'=>$result]);
		}else{
			return response()->json(['status'=>200,'msg'=>'']);
		};
	}
	// 获取权限列表
	public function authListForId(){
		$this->initID();
		$role_id=$this->getRoleId('roleId.json');
		$table='roles_auth_menu'.$role_id;
		$result=DB::table($table)->where(['user_id'=>$this->user_id,'ins_id'=>$this->ins_id])->get(['id','name','checked']);
		// 对数据库中是否存在相关数据进行判断吗，有则查，无则添加
		if(!$result->isEmpty()){
			return $this->getRoleAuth($table,$result);
		}else{
			$result=json_decode(DB::table($table)->where(['default'=>1])->get(['user_id','ins_id','name']),true);
			foreach ($result as $key => $value) {
				 $result[$key]['user_id']=$this->user_id;
				 $result[$key]['ins_id']=$this->ins_id;
			}
			$insertR=DB::table($table)->insert($result);
			if($insertR){
				$result=DB::table($table)->where(['user_id'=>$this->user_id,'ins_id'=>$this->ins_id])->get(['id','name','checked']);
				return $this->getRoleAuth($table,$result);
			}else{
				return response()->json(['msg'=>'设置权限失败','status'=>503]);
			}
			

		}
		
	}
	protected function getRoleAuth($table,$result){
		$toNoseData1=null;
		$toNoseData2=null;
		$toNoseData3=null;
		$toNoseData4=null;
		$toNoseData5=null;

		$result=json_decode($result,true);
			foreach ($result as $key => $value) {
				 $result[$key]['id']=$key+1;
				  $result[$key]['checked']=$value['checked']==1?true:false;
			}
			// 项目模块
			$toNoseData1=array_slice($result,0,1);
			$toNoseData1[0]['childrens']=array_slice($result,1,6);
			// 投资人模块
			$toNoseData2=array_slice($result,7,1);
			$toNoseData2[0]['childrens']=array_slice($result,8,5);
			// 基金模块
			$toNoseData3=array_slice($result,13,1);
			$toNoseData3[0]['childrens']=array_slice($result,14,6);
			// 文件模块
			$toNoseData4=array_slice($result,20,1);
			$toNoseData4[0]['childrens']=array_slice($result,21,7);
			// 角色列表
			$toNoseData5=array_slice($result,28,1);
			$toNoseData5[0]['childrens']=array_slice($result,29,6);
			$toNoseData=array_merge($toNoseData1,$toNoseData2,$toNoseData3,$toNoseData4,$toNoseData5);

			return response()->json(['menus'=>$toNoseData,'status'=>200]);
	}
	public function getRoleId($roleIdSrc){
		if(!file_exists($roleIdSrc)){
			fopen($roleIdSrc,'w');
		}
		$fgc=file_get_contents($roleIdSrc);
		$role_id=$fgc?json_decode($fgc,true)['roleid']:1;
		return $role_id;

	}
	public function setRoleId($roleSrc,$roleid){
		file_put_contents($roleSrc,json_encode(array($roleid=>request($roleid))));

	}
	public function updatePermissions(){
		$this->initID();
		// $this->setRoleId('roleId.json','roleid');
		$role_id=request('roleid');
		$table='roles_auth_menu'.$role_id;
		$permissions=request('permissions');
		$number_id=array_keys($permissions)[0]-1;
		$needChangeValue=array_values($permissions)[0]==true?1:0;
		
		$result=json_decode(DB::table($table)
		->where(['user_id'=>$this->user_id,'ins_id'=>$this->ins_id])
		->get(),true);
		// 获取要改变的字段所在行真实id
		$realId=$result[$number_id]['id'];
		// 做点击整体模块开与关
		switch($number_id+1){
			case 1:
				$minId=$realId;
				$maxId=$realId+6;
				$resultU=$this->specialUpdate($table,$needChangeValue,$maxId,$minId);
				break;
			case 8:
				$minId=$realId;
				$maxId=$realId+5;
				$resultU=$this->specialUpdate($table,$needChangeValue,$maxId,$minId);
			break;
			case 14:
				$minId=$realId;
				$maxId=$realId+6;
				$resultU=$this->specialUpdate($table,$needChangeValue,$maxId,$minId);
			break;
			case 21:
				$minId=$realId;
				$maxId=$realId+7;
				$resultU=$this->specialUpdate($table,$needChangeValue,$maxId,$minId);
			break;
			case 29:
				$minId=$realId;
				$maxId=$realId+6;
				$resultU=$this->specialUpdate($table,$needChangeValue,$maxId,$minId);
			break;
			default: 
			$resultU=$this->justUpdate($table,$realId,$needChangeValue);
			break;
		}

		// $resultU=DB::table($table)->where(['user_id'=>$this->user_id,'ins_id'=>$this->ins_id,'id'=>$realId])->update(['checked'=>$needChangeValue]);

		if($resultU){
			return response()->json(['status'=>200,'msg'=>'更新成功']);
		}else{
			return response()->json(['status'=>503,'msg'=>'更新失败']);
		}

	}
	public function specialUpdate($table,$needChangeValue,$maxId,$minId){
		$resultU=DB::table($table)->where([
			['user_id',$this->user_id],
			['ins_id',$this->ins_id],
			['id','>=',$minId],
			['id','<=',$maxId]

			])->update(['checked'=>$needChangeValue]);
		return $resultU;
	}
	public function justUpdate($table,$realId,$needChangeValue){
		$resultU=DB::table($table)->where(['user_id'=>$this->user_id,'ins_id'=>$this->ins_id,'id'=>$realId])->update(['checked'=>$needChangeValue]);
		return $resultU;
	}

}



 ?>
