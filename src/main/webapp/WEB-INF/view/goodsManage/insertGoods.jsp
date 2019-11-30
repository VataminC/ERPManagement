<%--
  Created by IntelliJ IDEA.
  User: 19204
  Date: 2019-10-21
  Time: 15:08
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
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css">
    <title>添加商品信息</title>
</head>
<body>
    <div style="width:50%;margin:12% auto;">
        <form method="post" action="<%=basePath%>/goods/insertGoods" class="layui-form layui-form-pane">
            <div class="layui-form-item">
                <label class="layui-form-label">商品名称：</label>
                <div style="width:50%;" class="layui-input-block">
                    <input name="g_name" type="text" class="layui-input" placeholder="请输入商品名称">
                </div>
            </div>
            <div style="" class="layui-form-item">
                <label class="layui-form-label">类别：</label>
                <div class="layui-input-inline">
                    <select id="category" name="g_category">
                        <option disabled>请选择</option>
                    </select>
                </div>
            </div>
            <div style="" class="layui-form-item">
                <label class="layui-form-label">品牌：</label>
                <div class="layui-input-inline">
                    <select id="brand" name="g_brand">
                        <option disabled>请选择</option>
                    </select>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label ">价格：</label>
                <div style="width:20%;" class="layui-input-block">
                    <input name="g_price" type="text" class="layui-input" placeholder="请输入价格" value="${goods.price}">
                </div>
            </div>
            <div class="layui-form-item">
                <div style="width:20%;margin:0px 10%" class="layui-input-inline">
                    <input type="submit" class="layui-btn layui-bg-blue" value="提交">
                </div>
                <div style="width:20%;" class="layui-input-inline">
                    <input type="reset" class="layui-btn layui-bg-blue" value="重置">
                </div>
            </div>
        </form>
    </div>
</body>
<script src="<%=basePath%>/static/layui/layui.js"></script>
<script src= "<%=basePath%>/static/js/jquery-3.4.1.js"></script>
<script>
    layui.use('form', function(){
        var form = layui.form;
        $.ajax({
            url:"<%=basePath%>/goods/render",
            method:"post",
            dataType:"json",
            success:function(data){
                var categories = data.category;
                var cs = document.getElementById("category");
                for(var j=0;j<categories.length;j++){
                    var option = document.createElement("option");
                    option.setAttribute("value",categories[j].id);
                    option.innerText = categories[j].name;
                    cs.appendChild(option);
                }
                var brands =  data.brand;
                var bs = document.getElementById("brand");
                for(var i=0;i<brands.length;i++){
                    var option = document.createElement("option");
                    option.setAttribute("value",brands[i].id);
                    option.innerText = brands[i].name;
                    bs.appendChild(option);
                }
                form.render();
            }
        });
    });
</script>
</html>
