<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <base href="${path}">
	<meta charset="utf-8"> 
	<title>人事管理系统</title>
	<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">

	<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>

	<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <link rel="stylesheet"
          href="https://cdn.bootcss.com/bootstrap-table/1.13.4/bootstrap-table.css">
    <script
            src="https://cdn.bootcss.com/bootstrap-table/1.13.4/bootstrap-table.js"></script>
    <script
            src="https://cdn.bootcss.com/bootstrap-table/1.13.4/bootstrap-table-locale-all.min.js"></script>
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/layui/layui.js"></script>

    <style type="text/css">
        .ibody{
            background-image: url("/image/冰雪公主.jpg");
        }

        .carddiv{
            background-image: url("/image/壁纸3.jpg");
        }
    </style>
</head>
<body>

<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <ul class="layui-nav layui-bg-blue">
            <li class="layui-nav-item">
                <a href="/employee/toMain">控制台<span class="layui-badge">9</span></a>
            </li>
            <li class="layui-nav-item">
                <a href="">个人中心<span class="layui-badge-dot"></span></a>
            </li>
            <li class="layui-nav-item">
                <a href=""><img src="//t.cn/RCzsdCq" class="layui-nav-img">我</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">修改信息</a></dd>
                    <dd><a href="javascript:;">安全管理</a></dd>
                    <dd><a href="javascript:;">退了</a></dd>
                </dl>
            </li>
        </ul>
    </div>
    <div class="layui-side layui-bg-black">
        <ul class="layui-nav layui-nav-tree" lay-filter="test">
            <!-- 侧边导航: <ul class="layui-nav layui-nav-tree layui-nav-side"> -->
            <li class="layui-nav-item layui-nav-itemed">
                <a href="javascript:;">用户管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;">用户查询</a></dd>
                    <dd><a href="javascript:;">添加用户</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">部门管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="">部门查询</a></dd>
                    <dd><a href="">添加部门</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">员工管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="/employee/toEmpIndex">员工查询</a></dd>
                    <dd><a href="">待定</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">职位管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="">职位查询</a></dd>
                    <dd><a href="">添加职位</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a href="javascript:;">公告管理</a>
                <dl class="layui-nav-child">
                    <dd><a href="/notice/addNotice">添加公告</a></dd>
                </dl>
            </li>

        </ul>

    </div>
    <div class="layui-body ibody">

        <div class="layui-container">
            <div class="layui-row">
                <br>
                <br>
            </div>
            <div class="layui-row">
                <div  class="layui-col-md4">
                    <div class="layui-inline"><h2>欢迎来到人力资源管理系统</h2></div>
                </div>
            </div>
            <div class="layui-row">
                <br>
                <br>
            </div>
            <div class="layui-row">
                <div  class="layui-col-md4">
                    <div class="layui-card layui-bg-green">
                        <div class="layui-card-header">通知</div>
                        <div class="layui-card-body " id="noticeCard">

                        </div>
                    </div>
                </div>

                <div  class="layui-col-md4">
                    <div class="layui-card layui-bg-red">
                        <div class="layui-card-header">待办</div>
                        <div class="layui-card-body ">
                            卡片式面板面板通常用于非白色背景色的主体内<br>
                            从而映衬出边框投影
                        </div>
                    </div>
                </div>
                <div  class="layui-col-md4">
                    <div class="layui-card">
                        <div class="layui-card-header">未开发面板</div>
                        <div class="layui-card-body">
                            卡片式面板面板通常用于非白色背景色的主体内<br>
                            从而映衬出边框投影
                        </div>
                    </div>
                </div>

            </div>
            <div class="layui-row">
                <br>
                <br>
            </div>
        </div>

    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
    </div>
</div>



<%--开发环境配置--%>
<script src="/static/bootstrap-table-develop/src/bootstrap-table.js"></script>
<script src="/static/bootstrap-table-develop/src/locale/bootstrap-table-zh-CN.js"></script>
  </body>
<script type="text/javascript">

    $(function () {
        layui.use(['element'],function () {
            var element = layui.element;

        });
        $.ajax({
            url: '/notice/getNotice',
            type: 'post',
            data: 'json',
            dataType: 'json',
            success: function (data) {

               // console.log(data);
                //console.log(data.article);
                var con = $(data.article);
                var timePerson = $("<p>发布时间："+data.date+"  发布人："+data.submitPerson+"</p>");

                $("#noticeCard").append(con).append(timePerson);
            }
        })

    });


</script>
</html>