<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/static/layui/css/layui.css">
    <style>
        body{
            background:url(<%=basePath%>/static/images/loginbg.png) no-repeat fixed;
            background-size: 100% 100%;
        }
    </style>

    <title>欢迎来到首页</title>
</head>
<body>
<div  style="width:100%;height:200px;margin-top: 5%;">
    <label>
        <span style="font-size:150px;color:#393D49;margin: 0% 30%;">Welcome</span>
    </label>
</div>
<div  style="width:500px;height:220px;margin:0% 34% ;">
    <form class="layui-form layui-form-pane" action="<%=basePath%>/login/login" method="post">
        <div style="margin-left: 20%;margin-top: 5%;" class="layui-form-item">
            <label class="layui-form-label">用户名：</label>
            <div style="width:45%" class="layui-input-block">
                <input name="name" type="text" required lay-verify="required" placeholder="请输入你的用户名 " class="layui-input">${message}
            </div>
            <span style="color:red;fontsize:10px">${message}</span>
        </div>
        <div style="margin-left: 20%" class="layui-form-item">
            <label class="layui-form-label">密码：</label>
            <div style="width:45%" class="layui-input-block">
                <input name="pwd" type="password" required lay-verify="required" placeholder="请输入你的密码" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <a href="javascript:;" style="margin-left: 60%" >忘记密码?</a>
        </div>
        <div class="layui-form-item">
            <div style="margin-left:20%" class="layui-input-inline">
                <button type="submit" class="layui-btn layui-bg-black">登录</button>
            </div>
            <div class="layui-input-inline">
                <a href="javascript:;" type="button" >
                    <button type="button" class="layui-btn layui-bg-black" onclick="register()">注册</button>
                </a>
            </div>
        </div>
    </form>
</div>
</body>
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<script src="<%=basePath%>/static/js/jquery-3.4.1.js"></script>
<script>
    function register(){
        layer.open({
            type:2,
            title:'注册',
            content:['<%=basePath%>/login/showRegister','no'],
            area:['500px','300px']
        });
    }
</script>
</html>
