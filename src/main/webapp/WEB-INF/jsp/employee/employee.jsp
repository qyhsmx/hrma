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
                    <dd><a href="">员工查询</a></dd>
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
                    <div class="layui-inline"><h2>员工管理</h2></div>
                </div>
            </div>
            <div class="layui-row">
                <br>
                <br>
            </div>
            <%--条件查询框--%>
            <div class="layui-row">
                <div class="layui-col-md10">
                <form class="layui-form">
                    <div class="layui-form-item layui-form-pane">
                        <div class="layui-inline">
                            <label class="layui-form-label width_90 f-12">性别</label>
                            <div class="layui-input-inline pos-r">
                                <select id="sex" name="sex" style="width:160px;">
                                    <option value="">请选择</option>
                                    <option value="1">男</option>
                                    <option value="0">女</option>
                                </select>
                            </div>
                        </div>
                        <div class="layui-inline">
                            <label class="layui-form-label width_90 f-12">地址</label>
                            <div class="layui-input-inline pos-r" style="position:relative;">
                                <input type="hidden" name="siteId" id="siteId" class="layui-input"
                                       value=""/>
                                <input type="text" autocomplete="off" name="siteName" id="siteName"
                                       class="layui-input" data-provide="typeahead" value=""/>
                            </div>
                        </div>

                    </div>
                </form>
                </div>
                <div class="layui-inline">
                    <button id="search" class="layui-btn">搜索</button>
                </div>

            </div>
            <div class="layui-row">
                <br>
                <br>
            </div>
            <%--员工表格--%>
            <div class="layui-row">
                <table id="employee_table">

                </table>
            </div>


        </div>

    </div>
    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <p>
            @ copyright
            qyhsmx.com
        </p>
    </div>
</div>



<%--开发环境配置--%>
<script src="/static/bootstrap-table-develop/src/bootstrap-table.js"></script>
<script src="/static/bootstrap-table-develop/src/locale/bootstrap-table-zh-CN.js"></script>
<%--<script src="/myJs/qyy.js"></script>--%>
<%--<script src="/bootstrap/bootstrap-typeahead.js"></script>--%>
<script src="/myJs/autocomplete.js"></script>
</body>
<script type="text/javascript">
    $(function () {
        /*搜索框
        * */
        $("#search").click(function () {
            $("#employee_table").bootstrapTable("removeAll");
            $("#employee_table").bootstrapTable("refresh",{url:'/employee/getAll'});
        });

        $("#employee_table").bootstrapTable({
            url : '/employee/getAll', // 请求后台的URL（*）
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
            columns:[
                {
                    field: 'name',
                    title: '姓名',
                    width : 200,
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'sex',
                    title: '性别',
                    width : 200,
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'phone',
                    title: '手机号码',
                    width : 200,
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'email',
                    title: '邮箱',
                    width : 200,
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'job.name',
                    title: '职位',
                    width : 200,
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'education',
                    title: '学历',
                    width : 200,
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'card_id',
                    title: '身份证号码',
                    width : 200,
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'dept.name',
                    title: '部门',
                    width : 200,
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'address',
                    title: '联系地址',
                    width : 200,
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'createDate',
                    title: '建档日期',
                    width : 200,
                    align: 'center',
                    valign: 'middle'
                },
                {
                    field: 'balance',
                    title: '操作',
                    width : 400,
                    align: 'center',
                    valign: 'middle',
                    formatter: function () {
                        return [
                            "<button type='button' class='btn btn-primary'>修改</button>",
                            "<button type='button' class='btn btn-danger'>删除</button>"
                        ]
                    }
                }

            ],
            queryParams: function (params) {//自定义参数，这里的参数是传给后台的，我这是是分页用的
                return {//这里的params是table提供的
                    offset: params.offset,//从数据库第几条记录开始
                    limit: params.limit,//找多少条
                    sex: $("#sex option:selected").val(),
                    address: $("#siteName").val()
                };
            },
            onLoadSuccess: function (data) {
                console.log(data);
            }
        });


        layui.use(['element','form'],function () {
            var element = layui.element,
                form = layui.form;


            $("#siteName").typeahead({
                source: function (query, process) {
                    $.post('/employee/getByad', {address: query}, function (data) {
                        console.log(data);
                        for(i in data) {
                            data[i] = data[i].address
                        }
                        process(data);
                    });
                },
                delay: 200,         //延迟时间0.2秒
                //选择项之后的事件，item是当前选中的选项
                afterSelect: function (item) {
                    //console.log(item);
                    $("#siteName").val(item);
                }
            });
        });
    });
</script>
</html>