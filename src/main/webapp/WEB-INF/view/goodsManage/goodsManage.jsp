<%--
  Created by IntelliJ IDEA.
  User: 19204
  Date: 2019-10-17
  Time: 13:44
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
    <title>数据显示</title>
</head>
<body>
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 100px;border-bottom: none;"><strong>商品管理</strong></legend>
    </fieldset>
    <div>
        <div class="layui-input-inline">
            <button style="margin-left: 20px" class="layui-btn layui-btn-danger layui-input-inline">批量删除</button>
            <a href="<%=basePath%>/goods/toInsert" target="iframe" class="layui-input-inline">
                <button class="layui-btn layui-btn-normal">添加商品</button>
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
        <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 100px;border-bottom: none;"><strong>商品信息</strong></legend>
    </fieldset>
    <table id="test" class="layui-table">
        <thead>
            <tr>
                <th><input id="checked" type="checkbox" class="layui-from-checked"></th>
                <th>id</th>
                <th>商品名称</th>
                <th>类别</th>
                <th>品牌</th>
                <th>价格</th>
                <th>创建时间</th>
                <th>操作</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${pageBean.beanList}" var="goods" >
                <tr>
                    <th><input type="checkbox" class="layui-from-checked"></th>
                    <td id="goods_id">${goods.id}</td>
                    <td>${goods.name}</td>
                    <td>${goods.category.name}</td>
                    <td>${goods.brand.name}</td>
                    <td>${goods.price}</td>
                    <td>${goods.date}</td>
                    <td>
                        <a href="<%=basePath%>/goods/toUpdateGoods?g_id=${goods.id}" target="iframe"><button type="button" class="layui-btn layui-btn-sm layui-btn-normal">编辑</button></a>
                        <button type="button" onclick="deleteDo(${goods.id})" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <form class="layui-form" method="post" action="<%=basePath%>/goods/paging">
        <a href="<%=basePath%>/goods/paging?pageNumber=${pageBean.pageNumber-1}&pageSize=${pageBean.pageSize}"
                <c:if test="${pageBean.pageNumber<=1}">
                    onclick="javascript:return false;"
                </c:if> class="layui-input-inline">
            <button id="last" class="layui-btn layui-btn-sm layui-btn-normal" type="button" >上一页</button>
        </a>
        <a href="<%=basePath%>/goods/paging?pageNumber=${pageBean.pageNumber+1}&pageSize=${pageBean.pageSize}"
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
<script src= "<%=basePath%>/static/js/jquery-3.4.1.js"></script>
<script>
    layui.use(['table','form'], function(){
        var table = layui.table;
        var form = layui.form;
    });
    function deleteDo(goods_ids){
        layer.open({
            title:'警告！',
            content:"是否要删除该商品？",
            btn:['确定','取消'],
            btn1:function(index,layero){
                $.ajax({
                    url:"<%=basePath%>/goods/delById",
                    method:"post",
                    data:{g_id:goods_ids},
                    success:function(data){
                        layer.open({
                            title: '提示信息',
                            content: '删除成功',
                            time: 2000
                        });
                        $("body").html(data);
                    },
                    error: function(){
                        layer.open({
                            title: '提示信息',
                            content: '删除失败'
                        });
                    }
                });
                layer.close(index);
            }
        });
    }
</script>
</html>
