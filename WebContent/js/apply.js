/**
 * 
 */
$(document).on("click",".btn-save",function(){
	 $("#bookid").val($(this).data("id"));
});
function WithDraw(){
	var id=$("#bookid").val();
	var count=$("#user-count").val();
	if(!isNaN(count)&& count.length!=0){
		$.ajax({
			url:"/Bank/WithDraw",
			type:"post",
			data:{
				id:id,
				count:count
			},
			success:function(data){
				if(data=="ok"){
					alert("借阅成功!");
					window.location.href="/Bank/alluser";
				}else if(data=="no"){
					alert("图书无法被借阅，请稍后...");
					window.location.href="/Bank/toBook";
				}
				else{
					alert("借阅失败!");
					window.location.href="/Bank/alluser";
				}
			}
		});
	}else
		alert("请输入数量、、、")
	
	
}