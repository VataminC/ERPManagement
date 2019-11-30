<%--
  Created by IntelliJ IDEA.
  User: 19204
  Date: 2019-10-25
  Time: 21:05
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
    <title>订单管理</title>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title">
    <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 100px;border-bottom: none;"><strong>订单管理</strong></legend>
</fieldset>
<div>
    <div class="layui-input-inline">
        <button style="margin-left: 20px" class="layui-btn layui-btn-danger layui-input-inline">批量删除</button>
        <a href="<%=basePath%>/order/toInsertPaging" target="iframe" class="layui-input-inline">
            <button class="layui-btn layui-btn-normal">添加订单</button>
        </a>
    </div>
    <form method="post" action="<%=basePath%>/goods/search" class="layui-form layui-input-inline" style="margin-left: 20px">
        <strong style="margin-left: 20px">按</strong>
        <div style=" width:100px;" class="layui-input-inline">
            <select name="condition">
                <option disabled>请选择</option>
                <option value="id">id</option>
                <option value="name">商品名称</option>
                <option value="category">类别</option>
                <option value="brand">品牌</option>
            </select>
        </div>
        <strong>搜索</strong>
        <div class="layui-input-inline">
            <input type="text" name="content" placeholder="请输入你要查询的内容" class="layui-input">
        </div>
        <button type="submit" class="layui-btn layui-btn-normal layui-input-inline">搜索</button>
    </form>
</div>
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 100px;border-bottom: none;"><strong>订单信息</strong></legend>
    </fieldset>
    <table id="test" class="layui-table">
        <thead>
        <tr>
            <th><input id="checked" type="checkbox" class="layui-from-checked"></th>
            <th>订单号</th>
            <th>买家用户名</th>
            <th>商品数量</th>
            <th>订单总金额</th>
            <th>订单状态</th>
            <th>订单创建时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageBean.beanList}" var="order" >
            <tr>
                <th><input type="checkbox" class="layui-from-checked"></th>
                <td id="goods_id">${order.id}</td>
                <td>${order.user.uName}</td>
                <td>${order.goodsNum}</td>
                <td>${order.totalMoney}</td>
                <td>${order.status}</td>
                <td>${order.createTime}</td>
                <td>
                    <a href="<%=basePath%>/order/detail?oId=${order.id}" target="iframe"><button type="button" class="layui-btn layui-btn-sm layui-btn-normal">详情</button></a>
                    <button type="button" onclick="deleteDo(${order.id})" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <form class="layui-form" method="post" action="<%=basePath%>/order/toInsertPaging">
        <a href="<%=basePath%>/order/toInsertPaging?pageNumber=${pageBean.pageNumber-1}&pageSize=${pageBean.pageSize}"
                <c:if test="${pageBean.pageNumber<=1}">
                    onclick="javascript:return false;"
                </c:if> class="layui-input-inline">
            <button id="last" class="layui-btn layui-btn-sm layui-btn-normal" type="button" >上一页</button>
        </a>
        <a href="<%=basePath%>/order/toInsertPaging?pageNumber=${pageBean.pageNumber+1}&pageSize=${pageBean.pageSize}"
                <c:if test="${pageBean.pageNumber>=pageBean.totalPage}">
                    onclick="javascript:return false;"
                </c:if> class="layui-input-inline">
            <button id="next" class="layui-btn layui-btn-sm layui-btn-normal" type="button" >下一页</button>
        </a>
        <strong>共&nbsp${pageBean.totalCount}&nbsp条,&nbsp${pageBean.totalPage}&nbsp页</strong>
        <strong style="margin-left: 100px">跳转到</strong>
        <div class="layui-input-inline">
            <input id="jump" name="pageNumber" lay-verify="number" style="width:50px;height:30px" type="text" class="layui-input">
        </div>
        <strong>页</strong>
        <button id="jump_btn"  class="layui-input-inline layui-btn layui-btn-sm layui-btn-normal" type="submit" >跳转</button>
    </form>
</body>
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<script src= "<%=basePath%>/static/js/jquery-3.4.1.js"></script>

</html>
