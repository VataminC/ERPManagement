<%--
  Created by IntelliJ IDEA.
  User: 19204
  Date: 2019-10-24
  Time: 20:52
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
    <title>Title</title>
</head>
<body>
    <div style="text-align: center;margin: 20% auto">
        <strong style="font-size: 200%;color: #009688;">欢迎使用ERP电商管理平台</strong>
    </div>
</body>
<script src="<%=basePath%>/static/layui/layui.js"></script>
<script src= "<%=basePath%>/static/js/jquery-3.4.1.js"></script>
</html>
