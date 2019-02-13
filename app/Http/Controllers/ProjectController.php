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
class ProjectController extends Controller{
	public function init(){
		 date_default_timezone_set('PRC');
	}
	public function initID(){
		$this->ins_id=request('insid');
 		$this->user_id=Auth::user()['id'];
 	 	
	}
	public function getInfo(){
		$this->initID();
		$id=request('projectid');
		 $projects=json_decode(DB::table('projects')
		 ->where(['user_id'=>$this->user_id,'id'=>$id])
		 ->get(),true)[0];

		 $project_levels=json_decode(json_decode(DB::table('project_levels')
		 ->where('projectid',$id)
		 ->get(),true)[0]['arr_levels'],true);

		 $project_conistypes=json_decode(DB::table('project_conistypes')
		 ->where('projectid',$id)
		 ->get(),true)[0];

		 $project_companytypes=json_decode(DB::table('project_companytypes')
		 ->where(['projectid'=>$id])
		 ->get(),true)[0];

		 // if($projects&&$project_levels&&$project_conistypes&&$project_companytypes){
		 	return response()->json(['projects'=>$projects,'levels'=>$project_levels,'conistypes'=>$project_conistypes,'companytypes'=>$project_companytypes]);
		 // }

	}
	public function add(){
		 $this->init();
		 $this->initID();
		 $dataNow=date('Y-m-d H:i:s',time());
		 $result=DB::table('projects')
		 ->insert(
		 	[
		 		'user_id'=>$this->user_id,
		 		'ins_id'=>$this->ins_id,
		 		'financing'=>request('financing'),
		 		'regionone'=>request('region')[0],
		 		'regiontwo'=>request('region')[1],
	            'icon'=> null,
	            'proname'=> request('name'),
	            'province'=> '广东省',
	            'area'=> '',
	            'industryid'=> request('industry'),
	            'state'=> request('state'),
	            'newrounds'=> '1',
	            'source'=> request('source'),
	            'valuation'=> '2',
	            'conistype'=> '1',
	            'intro'=> null,
	            'level'=> 3,
	            'link'=> null,
	            'remark'=> null,
	            'foundername'=> '岳',
	            'founderemail'=> '521287718@qq.com',
	            'founderetel'=> '17633190977',
	            'companyname'=> '测试公司',
	            'registenum'=> $dataNow,
	            'companytype'=> '1',
	            'begindate'=> $dataNow,
	            'enddate'=> $dataNow,
	            'registauthority'=> '北京工商总局',
	            'registdate'=> $dataNow,
	            'registcash'=> 1.23,
	            'adoptdate'=> $dataNow,
	            'companyadress'=> '测试地址',
	            'created_at'=> null,
	            'updated_at'=> null,
	            'manageteams'=> '',
	            'manageuser'=> null,
		 	]
		 );
		 if($result){
		 	$id=DB::table('projects')->where(['user_id'=>$this->user_id,'ins_id'=>$this->ins_id])->max('id');
		 	DB::table('project_levels')->insert(['projectid'=>$id,'arr_levels'=>'[1, 2, 3, 4, 5, 6]']);
		 	DB::table('project_conistypes')->insert(['projectid'=>$id,'1'=>'人民币','2'=>'美金']);
		 	DB::table('project_companytypes')->insert(['projectid'=>$id,'1'=>'(内资)有限公司','2'=>'(内资)股份公司','3'=>'(内资)个人独资企业','4'=>'(内资)有限合伙企业(内资)有限合伙企业','5'=>'(内资)普通合伙企业','6'=>'(外资)中外合资企业','7'=>'外商投资有限合伙','8'=>'外商投资普通合伙']);
		 	return response()->json(['projectid'=>$id,'status'=>200]);
		 }

	}

	public function getFilterParam(){
		$this->initID();
	 	$users=DB::table('project_filterparam_users')
	 	->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])
	 	->get();

	 	$projectcates=DB::table('project_filterparam_projectcates')
	 	->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])
	 	->get();

	 	if((!$projectcates->isEmpty())&&(!$users->isEmpty())){
	 		return response()->json(['users'=>$users,'projectcates'=>$projectcates]);
	 	}else{
	 		return response()->json(['msg'=>'数据获取失败','status'=>503]);
	 	}
	}

	public function getData(){

		$this->initID();
		$page=request('page')?request('page'):1;
		$size=request('pageSize')?request('pageSize'):20;
		if(count(request('filter'))){
			 
			if(!isset(request('filter')['keyword'])){
				$condition=request('filter');
				$condition['ins_id']=$this->ins_id;
				$condition['user_id']=$this->user_id;
				$result=DB::table('projects')
				->where($condition)
				->skip($size*($page-1))
				->take($size)
				->get();
			 
			 
			}else{
				$condition=request('filter');
				$condition['ins_id']=$this->ins_id;
				$condition['user_id']=$this->user_id;
				unset($condition['keyword']);

				$filterData=json_decode(DB::table('projects')
				->where($condition)
				->get(['proname','id','valuation','state']),true);
				$arrSort=array();
				foreach ($filterData as $key => $value) {
					if(stristr(implode('',$value),request('filter')['keyword'])){
						$arrSort[]=$value['id'];
					}
					 
				}
				 
				$result=DB::table('projects')
				->whereIn('id', $arrSort)
				->skip($size*($page-1))
				->take($size)
				->get(['id','proname','state','industryid','newrounds','level','valuation']);
			}
		     
		}else{
			$result=DB::table('projects')
			->where([
			 
				['user_id','=',$this->user_id],
				['ins_id','=',$this->ins_id],

			])
			// ->skip($size*($page-1))
			// ->take($size)
			->get();
		}


		
		$count=count(json_decode(DB::table('projects')->get(['id']),true));
		if($result){
			return response()->json(['status'=>200,'total'=>$count,'page'=>$page,'pageSize'=>$size,'projects'=>$result]);
		}else{
			return response()->json(['status'=>503,'msg'=>'数据获取失败']);
		}


	}


	public function getFile(){
		$this->initID();
		$result=DB::table('fileslist_files')
		->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id,'projectid'=>request('projectid')])
		->get(['id','created_at','filename']);
		return response()->json(['id'=>request('projectid'),'files'=>$result]);

	}
	// 获取相关任务
	public function tasks(){
		 $this->initID();
		 $result=json_decode(DB::table('task')
		 ->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id,'projectid'=>request('projectid')])
		 ->get(['id','title','enddate','createuser']),true);
		 foreach ($result as $key => $value) {
		 	$result[$key]['users']=array();
		 }
		 return response()->json(['tasks'=>$result]);
	}
	// 增加行业领域
	public function addProCates(){
		$this->initID();
		$result=DB::table('project_filterparam_projectcates')->insert(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id,'name'=>request('name')]);
		if($result){
			return response()->json(['status'=>200,'msg'=>'创建成功']);
		}else{
			return response()->json(['status'=>503,'msg'=>'创建失败']);
		}
		
	}
	// 更新行业领域
	public function updateProCates(){
		$this->initID();
		$result=DB::table('project_filterparam_projectcates')
		->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id,'id'=>request('id')])
		->update(['name'=>request('name')]);
		if($result){
			return response()->json(['status'=>200,'msg'=>'更新成功']);
		}else{
			return response()->json(['status'=>503,'msg'=>'更新失败']);
		}
		
	}
	 // 删除行业领域
	public function delProCates(){
		$this->initID();
		$result=DB::table('project_filterparam_projectcates')
		->where(['id'=>request('id'),'user_id'=>$this->user_id,'ins_id'=>$this->ins_id])
		->delete();
		if($result){
			return response()->json(['status'=>200,'msg'=>'删除成功']);
		}else{
			return response()->json(['status'=>503,'msg'=>'删除失败']);
		}
	}
	// 删除项目
	public function delete(){
		$this->initID();
		$projectid=request('projectid');

	    DB::table('project_levels')
	    ->where(['projectid'=>$projectid])
	    ->delete();
	    DB::table('project_conistypes')
	    ->where(['projectid'=>$projectid])
	    ->delete();
	    DB::table('project_companytypes')
	    ->where(['projectid'=>$projectid])
	    ->delete();
	    $result=DB::table('projects')
	    ->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id,'id'=>$projectid])
	    ->delete();
	    if($result){
	    	return response()->json(['status'=>200,'msg'=>'删除成功']);
	    }else{
	    	return response()->json(['status'=>503,'msg'=>'删除失败']);
	    }

	}

}



 ?>
