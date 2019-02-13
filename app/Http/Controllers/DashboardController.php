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
class DashboardController extends Controller{
	public function init(){
		 date_default_timezone_set('PRC');
	}
	public function initID(){
		$this->ins_id=request('insid');
 		$this->user_id=Auth::user()['id'];
	}
 	public function getDataStatis(){
 		$this->ins_id=request('insid');
 		$this->user_id=Auth::user()['id'];
 		// 以下操作是在数据库中添加默认数据附上ins_id和user_id
 		$is_empty=DB::table('dashboard_projectcates_items')->where('ins_id',$this->ins_id)->get();
 		if($is_empty->isEmpty()){
 			// 返回一个数组，值有两，第一个为成功与否，第二个插入的字段数组
 			$arr_p_items=$this->copySQL('dashboard_projectcates_items');
 			$arr_f_items=$this->copySQL('dashboard_funds_items');
 			$arr_p=$this->copySQL('dashboard_projectcates');
 			$arr_f=$this->copySQL('dashboard_funds');
 			$arr_d=$this->copySQL('dashboard');
 			// 对数据进行整合返回给前端，首先更新数据表，（这边不做判断是否成功，存在一定缺陷）

 			DB::table('dashboard_projectcates')->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])->update(['items'=>json_encode($arr_p_items['listArr'])]);
 			DB::table('dashboard_funds')->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])->update(['items'=>json_encode($arr_f_items['listArr'])]);

 			DB::table('dashboard')->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])->update([
 					'funds'=>DB::table('dashboard_funds')->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])->get()
 				 ,
 					'projectcates'=>DB::table('dashboard_projectcates')->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])->get()
 			]);
			 
		    return $this->selectToNose();
 	    }else{
 	    	return $this->selectToNose();
 	    }

 	}
 	public function copySQL($tableName){
 		
 			// 表dashboard_projectcates_items操作
 			$p_items=json_decode(DB::table($tableName)->where('default',1)->get(),true);
 			foreach ($p_items as $key => $value) {
 				 $p_items[$key]['ins_id']=$this->ins_id;
 				 $p_items[$key]['user_id']=$this->user_id;
 				 $p_items[$key]['default']=0;

 			}
 			$boo_fir=DB::table($tableName)->insert($p_items);
 			return ['is_success'=>$boo_fir,'listArr'=>$p_items];
 	}
 	public function selectToNose(){
 			$arr_d=json_decode(DB::table('dashboard')->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])->get(),true);
		 	 
		 	for($i=0;$i<count($arr_d);$i++){
		 		foreach ($arr_d[$i] as $key => $value) {
		 			if($key=='funds'||$key=='projectcates'){
		 				$arr_d[$i][$key]=json_decode($value,true)[0];
		 				foreach ($arr_d[$i][$key] as $key_then => $value_then) {
		 					if($key_then=='items'){
		 						 $arr_d[$i][$key][$key_then]=json_decode($value_then,true);
		 					}
		 					
		 					 
		 				}
		 			}
		 			 
		 		}
 			
 		    }
 		    return json_encode($arr_d[0]);
 	}
 	public function getMyRelation(){
 		$this->initID();
 		$result_one=json_decode(DB::table('dashboard_relation')->get(),true);
 		$result_two=json_decode(DB::table('dashboard_relation_funds')->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])->get(),true);
 		$result_three=json_decode(DB::table('dashboard_relation_investors')->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])->get(),true);
 		$result_four=json_decode(DB::table('dashboard_relation_projexts')->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])->get(),true);

 			$result_one[0]['projexts']=$result_four;
 			$result_one[0]['investors']=$result_three;
 			$result_one[0]['funds']=$result_two;
 			echo json_encode($result_one[0]);
 			   
 		 


 	}
 	public function getWorkStatis(){
 		$this->initID();
 		$workStatisData=json_decode(DB::table('dashboard_workstatis')->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])->get(),true);
 		$workStatisRolesData=json_decode(DB::table('dashboard_workstatis_roles')->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])->get(),true);
 		$workStatisData[0]['roles']=$workStatisRolesData;
 		return response()->json($workStatisData[0]);

 	}
 	public function getSysLog(){
 		$this->init();
 		$this->initID();
 		$pageSize=request('pageSize');
 		$page=request('page');
 		$total=json_decode(DB::table('dashboard_syslog')->get(),true);
 		$result=json_decode(DB::table('dashboard_syslog')->where([
 			['id','>',$pageSize*0],
 			['ins_id','=',$this->ins_id],
 			['user_id','=',$this->user_id]
 		])
 		->limit($pageSize)
 		->get(),true);
 		return response()->json(['operationrecords'=>$result,'total'=>count($total)]);
 	}

}



 ?>
