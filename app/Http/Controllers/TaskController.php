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
class TaskController extends Controller{
	public function init(){
		 date_default_timezone_set('PRC');
	}
	public function initID(){
		$this->ins_id=request('insid');
 		$this->user_id=Auth::user()['id'];
 	 	
	}
	public function createTask(){
		$this->initID();
		$this->init();
		$create=Auth::user()['name']?Auth::user()['name']:Auth::user()['mobile'];
		$result=DB::table('task')->insert(
		 	[
		 		'user_id'=>$this->user_id,
		 		'ins_id'=>$this->ins_id,
                'title'=> request('title'),
                'description'=> request('description'),
                'start'=>date('Y-m-d H:i:s',time()),
                'end'=> request('enddate'),
                'create'=> $create,
                'owner'=> '吴同岳',
                'percent'=> 89,
                'status'=> 'processing',
                'created_at'=>date('Y-m-d H:i:s',time()),
                'enddate'=>request('enddate'),
                'process'=>1,
               
		 	]
		 );
		if($result){
			$maxid=DB::table('task')->where(['user_id'=>$this->user_id,'ins_id'=>$this->ins_id])->max('id');

			$result1=json_decode(DB::table('task_comments')->where(['default'=>1])->get(),true)[0];
			unset($result1['id']);
			$result1['taskid']=$maxid;
			$result1['default']=0;
			DB::table('task_comments')->insert($result1);

			$result2=json_decode(DB::table('task_comments_user')->where(['default'=>1])->get(),true)[0];
			unset($result2['id']);
			$result2['taskid']=$maxid;
			$result2['default']=0;
			DB::table('task_comments_user')->insert($result2);

			$result3=json_decode(DB::table('task_distributions')->where(['default'=>1])->get(),true)[0];
			unset($result3['id']);
			$result3['taskid']=$maxid;
			$result3['default']=0;
			DB::table('task_distributions')->insert($result3);

			$result4=json_decode(DB::table('task_distributions_user')->where(['default'=>1])->get(),true)[0];
			unset($result4['id']);
			$result4['taskid']=$maxid;
			$result4['default']=0;
			DB::table('task_distributions_user')->insert($result4);

			$result5=json_decode(DB::table('task_followusers')->where(['default'=>1])->get(),true)[0];
			unset($result5['id']);
			$result5['taskid']=$maxid;
			$result5['default']=0;
			DB::table('task_followusers')->insert($result5);

			$result6=json_decode(DB::table('task_modules')->where(['default'=>1])->get(),true)[0];
			unset($result6['id']);
			$result6['taskid']=$maxid;
			$result6['default']=0;
			DB::table('task_modules')->insert($result6);
			return response()->json(['msg'=>'创建成功','status'=>200]);
		}else{
			return response()->json(['msg'=>'创建失败','status'=>503
		    ]);
		}
	}

	public function getTaskList(){
		$this->initID();
		$page=request('page');
		$size=request('pageSize');
		if(count(request('filter'))){
			 
			if(isset(request('filter')['status'])){
				$result=DB::table('task')
				->where([

					['status','=',request('filter')['status']],
					['user_id','=',$this->user_id],
					['ins_id','=',$this->ins_id],

				])
				->skip($size*($page-1))
				->take($size)
				->get();
			 
			}else if(isset(request('filter')['user'])){
				$result=DB::table('task')
				->where([

					[request('filter')['user'],'=',Auth::user()['name']?Auth::user()['name']:Auth::user()['mobile']],
					['user_id','=',$this->user_id],
					['ins_id','=',$this->ins_id],

				])
				->skip($size*($page-1))
				->take($size)
				->get();
			 
			}else if(isset(request('filter')['keyword'])){



				$filterData=json_decode(DB::table('task')
				->where([
					['user_id','=',$this->user_id],
					['ins_id','=',$this->ins_id]
				])
				->get(['title','id','description','owner','create']),true);
				$arrSort=array();
				foreach ($filterData as $key => $value) {
					if(stristr(implode('',$value),request('filter')['keyword'])){
						$arrSort[]=$value['id'];
					}
					 
				}
				 
				$result=DB::table('task')
				->whereIn('id', $arrSort)
				->skip($size*($page-1))
				->take($size)
				->get();
			}
		     
		}else{
			$result=DB::table('task')
			->where([
			 
				['user_id','=',$this->user_id],
				['ins_id','=',$this->ins_id],

			])
			->skip($size*($page-1))
			->take($size)
			->get();
		}


		
		$count=count(json_decode(DB::table('task')->get(),true));
		if($result){
			return response()->json(['status'=>200,'total'=>$count,'page'=>$page,'pageSize'=>$size,'task'=>$result]);
		}else{
			return response()->json(['status'=>503,'msg'=>'数据获取失败']);
		}
			 

	}
	public function taskinfo(){
		$this->initID();
 		$task=json_decode(DB::table('task')
 		->where([
 			'ins_id'=>$this->ins_id,
 			'user_id'=>$this->user_id,
 			'id'=>request('taskid')
 		])
 		->get(),true)[0];

 		$task_comments=json_decode(DB::table('task_comments')->where('taskid',request('taskid'))->get(),true);
 		$task_comments_user=json_decode(DB::table('task_comments_user')->where('taskid',request('taskid'))->get(),true);
 		$task_distributions=json_decode(DB::table('task_distributions')->where('taskid',request('taskid'))->get(),true);

 		$task_distributions_user=json_decode(DB::table('task_distributions_user')->where('taskid',request('taskid'))->get(),true);
 		$task_followusers=json_decode(DB::table('task_followusers')->where('taskid',request('taskid'))->get(),true);
 		$task_modules=DB::table('task_modules')->where('taskid',request('taskid'))->get();


 		if(!$task_modules->isEmpty()){
 			foreach ($task_distributions as $key => $value) {
 				 $task_distributions[$key]['user']=$task_distributions_user[$key];
 			}
 			$task['distributions']=$task_distributions;

 			foreach ($task_comments as $key => $value) {
 				 $task_comments[$key]['user']=$task_comments_user[$key];
 			}


 			return response()->json(['task'=>$task,'followusers'=>$task_followusers,'modules'=>json_decode($task_modules,true),'comments'=>$task_comments]);
 		}else{
 			return response()->json(['status'=>503,'msg'=>'数据获取失败']);
 		}

 		
	}
	public function deleteTask(){
		$this->initID();
		$result=DB::table('task')
		->where(['user_id'=>$this->user_id,'ins_id'=>$this->ins_id,'id'=>request('taskid')])
		->delete();
		if($result){
			DB::table('task_comments')
			->where(['taskid'=>request('taskid')])
			->delete();
			DB::table('task_comments_user')
			->where(['taskid'=>request('taskid')])
			->delete();
			DB::table('task_distributions')
			->where(['taskid'=>request('taskid')])
			->delete();
			DB::table('task_distributions_user')
			->where(['taskid'=>request('taskid')])
			->delete();
			DB::table('task_followusers')
			->where(['taskid'=>request('taskid')])
			->delete();
			$task_modules=DB::table('task_modules')
			->where(['taskid'=>request('taskid')])
			->delete();
			if($task_modules){
				return response()->json(['status'=>200,'msg'=>'删除成功']);
			}else{
				return response()->json(['status'=>503,'msg'=>'删除失败了亲']);
			}
		}
	}
	public function users(){
		$this->initID();
		$result=DB::table('task_users')
		->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])
		->get();
		if($result){
			return response()->json(['users'=>$result]);
		}else{
			return response()->json(['status'=>503,'msg'=>'数据获取失败']);
		}
		
	}

}



 ?>
