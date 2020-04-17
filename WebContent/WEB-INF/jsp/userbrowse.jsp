<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户信息浏览</title>
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link	href="${pageContext.request.contextPath}/css/bootstrap.min.css"	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link	href="${pageContext.request.contextPath}/css/userbrowse.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/userbrowse.js"></script>
</head>
<body>

<div id="bj" class="jumbotron">
<h2 class="text-info" style="font-family:宋体;font-weight:bold;font-size:49px">个人信息</h2>
<ul id="myTab" class="nav nav-tabs">
   <li class="active">
      <a href="#users" data-toggle="tab">
         	个人信息
      </a>
   </li>
   <li>
   		<a href="#bank" data-toggle="tab">
   			借书信息
   		</a>
   	</li>
</ul>
<div id="myTabContent" class="tab-content">
   <div class="tab-pane fade in active" id="users">
   	 <div class="box">
   		<table class="table table-hover">
  			<thead>
     			<th>用户名称</th>
				<th>单位</th>
				<th>职位</th>
				<th>出生日期</th>
				<th>性别</th>
				<th>联系方式</th>
				<th>修改个人信息</th>
				<th>修改密码</th>
  			</thead>
  			<tbody>
  				<tr>
    				<td>${user.username }</td>
					<td>${user.userposition }</td>
					<td>${user.userjob }</td>
					<td><fmt:formatDate type="date" value="${user.userbir }" dateStyle="default"/></td>
					<td>${user.usersex }</td>
					<td>${user.userphone }</td>
					<td><input type="button" class="btn btn-link" onclick="update_user()" value="修改个人信息"></td>
					<td><input type="button" class="btn btn-link" data-toggle="modal" 
							 data-target="#myModal0" value="修改密码"></td>
				 </tr>
 			 </tbody>
		</table>
		<input type="button" class="btn btn-primary" onclick="back()" value="退出登录">
     </div>
		
   </div>
   <div class="tab-pane fade" id="bank">
      <div class="box">

 			<div class="input-group" id="serch">
      			<input type="text" class="form-control" id="banktype" placeholder="请输入图书名称....">
      			<span class="input-group-btn">
       			 <button class="btn btn-default" onclick="serch()" type="button">搜索</button>
      			</span>
    		</div>
    		<input type="button" class="btn btn-link  kh" onclick="kh()" value="图书馆">
	<table class="table table-hover ">
		<thead>
			<th>图书名称</th>
			<th>所借数量</th>
			<th>选择归还数量</th>
			<th>全部归还</th>
		</thead>
			<tbody>
				<c:forEach items="${user.user_check }" var="check">
				<tr>
					<td>${check.banktype }</td>
					<td>${check.count }</td>
							
					<td><button type="button" id="btn-save2" data-id="${check.bank_id}"
							 class="btn btn-inverse btn-save" data-toggle="modal" 
							 data-target="#myModal">归还</button></td>
					<td><button type="button" id="btn-save3" data-id="${check.bank_id}"
							 class="btn btn-inverse" onclick="delUser(${check.bank_id})">全部归还</button></td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	  </div> 
   </div>
</div>
</div>
<div class="modal fade" id="myModal0" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button data-dismiss="modal" class="close" type="button">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">修改密码</h4>
				</div>
				<div class="modal-body">
					<p>旧密码</p>
					<input type="password" class="form-control" id="oldPwd">
				</div>
				<div class="modal-body">
					<p>新密码</p>
					<input type="password" class="form-control" id="newPwd">
				</div>
				<div class="modal-footer">
					<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
					<button class="btn btn-primary" type="button"onclick="changePwd()">修改</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button data-dismiss="modal" class="close" type="button">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">选择归还数量</h4>
				</div>
				<div class="modal-body">
					<p>书籍ID</p>
					<input id="user-id" type="text" class="form-control" disabled="disabled">
				</div>
				<div class="modal-body">
					<p>数量</p>
					<input type="text" class="form-control" id="user-count">
				</div>
				<div class="modal-footer">
					<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
					<button class="btn btn-primary" type="button" onclick="Deposit()">归还</button>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal1" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button data-dismiss="modal" class="close" type="button">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">取钱</h4>
				</div>
				<div class="modal-body">
					<p>ID</p>
					<input id="user-id1" type="text" class="form-control" disabled="disabled">
				</div>
				<div class="modal-body">
					<p>金额</p>
					<input type="text" class="form-control" id="user-money1">
				</div>
				<div class="modal-footer">
					<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
					<button class="btn btn-primary" type="button"onclick="WithDrawMoney()">取钱</button>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="myModal2" data-backdrop="static"
		tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button data-dismiss="modal" class="close" type="button">
						<span aria-hidden="true">×</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">转账</h4>
				</div>
				<div class="modal-body">
					<p>银行卡号</p>
					<input id="user-id2" type="text" class="form-control"  disabled="disabled">
				</div>
				<div class="modal-body">
					<p>转到银行卡号</p>
					<input id="user-id3" type="text" class="form-control" >
				</div>
				<div class="modal-body">
					<p>金额</p>
					<input type="text" class="form-control" id="user-money2">
				</div>
				<div class="modal-footer">
					<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
					<button class="btn btn-primary" type="button"onclick="TransMoney()">转账</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>