<?php 
namespace App\Http\Controllers;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Db;

	class VcTest extends Controller{
		function vc(){
			 $user=DB::table("vc_test")->get();
			return $user;
			// echo "hello";
		}
	}



 ?>