<%--
  Created by IntelliJ IDEA.
  User: 19204
  Date: 2019-10-24
  Time: 14:43
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
    <title>仓库管理</title>
</head>
<body>
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 100px;border-bottom: none;"><strong>仓库管理</strong></legend>
    </fieldset>
    <div>
        <form method="post" action="<%=basePath%>/store/selByCondition" class="layui-form layui-input-inline" style="margin-left: 20px">
            <strong style="margin-left: 20px">按商品</strong>
            <div style=" width:100px;" class="layui-input-inline">
                <select name="condition">
                    <option disabled>请选择</option>
                    <option value="id">id</option>
                    <option value="name">商品名称</option>
                    <option value="category">类别</option>
                    <option value="brand">品牌</option>
                </select>
            </div>
            <strong>&nbsp&nbsp&nbsp查看&nbsp&nbsp&nbsp</strong>
            <div class="layui-input-inline">
                <input type="text" name="content" placeholder="请输入你要查询的内容" class="layui-input">
            </div>
            <button type="submit" class="layui-btn layui-btn-normal layui-input-inline">搜索</button>
        </form>
    </div>
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 120px;border-bottom: none;"><strong>商品库存信息</strong></legend>
    </fieldset>
    <table id="test" class="layui-table">
        <thead>
        <tr>
            <th>id</th>
            <th>商品id</th>
            <th>商品名称</th>
            <th>剩余库存</th>
            <th>未发库存</th>
            <th>已发库存</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageBean.beanList}" var="store" >
            <tr>
                <td>${store.id}</td>
                <td>${store.goods.id}</td>
                <td>${store.goods.name}</td>
                <td>${store.residueGoods}</td>
                <td>${store.unDeliverGoods}</td>
                <td>${store.deliveredGoods}</td>
                <td>
                    <a href="<%=basePath%>/store/detail?goodsId=${store.goods.id}" target="iframe"><button type="button" class="layui-btn layui-btn-sm layui-btn-normal">明细</button></a>
                    <a href="<%=basePath%>/store/toWarehousing?sId=${store.id}" target="iframe"><button type="button" class="layui-btn layui-btn-sm layui-btn-warm">编辑.</button></a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <form class="layui-form" method="post" action="<%=basePath%>/goods/paging">
        <a href="<%=basePath%>/store/paging?pageNumber=${pageBean.pageNumber-1}&pageSize=${pageBean.pageSize}"
                <c:if test="${pageBean.pageNumber<=1}">
                    onclick="javascript:return false;"
                </c:if> class="layui-input-inline">
            <button id="last" class="layui-btn layui-btn-sm layui-btn-normal" type="button" >上一页</button>
        </a>
        <a href="<%=basePath%>/store/paging?pageNumber=${pageBean.pageNumber+1}&pageSize=${pageBean.pageSize}"
                <c:if test="${pageBean.pageNumber>=pageBean.totalPage}">
                    onclick="javascript:return false;"
                </c:if> class="layui-input-inline">
            <button id="next" class="layui-btn layui-btn-sm layui-btn-normal" type="button" >下一页</button>
        </a>
        <strong>共&nbsp${pageBean.totalCount}&nbsp,&nbsp${pageBean.totalPage}&nbsp页</strong>
        <strong style="margin-left: 100px">跳转到</strong>
        <div class="layui-input-inline">
            <input id="jump" name="pageNumber" lay-verify="number" style="width:50px;height:30px" type="text" class="layui-input">
        </div>
        <strong>页</strong>
        <button id="jump_btn"  class="layui-input-inline layui-btn layui-btn-sm layui-btn-normal" type="submit" >跳转</button>
    </form>
</body>
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<script src="<%=basePath%>/static/js/jquery-3.4.1.js"/>
</html>
