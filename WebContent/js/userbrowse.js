/**
 * 
 */
$(document).on("click",".btn-save",function(){
	 $("#user-id").val($(this).data("id"));
});
$(document).on("click",".btn-save",function(){
	 $("#user-id1").val($(this).data("id"));
});
$(document).on("click",".btn-save",function(){
	 $("#user-id2").val($(this).data("id"));
});
	function kh(id){
		
		window.location.href="/Bank/toBook";
	}
	function update_user(){
		
		window.location.href="/Bank/toUpdate";
	}
	function changePwd(){
		var oldPwd=$("#oldPwd").val();
		var newPwd=$("#newPwd").val();
		if(oldPwd.length!=0&&newPwd.length!=0){
			$.ajax({
				url:"/Bank/changePwd",
				type:"post",
				data:{
					oldPWd:oldPwd,
					newPwd:newPwd
				},
				success:function(data){
					if(data=="ok"){
						alert("修改密码成功！请重新登录！");
						window.location.href="/Bank/toLogin";
					}else if(data=="no"){
						alert("旧密码错误");
						window.location.reload();
					}else{
						alert("新旧密码不匹配！！！");
					}
				}
			});
		}else
			alert("请输入、、、");
		
	}
	
	function serch(){
		var banktype=$("#banktype").val();
		if(banktype.length!=0){
			$.ajax({
				url:"/Bank/serch",
				type:"post",
				data:{
					banktype:banktype
				},
				success:function(data){
					if(data=="ok"){
						window.location.href="/Bank/touserbro";
					}else if(data=="no"){
						alert("该账户无书籍！！！");
					}else
						alert("请输入已有银行！！！");
						
				}
			});
		}else{
			window.location.href="/Bank/alluser";
		}
		
	}
	function Deposit(){
		var id=$("#user-id").val();
		var count=$("#user-count").val();
		if(!isNaN(count)&& count.length!=0){
			$.ajax({
				url:"/Bank/Deposit",
				type:"post",
				
				data:{
					id:id,
					count:count
				},
				success:function(data){
					
					if(data=="ok"){
						alert("归还成功!");
						window.location.href="/Bank/alluser";
					}else{
						alert("归还失败!");
						window.location.href="/Bank/alluser";
					}
				}
			});
		}else{
			alert("请输入数量、、");
		}
			
		
		
	}
	
	
	
	function delUser(id){
		if(confirm("是否归还全部？")){
			$.ajax({
				url:"/Bank/del",
				type:"post",
				data:{
					bank_id:id
				},
				success:function(data){
					if(data=="ok"){
						alert("归还成功!");
						window.location.href="/Bank/alluser";
					}else{
						alert("归还失败!");
						window.location.href="/Bank/alluser";
					}
				}
			});
		}
	}
	function back(){
		window.location.href="/Bank/toLogin";
	}