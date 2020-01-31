<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/static/layui/css/layui.css">
    <link rel="icon" href="${pageContext.request.contextPath}/static/images/favicon.ico" mce_href="${pageContext.request.contextPath}/static/favicon.ico" type="image/x-icon" />
    <style>
        body {
            background: url(<%=basePath%>/static/images/loginbg.png) no-repeat fixed;
            background-size: 100% 100%;
        }
    </style>
    <title>欢迎来到首页</title>
</head>
<body>
<div style="width:70%;height:200px;margin-top: 5%;margin-left: auto;margin-right: auto;text-align: center">
    <span style="font-size:150px;color:#393D49;">Welcome</span>
</div>
<div style="width: 520px;height: 220px;margin: auto;">
    <form style="text-align: center" class="layui-form" action="<%=basePath%>/login/login" method="post">
        <div style="margin-left: 18%;margin-top: 5%;text-align: center" class="layui-form-item">
            <label class="layui-form-label"><i class="layui-icon layui-icon-user" style="font-size: 30px; color: #393D49;"></i></label>
            <div style="width:45%" class="layui-input-inline">
                <input name="name" type="text" required lay-verify="required" placeholder="请输入你的用户名"
                       class="layui-input" style="background: none;border:none;border-bottom: 1px solid #393D49;">
            </div>
            <span style="color:red;fontsize:10px" class="layui-input-inline">${message}</span>
        </div>
        <div style="margin-left: 18%" class="layui-form-item">
            <label class="layui-form-label"><i class="layui-icon layui-icon-password" style="font-size: 30px; color: #393D49;"></i></label>
            <div style="width:45%" class="layui-input-block">
                <input name="pwd" type="password" required lay-verify="required" placeholder="请输入你的密码"
                       class="layui-input" style="background: none;border:none;border-bottom: 1px solid #393D49;">
            </div>
        </div>
        <div class="layui-form-item">
            <a href="javascript:;" style="margin-left: 45%">忘记密码?</a>
        </div>
        <div class="layui-form-item" style="width:78%;margin: auto;padding-left: 12%;text-align: center">
            <div style="margin: auto" class="layui-input-inline">
                <button id="btn_login" type="button" class="layui-btn layui-bg-cyan" onclick="login()">登录</button>
            </div>
            <div style="margin: auto;" class="layui-input-inline">
                <button type="button" class="layui-btn layui-bg-cyan" onclick="register()">注册</button>
            </div>
        </div>
    </form>
</div>
<div style="text-align: center;font-size:20px;margin-top: 10%" class="layui-footer">
    <span class="layui-bg-gray">
        本项目尚未完成，许多功能都需要完善。给你带来的不便还请多多担待。
    </span>
</div>
</body>
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<script src="<%=basePath%>/static/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    function register() {
        layer.open({
            type: 2,
            title: '注册',
            content: ['<%=basePath%>/login/showRegister', 'no'],
            area: ['500px', '300px'],
        });
    };

    function login(){
        var name = $("input[name='name']").val();
        var pwd = $("input[name='pwd']").val();
        if(name.length == 0){
            layer.msg("用户名不能为空！",{icon:2,time:1000});
            return;
        }
        if(pwd.length == 0){
            layer.msg("密码不能为空！",{icon:2,time:1000});
            return;
        }
        var load;
        $.ajax({
            url: '<%=basePath%>/login/login',
            type: "post",
            contentType:'application/json',
            data:JSON.stringify({"name":name,"pwd":pwd}),
            beforeSend: function() {
                load = layer.load(1,{time:10*1000});
            },
            success:function(data) {
                var res = JSON.parse(data);
                if(res.msg == "success"){
                    window.location.href = "<%=basePath%>/main";
                }else if(res.msg == "failure"){
                    layer.msg("用户名或密码错误",{icon:2,time:1000});
                }else{
                    layer.msg("未知错误！",{icon:2,time:1000});
                }
            },
            error:function(){
                layer.msg("未知错误！",{icon:2,time:1000});
            },
            complete:function(){
                layer.close(load);
            }
        });
    }
</script>
</html>
