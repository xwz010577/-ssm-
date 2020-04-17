/**
 * 
 */
function lo(){
		window.location.href="/Bank/";
		
	}
	function checkuser(){
		var name=$("#name").val();
		var pwd=$("#password").val();
		var bir=$("#bir").val();
		if(name==""||pwd==""||bir==""){
			alert("请输入必要参数 名字、密码、出生日期");
			return false;
		}
		return true;
	}