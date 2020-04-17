<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>首页</title>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link	href="${pageContext.request.contextPath}/css/bootstrap.min.css"	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link	href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/login.js"></script>
</head>
<body>
<div id="bj" class="jumbotron">
<fieldset>
	<legend><h2 class="text-info" style="font-family:宋体;font-weight:bold;font-size:49px">欢迎使用个人图书管理系统</h2></legend>

<form action="${pageContext.request.contextPath }/u_login" method="post">
<div class="bo">

	<div class="input-group">
  		<span class="input-group-addon" id="basic-name">用户名</span>
  		<input type="text" name="username" class="form-control" placeholder="用户名" aria-describedby="basic-name">
    </div>
	<div class="input-group">
  		<span class="input-group-addon" id="basic-pass">密&nbsp;&nbsp;&nbsp;码:</span>
  		<input type="password" name="password" class="form-control" placeholder="密码" aria-describedby="basic-pass">
   </div>
</div><br><label>${msg }</label><br>
	<input type="submit" class="btn btn-success" value="登录">
	<input type="button" class="btn btn-primary" onclick="regist()" value="注册">
</form>
</fieldset>
</div>
</body>
</html>