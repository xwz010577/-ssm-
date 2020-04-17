<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册用户</title>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link	href="${pageContext.request.contextPath}/css/bootstrap.min.css"	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link	href="${pageContext.request.contextPath}/css/updateUser.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/updateUser.js"></script>

</head>
<body>
<div id="bj" class="jumbotron">
<h2 class="text-info" style="font-family:宋体;font-weight:bold;font-size:49px">修改个人信息</h2>
<form action="/Bank/toUpdateUser" method="post">
<div class="bo">

	<div class="input-group">
  		<span class="input-group-addon" id="basic-name">名&nbsp;&nbsp;&nbsp;称</span>
  		<input type="text" name="username" value="${user.username }" class="form-control" placeholder="用户名" aria-describedby="basic-name">
    </div>
   <div class="input-group">
  		<span class="input-group-addon" id="basic-pos">单&nbsp;&nbsp;&nbsp;位:</span>
  		<input type="text" name="userposition" value="${user.userposition }" class="form-control" placeholder="单位" aria-describedby="basic-pos">
   </div>
   <div class="input-group">
  		<span class="input-group-addon" id="basic-job">职&nbsp;&nbsp;&nbsp;位:</span>
  		<input type="text" name="userjob" value="${user.userjob }" class="form-control" placeholder="职位" aria-describedby="basic-job">
   </div>
   <div class="input-group">
  		<span class="input-group-addon" id="basic-bir">出生日期:</span>
  		<input type="text" name="userbir" value="<fmt:formatDate type="date" value="${user.userbir }" dateStyle="default"/>"class="form-control" placeholder="出生日期" aria-describedby="basic-bir">
   </div>
   <div class="input-group">
  		<span class="input-group-addon" id="basic-sex">性&nbsp;&nbsp;&nbsp;别:</span>
  		<input type="text" name="usersex" value="${user.usersex } "class="form-control" placeholder="性别" aria-describedby="basic-sex">
   </div>
   <div class="input-group">
  		<span class="input-group-addon" id="basic-phone">联系方式:</span>
  		<input type="text" name="userphone" value="${user.userphone }" class="form-control" placeholder="性别" aria-describedby="basic-phone">
   </div>
  </div>
 		<input type="submit" class="btn btn-primary" onclick="update()" value="修改">
 		<input type="button" class="btn btn-primary" onclick="lo()" value="取消">

</form>
</div>


</body>
</html>