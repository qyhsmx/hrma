<%--
  Created by IntelliJ IDEA.
  User: QinYong
  Date: 2019/3/5
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>sidebar</title>
</head>
<body>

<div class="col-sm-3 col-md-2 sidebar">

    <br />
    <br />
    <br />
    <a class="list-group-item active">用户管理</a> <a
        href="${ctx }/user/selectUser" class="list-group-item">用户查询</a> <a
        href="${ctx }/user/insertUser?flag=1" class="list-group-item">添加用户</a>
    <a href="" class="list-group-item active">部门管理</a> <a
        href="${ctx }/dept/selectDept" class="list-group-item">部门查询</a> <a
        href="${ctx }/dept/insertDept?flag=1" class="list-group-item">添加部门</a>
    <a href="#" class="list-group-item active">职位管理</a> <a
        href="${ctx }/job/selectJob" class="list-group-item">职位查询</a>
    <a href="${ctx }/job/insertJob?flag=1" class="list-group-item">添加职位</a>
    <a href="#" class="list-group-item active">员工管理</a> <a
        href="${ctx }/employee/selectEmployee" class="list-group-item">员工查询</a>
    <a href="${ctx }/employee/insertEmployee?flag=1"
       class="list-group-item">添加员工</a> <a href="#"
                                           class="list-group-item active">公告管理</a> <a
        href="${ctx }/notice/selectNotice" class="list-group-item">公告查询</a>
    <a href="${ctx }/notice/insertNotice?flag=1" class="list-group-item">添加公告</a>
    <a href="#" class="list-group-item active">下载中心</a> <a
        href="${ctx }/document/selectDocument" class="list-group-item">文件查询</a>
    <a href="${ctx }/document/insertDocument?flag=1"
       class="list-group-item">上传文件</a>
</div>

</body>
</html>
