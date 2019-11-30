<%--
  Created by IntelliJ IDEA.
  User: 19204
  Date: 2019-11-27
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/static/layui/css/layui.css">
</head>
<body>
<div>
    <form id="registerForm" class="layui-form" style="text-align: center;margin-top: 5%;">
        <div style="margin-left: 15%;" class="layui-form-item">
            <label class="layui-form-label"><i class="layui-icon layui-icon-user" style="font-size: 30px; color: #393D49;"></i></label>
            <div style="width:30%;" class="layui-input-inline">
                <input name="uName" type="text" required lay-verify="required" placeholder="请输入用户名" class="layui-input" onblur="return checkName();">
            </div>
            <span id="info"></span>
        </div>
        <div style="margin-left: 15%;" class="layui-form-item">
            <label class="layui-form-label"><i class="layui-icon layui-icon-password" style="font-size: 30px; color: #393D49;"></i></label>
            <div style="width:30%;" class="layui-input-block">
                <input name="uPwd" type="password" required lay-verify="required" placeholder="请输入密码" class="layui-input">
            </div>
        </div>
        <div style="margin-left: 15%;" class="layui-form-item">
            <label class="layui-form-label"><i class="layui-icon layui-icon-vercode" style="font-size: 30px; color: #393D49;"></i></label>
            <div style="width:20%;" class="layui-input-inline">
                <input id="check"  type="password" required lay-verify="required" class="layui-input" >
            </div>
            <div style="width:15%;" class="layui-input-inline">
                <input id="code" type="button" onclick="createCode()" style="border:none" class="layui-input" >
            </div>
        </div>
        <div class="layui-form-item">
            <button type="button" onclick="validate()" style="width:45%;" class="layui-btn layui-bg-cyan">注册</button>
        </div>
    </form>
</div>
</body>
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<script src="<%=basePath%>/static/js/jquery-3.4.1.js"></script>
<script type="text/javascript">
    function checkName(){
        var username = $("input[name='uName']").val();
        console.log(username)
        if(username != ''){
            $.ajax({
                url: '<%=basePath%>/login/findByName',
                type: 'post',
                dataType: 'json',
                data:JSON.stringify({"uName":username}),
                success: function(data){
                    if(data == null){
                        $("#info").text("可以注册").css({'color':'green','font-size':'10px'});
                        return true;
                    }
                    if(data != null){
                        $("#info").text("该用户名已注册").css({'color':'red','font-size':'10px'});
                        return false;
                    }
                },
                error: function(){
                    alert("错误");
                    return false;
                }
            });
        }
        if(username == ''){
            $("#info").text("");
        }
    }
</script>
<script type="text/javascript">
    //设置一个全局的变量，便于保存验证码
    var code;
    function createCode(){
        //首先默认code为空字符串
        code = '';
        //设置长度，这里看需求，我这里设置了4
        var codeLength = 4;
        var codeV = document.getElementById('code');
        //设置随机字符
        var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R', 'S','T','U','V','W','X','Y','Z');
        //循环codeLength 我设置的4就是循环4次
        for(var i = 0; i < codeLength; i++){
            //设置随机数范围,这设置为0 ~ 36
            var index = Math.floor(Math.random()*36);
            //字符串拼接 将每次随机的字符 进行拼接
            code += random[index];
        }
        //将拼接好的字符串赋值给展示的Value
        codeV.value = code;
    }

    //下面就是判断是否== 的代码，无需解释
    function validate(){
        var oValue = document.getElementById('check').value.toUpperCase();
        if(oValue == 0){
            layer.open({
                title: '提示',
                content: '请输入验证码'
            });
        }else if(oValue != code){
            $("#check").val("");
            layer.open({
                title: '提示',
                content: '您输入的验证码不正确，请重新输入'
            });
            createCode();
        }else if(checkName()){
            layer.open({
                title: '警告信息',
                content: '您输入的用户名有误，请重新输入'
            });
        }else{
            /*$("#registerForm").submit();*/
            var name = $("input[name='uName']").val();
            var pwd = $("input[name='uPwd']").val();
            $.ajax({
                url: '<%=basePath%>/login/register',
                type: 'post',
                dataType: 'json',
                contentType: 'application/json;charset=utf-8',
                data:JSON.stringify({"name":name,"pwd":pwd}),
                success: function(data){
                    var statusObj = data;
                    var status = statusObj.status;
                    console.log(status);
                    if(status == "success"){
                        layer.msg("注册成功！",{
                            time:0,
                            btn:['去登录'],
                            yes:function(){
                                var index = parent.layer.getFrameIndex(window.name);
                                parent.layer.close(index);
                            }
                        });
                    }else{
                        layer.alert("未知错误！请重试");
                        return false;
                    }
                },
                error: function(){
                    layer.alert("未知错误！请重试");
                    return false;
                }
            });
        }
    }
    window.onload = function (){
            createCode();
        }
</script>
</html>
