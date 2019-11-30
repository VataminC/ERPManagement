<!DOCTYPE html>
<%@page contentType="text/html; utf-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <title>welcome</title>
  <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
  <div class="layui-header">
    <div class="layui-logo">电商管理平台</div>
    <!-- 头部区域（可配合layui已有的水平导航） -->
    <ul class="layui-nav layui-layout-left">
      <li class="layui-nav-item"><a href="">主页</a></li>
      <li class="layui-nav-item"><a href="<%=basePath%>/goods/paging" target="iframe">商品管理</a></li>
      <li class="layui-nav-item"><a href="<%=basePath%>/order/paging" target="iframe">订单管理</a></li>
      <li class="layui-nav-item"><a href="<%=basePath%>/store/paging" target="iframe">仓储管理</a></li>
      <li class="layui-nav-item"><a href="javascript:;">联系我们</a></li>
      <li class="layui-nav-item"><a href="javascript:;">关于</a></li>
      <li class="layui-nav-item">
        <a href="javascript:;">帮助</a>
        <dl class="layui-nav-child">
          <dd><a href="">邮件管理</a></dd>
          <dd><a href="">消息管理</a></dd>
          <dd><a href="">授权管理</a></dd>
        </dl>
      </li>
    </ul>
    <ul class="layui-nav layui-layout-right">
      <li class="layui-nav-item">
        <a href="javascript:;">
          <img src="<%=basePath%>/static/images/personal.jpg" class="layui-nav-img">
          ${login.uName}
        </a>
        <dl class="layui-nav-child">
          <dd><a href="">基本资料</a></dd>
          <dd><a href="">安全设置<span class="layui-badge-dot"></span></a></dd>
        </dl>
      </li>
      <li class="layui-nav-item"><a href="<%=basePath%>/login/logout">退出</a></li>
    </ul>
  </div>
  
  <div class="layui-side layui-bg-black">
  <div class="layui-side-scroll">
    <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
    <ul class="layui-nav layui-nav-tree">
      <li class="layui-nav-item layui-nav-itemed">
        <a class="" href="javascript:;">商品管理</a>
        <dl class="layui-nav-child">
          <dd><a href="<%=basePath%>/category/toCategoryManage" target="iframe">分类管理</a></dd>
          <dd><a href="<%=basePath%>/brand/toBrandManage" target="iframe">品牌管理</a></dd>
          <dd><a href="javascript:;">其他</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item">
        <a href="javascript:;">订单管理</a>
        <dl class="layui-nav-child">
          <dd><a href="javascript:;">其他</a></dd>
        </dl>
      </li>
      <li class="layui-nav-item">
        <a href="javascript:;">仓储管理</a>
        <dl class="layui-nav-child">
          <dd><a href="javascript:;">其他</a></dd>
        </dl>
      </li>
    </ul>
  </div>
</div>

<div class="layui-body">
  <!-- 内容主体区域 -->
  <iframe class="" style="width:100%;height: 100%;border:none" src="<%=basePath%>/login/welcome" name="iframe"></iframe>
</div>

<div class="layui-footer" style="text-align: left">
  <strong>Create by all is well,thank you for using it</strong>
</div>
</div>
<script src="<%=basePath%>/static/layui/layui.js"></script>
<script src= "<%=basePath%>/static/js/jquery-3.4.1.js"></script>
<script>
  layui.use('element', function(){
    var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
  });
</script>
</body>
</html>