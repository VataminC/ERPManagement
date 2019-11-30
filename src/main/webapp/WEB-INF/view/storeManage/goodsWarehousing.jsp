<%--
  Created by IntelliJ IDEA.
  User: 19204
  Date: 2019-10-25
  Time: 14:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css">
    <title>商品入库</title>
</head>
<body>
    <div style="width:50%;margin:12% auto;">
        <form method="post" action="<%=basePath%>/store/addRepertory" class="layui-form layui-form-pane">
            <div class="layui-form-item">
                <label class="layui-form-label">库存ID：</label>
                <div style="width:10%;" class="layui-input-block">
                    <input name="sId" type="text" class="layui-input" value="${store.id}" readonly>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">商品ID：</label>
                <div style="width:10%;" class="layui-input-inline">
                    <input name="gId" type="text" class="layui-input" value="${store.goods.id}" readonly>
                </div>
            </div>
            <div style="" class="layui-form-item">
                <label class="layui-form-label">商品名称：</label>
                <div style="width:50%;" class="layui-input-inline">
                    <input  type="text" class="layui-input" value="${store.goods.name}" readonly>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label ">剩余库存：</label>
                <div style="width:30%;" class="layui-input-block">
                    <input name="residueGoods" type="text" class="layui-input" value="${store.residueGoods}" readonly>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label ">添加库存：</label>
                <div style="width:30%;" class="layui-input-block">
                    <input name="addRepertory" type="text" class="layui-input" lay-verify="number" placeholder="请输入添加商品的数量">
                </div>
            </div>
            <div style=" " class="layui-form-item">
                <b style="color: #FFB800;font-size: 10px">tip:输入负数可减少库存</b>
            </div>
            <div class="layui-form-item">
                <div style="width:20%;margin:0px 10%" class="layui-input-inline">
                    <input type="submit" class="layui-btn layui-bg-blue" value="添加">
                </div>
                <div style="width:20%;" class="layui-input-inline">
                    <input type="reset" class="layui-btn layui-bg-blue" value="重置">
                </div>
            </div>
        </form>
    </div>
</body>
<script src="<%=basePath%>/static/layui/layui.all.js"/>
<script src="<%=basePath%>/static/js/jquery-3.4.1.js"/>
</html>
