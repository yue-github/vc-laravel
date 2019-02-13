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
class FilesController extends Controller{
	public function init(){
		 date_default_timezone_set('PRC');
	}
	public function initID(){
		$this->ins_id=request('insid');
 		$this->user_id=Auth::user()['id'];
 	 	
	}
	public function fileList(){
		$this->initID();
		$file_id=request('fileid');
		// if($this->file_id==0){
			$fileList=json_decode(DB::table('filelist')
			->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])
			->get(),true);

			$files=json_decode(DB::table('fileslist_files')
			->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id,'parent_id'=>$file_id])
			->get(),true);
			$fileList[0]['files']=$files;
			return response()->json($fileList[0]);
		// }else{
			// $fileList=json_decode(DB::table('filelist')
			// ->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])
			// ->get(),true);
			// $fileslist_files=json_decode(DB::table('fileslist_files')
			// ->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id,'id'=>$this->file_id])
			// ->get(),true);
			// $files=json_decode(DB::table('fileslist_files_children')
			// ->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id,'id'=>$this->file_id])
			// ->get(),true);
			//  foreach ($files as $key => $value) {
			//  	$fileslist_files[]=$value; 
			//  }
			//  $fileList[0]['files']=$fileslist_files;
			// return response()->json($fileList[0]);
			// $fileList=json_decode(DB::table('filelist')
		// 	->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id])
		// 	->get(),true);
		// 	$files=json_decode(DB::table('fileslist_files')
		// 	->where(['ins_id'=>$this->ins_id,'user_id'=>$this->user_id,$this->file_id])
		// 	->get(),true);
		// 	$fileList[0]['files']=$files;
		// 	return response()->json($fileList[0]);

		// }
		

	}
	public function delectFile(){
		$id=request('id');
		$this->initID();
		$result=DB::table('fileslist_files')->where(['user_id'=>$this->user_id,'ins_id'=>$this->ins_id,'id'=>$id])->delete();
		if($result){
			return response()->json(['status'=>200,'msg'=>'删除成功']);
		}else{
			return response()->json(['status'=>503,'msg'=>'删除失败']);
		}
		
	}
 	public function ceateFile(){
 		$this->initID();
 		$this->init();
 		$result=DB::table('fileslist_files')
 		->insert(['user_id'=>$this->user_id,'ins_id'=>$this->ins_id,'is_floder'=>1,'type'=>'文件夹','is_system'=>0,'fileurl'=>'Institution37/项目文件夹','filename'=>request('filename'),'parent_id'=>request('parentid'),'created_at'=>date('Y-m-d H:i:s',time())]);
 		 if($result){
 		 	return response()->json(['status'=>200,'msg'=>'创建成功']);
 		 }else{
 		 	return response()->json(['status'=>503,'msg'=>'创建失败']);
 		 }
 	}
 	public function updateFile(){
 		$this->initID();
 		$result=DB::table('fileslist_files')->where(['user_id'=>$this->user_id,'ins_id'=>$this->ins_id,'id'=>request('id')])->update(['filename'=>request('filename')]);
 		if($result){
 			return response()->json(['status'=>200,'msg'=>'更新成功']);
 		}else{
 			return response()->json(['status'=>503,'msg'=>'更新失败']);
 		}
 	}
 	// 上传图片
 	public function uploadFile(){
 		$this->initID();
 		 $file_str='file/'.ceil(microtime(true)).mt_rand().'.'.explode('.',$_FILES['file']['name'])[1];

 		 copy($_FILES['file']['tmp_name'],$file_str);
 		 $result=DB::table('fileslist_files')->insert(['ins_id'=>$this->ins_id,'user_id'=>1234,'is_floder'=>0,'type'=>'文件','is_system'=>0,'fileurl'=>$file_str,'filename'=>'file','parent_id'=>request('parentid')]);

 		if($result){
 			return response()->json(['status'=>200,'msg'=>'上传成功']);
	 	}else{
	 		return response()->json(['status'=>503,'msg'=>'文件上传失败']);
	 	}
 	}

}



 ?>
