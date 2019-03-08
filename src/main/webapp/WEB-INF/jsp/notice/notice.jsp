<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page isELIgnored="false"%>
<%
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
	<base href="${path}">
	<meta charset="utf-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<link rel="stylesheet" href="/editor.md-master/css/editormd.css">
	<%--<link rel="stylesheet" href="/bootstrap/css/bootstrap.css">--%>
	<link rel="stylesheet" href="/layui/css/layui.css">
	<script src="/myJs/jquery-3.3.1.js"></script>
	<%--<script src="/bootstrap/js/bootstrap.js"></script>--%>
	<script src="/editor.md-master/editormd.js"></script>
	<script src="/layui/layui.js"></script>

	<title>人事管理系统</title>
</head>
<body>
	<div class="layui-container">
		<div class="layui-row">
			<div class="layui-col-md-offset5">
				<h1>编写你的公告</h1>
			</div>
		</div >
		<div class="layui-row">
			<br>
			<br>
		</div >
		<div class="layui-row">
			<form class="layui-form" action="/notice/releaseNotice" method="post">
				<input type="hidden" name="u_id" value="${user.id}">
				<div class="layui-form-item">
					<div class="editormd" id="test-editormd">
						<textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc" id="content"></textarea>
						<!-- 第二个隐藏文本域，用来构造生成的HTML代码，方便表单POST提交，这里的name可以任意取，后台接受时以这个name键为准 -->
						<textarea class="editormd-html-textarea" name="editormd-html-textarea" id="htmlContent"></textarea>
					</div>
				</div>
				<div class="layui-form-item">
					<div class="layui-inline">
						<label class="layui-form-label">发布人</label>
						<div class="layui-input-inline">
							<input type="text" class="layui-input" name="submitPerson">
						</div>
					</div>

					<div class="layui-inline">
						<button class="layui-btn-danger" type="submit" id="submitBtn">提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(function() {
		editormd("test-editormd", {
			width   : "90%",
			height  : 640,
			syncScrolling : "single",
			//你的lib目录的路径，我这边用JSP做测试的
			tocm : true, // Using [TOCM]
			tex : true, // 开启科学公式TeX语言支持，默认关闭
			flowChart : true, // 开启流程图支持，默认关闭
			path    : "/editor.md-master/lib/",
			//这个配置在simple.html中并没有，但是为了能够提交表单，使用这个配置可以让构造出来的HTML代码直接在第二个隐藏的textarea域中，方便post提交表单。
			saveHTMLToTextarea : true
		});
		layui.use(['element','form','layer'],function () {
			var element = layui.element,
					form = layui.form,
			layer = layui.layer;

			$("#submitBtn").click(function () {
				layer.msg("提交成功，此公告有效期30天！");
			});
		});
	});
</script>
</html>