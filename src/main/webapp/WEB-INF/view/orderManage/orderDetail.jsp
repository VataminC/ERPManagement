<%--
  Created by IntelliJ IDEA.
  User: 19204
  Date: 2019-11-01
  Time: 21:58
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
    <title>详细</title>
</head>
<body>
    <table class="layui-table">
        <thead>
            <tr>
                <td>商品Id</td>
                <td>商品数量</td>
                <td>总金额</td>
                <td>订单编号</td>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${orderItems}" var="orderItem">
                <tr>
                    <td>${orderItem.goods.id}</td>
                    <td>${orderItem.goodsNumber}</td>
                    <td>${orderItem.totalMoney}</td>
                    <td>${orderItem.orderId}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
</html>
