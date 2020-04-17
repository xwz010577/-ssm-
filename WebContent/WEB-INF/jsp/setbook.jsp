<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<link	href="${pageContext.request.contextPath}/css/bootstrap.min.css"	rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<link	href="${pageContext.request.contextPath}/css/userbrowse.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/js/apply.js"></script>
<title>借书</title>
</head>
<body>
<div id="bj" class="jumbotron">
<h2 class="text-info" style="font-family:宋体;font-weight:bold;font-size:49px">图书信息</h2>
<div id="myTabContent" class="tab-content">
   	 <div class="box">
   		<table class="table table-hover">
  			<thead>
     			<th>图书名称</th>
				<th>图书作者</th>
				<th>图书出版社</th>
				<th>价格</th>
				<th>库存</th>
				<th>操作</th>
  			</thead>
  			<tbody>
  				<c:forEach items="${books }" var="book">
  				<tr>
    				<td>${book.book_name }</td>
					<td>${book.book_author }</td>
					<td>${book.book_publish }</td>
					<td>${book.book_price }</td>
					<td>${book.book_count }</td>
					<td><button type="button" id="btn-save2" data-id="${book.book_id}"
							 class="btn btn-inverse btn-save" data-toggle="modal" 
							 data-target="#myModal">借阅</button></td>
				 </tr>
				 </c:forEach>
 			 </tbody>
		</table>
		<a href="/Bank/alluser" class="btn btn-primary">退出图书馆</a>
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
					<input id="bookid" type="text" class="form-control" disabled="disabled">
				</div>
				<div class="modal-body">
					<p>数量</p>
					<input type="text" class="form-control" id="user-count">
				</div>
				<div class="modal-footer">
					<button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
					<button class="btn btn-primary" type="button" onclick="WithDraw()">借阅</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>