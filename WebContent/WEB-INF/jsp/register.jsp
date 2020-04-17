<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册用户</title>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link	href="${pageContext.request.contextPath}/css/bootstrap.min.css"	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link	href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/register.js"></script>

</head>
<body>
<div id="bj" class="jumbotron">
<h2 class="text-info" style="font-family:宋体;font-weight:bold;font-size:49px">注册个人信息</h2>
<form action="/Bank/toInsertUser" method="post" onsubmit="return checkuser()">
<div class="bo">

	<div class="input-group">
  		<span class="input-group-addon" id="basic-name">名&nbsp;&nbsp;&nbsp;称</span>
  		<input type="text" id="name" name="user.username" class="form-control" placeholder="用户名" aria-describedby="basic-name">
    </div>
    <div class="input-group">
  		<span class="input-group-addon" id="basic-pass">密&nbsp;&nbsp;&nbsp;码:</span>
  		<input type="password" id="password" name="password" class="form-control" placeholder="密码" aria-describedby="basic-pass">
   </div>
   <div class="input-group">
  		<span class="input-group-addon" id="basic-pos">单&nbsp;&nbsp;&nbsp;位:</span>
  		<input type="text" name="user.userposition" class="form-control" placeholder="单位" aria-describedby="basic-pos">
   </div>
   <div class="input-group">
  		<span class="input-group-addon" id="basic-job">职&nbsp;&nbsp;&nbsp;位:</span>
  		<input type="text" name="user.userjob" class="form-control" placeholder="职位" aria-describedby="basic-job">
   </div>
   <div class="input-group">
  		<span class="input-group-addon" id="basic-bir">出生日期:</span>
  		<input type="date" id="bir" name="user.userbir" class="form-control" placeholder="出生日期" aria-describedby="basic-bir">
   </div>
   <div class="input-group">
  		<span class="input-group-addon" id="basic-sex">性别:</span>
  		<input type="text" name="user.usersex" class="form-control" placeholder="性别" aria-describedby="basic-sex">
   </div>
   <div class="input-group">
  		<span class="input-group-addon" id="basic-phone">联系方式:</span>
  		<input type="text" id="phone" name="user.userphone" class="form-control" placeholder="联系方式" aria-describedby="basic-phone">
   </div>
  </div>
 		<input type="submit" class="btn btn-primary" value="注册">
 		<input type="button" class="btn btn-primary" onclick="lo()" value="取消">

</form>
</div>


</body>
</html>