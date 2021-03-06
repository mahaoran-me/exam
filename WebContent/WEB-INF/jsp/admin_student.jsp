<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String basePath = request.getContextPath() + "/";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style.css">
<title>上机考试管理系统</title>
<script>
	window.onload = function() {
		document.getElementById("batch").onclick = function() {
			var isdisplay = document.getElementById("hidden").style.display;
			if (isdisplay == "block") {
				document.getElementById("hidden").style.display = "none";
			} else {
				document.getElementById("hidden").style.display = "block";
			}
		};
	};
</script>
</head>
<body>
	<%@ include file="admin_header.jsp"%>
	<div class="container">
		<h3 class="mt-5">学生管理</h3>
		<div class="card bg-light mt-5">
			<div class="card-body">
				<form method="post" action="addStudent">
					<div class="row">
						<div class="col-md-2 col-sm-4 col-6 input-group">
							<input type="text" class="form-control" placeholder="学号"
								name="sid">
						</div>
						<div class="col-md-2 col-sm-4 col-6 input-group">
							<input type="text" class="form-control" placeholder="姓名"
								name="sname">
						</div>
						<div class="col-md-2 col-sm-4 col-6 input-group">
							<input type="text" class="form-control" placeholder="密码"
								name="spwd">
						</div>

						<div class="col-md-2 col-sm-4 col-6 input-group">
							<div class="errorTip">${requestScope.errorCode}</div>
						</div>
						<div class="col-md-2 col-sm-4 col-6 input-group">
							<input type="submit"
								class="btn bg-success text-white form-control" value="添加">
						</div>
						<div class="col-md-2 col-sm-4 col-6 input-group">
							<input type="button" id="batch"
								class="btn bg-success text-white form-control" value="批量添加  ∨">
						</div>
					</div>
				</form>
				<div class="row mt-3 flex-row-reverse m-0" id="hidden"
					style="display: none;">
					<c:if test="${not empty requestScope.errorCode2}">
					<script>
						document.getElementById("hidden").style.display = "block";
					</script>
					</c:if>
					<form action="upLoadSExcel" enctype="multipart/form-data"
						method="post" class="float-right d-block">
						<input type="file" style="position: relative; top: 2px;"name="file"> 
						<input type="submit" 
							class="d-inline-block btn btn-sm bg-success text-white float-right"
							value="提交">
					</form>
					<div class="col-md-2 col-sm-4 col-6 float-right input-group">
						<div class="errorTip">${requestScope.errorCode2}</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card bg-light mt-5">
			<div class="card-body">
				<form>
					<div class="row">
						<div class="input-group col-md-2 col-sm-4 col-6">
							<input type="text" class="form-control" placeholder="学号">
						</div>
						<div class="input-group col-md-2 col-sm-4 col-6">
							<input type="text" class="form-control" placeholder="姓名">
						</div>
						<div class="input-group col-md-2 col-sm-4 col-6"></div>
						<div class="input-group col-md-2 col-sm-4 col-6"></div>
						<div class="input-group col-md-2 col-sm-4 col-6">
							<input type="submit"
								class="btn bg-success text-white form-control" value="查询">
						</div>
					</div>
				</form>

				<table class="table table-hover mt-3">
					<thead>
						<tr>
							<th class="w-25">学号</th>
							<th class="w-25">姓名</th>
							<th class="w-25"></th>
							<th class="w-25">操作类型</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.pageInfo.list}" var="student">
							<tr>
								<td>${student.sid}</td>
								<td>${student.sname}</td>
								<td></td>
								<td><a href="editStudent?sid=${student.sid}">编辑</a> | <a
									href="deleteStudent?sid=${student.sid}">删除</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<ul class="pagination">
					<li
						class="page-item <c:if test='${requestScope.pageInfo.pageNumber <= 1}'>disabled</c:if>"><a
						class="page-link"
						href="sManager?pageNumber=${requestScope.pageInfo.pageNumber - 1}">上一页</a></li>
					<li class="page-item"><a class="page-link" href="#">${requestScope.pageInfo.pageNumber}
							/ ${requestScope.pageInfo.pageTotal}</a></li>
					<li
						class="page-item <c:if test='${requestScope.pageInfo.pageNumber >= requestScope.pageInfo.pageTotal}'>disabled</c:if>"><a
						class="page-link"
						href="sManager?pageNumber=${requestScope.pageInfo.pageNumber + 1}">下一页</a></li>

				</ul>
			</div>
		</div>
	</div>
	<div class="container"></div>
	<script src="js/jquery-3.4.1.js"></script>
	<script src="js/bootstrap.bundle.js"></script>
</body>
</html>