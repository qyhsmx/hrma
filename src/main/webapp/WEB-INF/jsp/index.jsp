<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
	<base href="${path}">
	<meta charset="utf-8">
	<title>人事管理系统</title>
	<link rel="stylesheet"
		href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	<script
		src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/layui/css/layui.css">
	<script src="/layui/layui.js"></script>
	<style>
		.body_class{
			background-image: url("/image/冰雪公主.jpg");
		}
	</style>
</head>
<body class="body_class">
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">人事管理系统</a>
			</div>

		</div>
	</nav>
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<div class="container">
		<div class="row clearfix">
			<div class="col-md-4 column"></div>
			<div class="col-md-4 column">
				<form class="form-horizontal" role="form" action="/user/login"
					method="post">
					<div class="form-group">
						<label for="loginname" class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="loginname"
								name="loginname" placeholder="请输入名字" />
						</div>
						<div style="color: red;">${msg}</div>
					</div>
					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">密码</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="password"
								name="password" placeholder="请输入密码" />
						</div>
						<div style="color: red;">${msg}</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label> <input type="checkbox">请记住我
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">登录</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-md-4 column"></div>
		</div>
	</div>
</body>
<script>
	layui.use(['layer'],function(){

	});
</script>
</html>