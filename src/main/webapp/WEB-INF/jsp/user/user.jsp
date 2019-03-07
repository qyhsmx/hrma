<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page isELIgnored="false"%>
<%
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
<!DOCTYPE html>
<style>
.center {
	width: auto;
	display: table;
	margin-left: auto;
	margin-right: auto;
}
</style>
<html>
<head>
	<base href="${basePath}">
	<meta charset="utf-8">
	<title>人事管理系统</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="/static/bootstrap-table-develop/src/bootstrap-table.css">
	<script
		src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
	<script
		src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.bootcss.com/bootstrap-table/1.13.4/bootstrap-table.js"></script>
	<script
		src="https://cdn.bootcss.com/bootstrap-table/1.13.4/bootstrap-table-locale-all.min.js"></script>
	<script type="text/javascript">
			$(function(){
	
			   /** 获取上一次选中的部门数据 */
			   var boxs  = $("input[type='checkbox'][id^='box_']");
			   /** 删除员工绑定点击事件 */
			   $("#delete").click(function(){
				   /** 获取到用户选中的复选框  */
				   var checkedBoxs = boxs.filter(":checked");
				   if(checkedBoxs.length < 1){
					  alert("请选择一个需要删除的用户！");
				   }else{
					   /** 得到用户选中的所有的需要删除的ids */
					   var ids = checkedBoxs.map(function(){
						   return this.value;
					   })
							   window.location.href= "/user/deleteUser?ids=" + ids.get();
				   }
			   })
			})
		</script>
	
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">

				<a class="navbar-brand" href="#">人事管理系统</a>
			</div>

		</div>
	</nav>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-3 col-md-2 sidebar">

				<br />
				<br />
				<br /> 
				<a class="list-group-item active">用户管理</a> <a
					href="/user/selectUser" class="list-group-item">用户查询</a> <a
					href="/user/insertUser?flag=1" class="list-group-item">添加用户</a>
				<a href="" class="list-group-item active">部门管理</a> <a
					href="/dept/selectDept" class="list-group-item">部门查询</a> <a
					href="/dept/insertDept?flag=1" class="list-group-item">添加部门</a>
				<a href="#" class="list-group-item active">职位管理</a> <a
					href="/job/selectJob" class="list-group-item">职位查询</a> <a
					href="/job/insertJob?flag=1" class="list-group-item">添加职位</a>
				<a href="#" class="list-group-item active">员工管理</a> <a
					href="/employee/selectEmployee" class="list-group-item">员工查询</a>
				<a href="/employee/insertEmployee?flag=1"
					class="list-group-item">添加员工</a> <a href="#"
					class="list-group-item active">公告管理</a> <a
					href="/notice/selectNotice" class="list-group-item">公告查询</a>
				<a href="/notice/insertNotice?flag=1" class="list-group-item">添加公告</a>
				<a href="#" class="list-group-item active">下载中心</a> <a
					href="/document/selectDocument" class="list-group-item">文件查询</a>
				<a href="/document/insertDocument?flag=1"
					class="list-group-item">上传文件</a>
			</div>

			<h2 class="sub-header">Section title</h2>
			<div class="table-responsive">
				<form class="form-horizontal" role="form"
					action="/user/selectUser" method="post">
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">名字</label>
						<div class="col-xs-3">
							<input type="text" class="form-control" id="username"
								name="username" placeholder="请输入名字"
								value="${requestScope.user.username }">
						</div>
					</div>
					<div class="form-group">
						<label for="mark" class="col-sm-2 control-label">status</label>
						<div class="col-xs-3">
							<input type="text" class="form-control" id="mark" name="mark"
								placeholder="请输入状态码" value="${requestScope.user.mark }">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">查询</button>


							<button type="button" class="btn btn-default" id="delete">删除</button>
						</div>
					</div>
				</form>
				<table class="table table-striped" id="user_table">

					<thead>
						<tr>
							<th><input type="checkbox" id="checkAll" name="checkAll" /></th>
							<th>登录名</th>
							<th>密码</th>
							<th>用户名</th>
							<th>状态</th>
							<th>创建时间</th>
							<th>操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.users}" var="user"
							varStatus="stat">
							<tr id="data_${stat.index}" class="main_trbg"
								onMouseOver="move(this);" onMouseOut="out(this);">
								<td><input type="checkbox" id="box_${stat.index}"
									value="${user.id}"></td>
								<td>${user.loginname }</td>
								<td>${user.password }</td>
								<td>${user.username }</td>
								<td>${user.mark }</td>
								<td><fmt:formatDate value="${user.createDate}" type="date"
										dateStyle="long" /></td>
								<td><a href="${ctx}/user/updateUser?flag=1&id=${user.id}">修改
								</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div>
				<table class="center">
							<!-- 分页标签 -->
					<tr valign="top">
						<td align="center" class="font3">
							<fkjava:pager
								pageIndex="${requestScope.pageModel.pageIndex}"
								pageSize="${requestScope.pageModel.pageSize}"
								recordCount="${requestScope.pageModel.recordCount}" style="digg"
								submitUrl="${ctx}/user/selectUser?pageIndex={0}&username=
								${requestScope.user.username}&status=${requestScope.user.mark}"
							/>
						</td>
					</tr>

				</table>
			</div>

		</div>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
	<script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
	<script
		src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
	<script src="../../assets/js/vendor/holder.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

	<%--开发环境配置--%>
	<script src="${ctx}/static/bootstrap-table-develop/src/bootstrap-table.js"></script>
	<script src="${ctx}/static/bootstrap-table-develop/src/locale/bootstrap-table-zh-CN.js"></script>
</body>
<script type="text/javascript">
	$(function () {
		$("#user_table").bootstrapTable({
			url : '#####', // 请求后台的URL（*）
			method : 'post', // 请求方式（*）post/get
			contentType: "application/x-www-form-urlencoded",//post请求的话就加上这个句话
			striped : true, // 是否显示行间隔色
			cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
			pagination : true, // 是否显示分页（*）
			sortable : false, // 是否启用排序
			sortOrder : "asc", // 排序方式
			sidePagination : "server", // 分页方式：client客户端分页，server服务端分页（*）
			pageNumber : 1, // 初始化加载第一页，默认第一页
			pageSize : 5, // 每页的记录行数（*）
			pageList : [ 10, 25, 50, 100 ], // 可供选择的每页的行数（*）
			search : false, // 是否显示表格搜索，此搜索是客户端搜索，不会进服务端，所以，个人感觉意义不大
			strictSearch : true,
			queryParamsType:'limit', //默认值为 'limit' ,在默认情况下 传给服务端的参数为：offset,limit,sort
			// 设置为 ''  在这种情况下传给服务器的参数为：pageSize,pageNumber
			showColumns : false, // 是否显示所有的列
			showRefresh : false, // 是否显示刷新按钮
			minimumCountColumns :2, // 最少允许的列数
			clickToSelect : true, // 是否启用点击选中行
			height : "",// 行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
			uniqueId : "ID", // 每一行的唯一标识，一般为主键列
			showToggle : false, // 是否显示详细视图和列表视图的切换按钮
			cardView : false, // 是否显示详细视图
			detailView : false, // 是否显示父子表
			locale: "zh-CN", //中文支持
			queryParams: function (params) {//自定义参数，这里的参数是传给后台的，我这是是分页用的
				return {//这里的params是table提供的
					offset: params.offset,//从数据库第几条记录开始
					limit: params.limit//找多少条
				};
			},
			success: function (data) {

			}
		});
	});
</script>
</html>