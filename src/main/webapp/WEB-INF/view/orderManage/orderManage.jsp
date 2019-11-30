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
    <form method="post" action="<%=basePath%>/order/search" class="layui-form layui-input-inline" style="margin-left: 20px">
        <strong style="margin-left: 20px">按</strong>
        <div style=" width:110px;" class="layui-input-inline">
            <select name="condition">
                <option value="" selected disabled>请选择</option>
                <option value="id">订单号</option>
                <option value="name">买家用户名</option>
            </select>
        </div>
        <strong>搜索</strong>
        <div  class="layui-input-inline">
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
        <tbody id="orderTbody">
        <c:forEach items="${pageBean.beanList}" var="order" >
            <tr>
                <th><input type="checkbox" class="layui-from-checked"></th>
                <td>${order.id}</td>
                <td>${order.user.name}</td>
                <td>${order.goodsNum}</td>
                <td>${order.totalMoney}</td>
                <td>
                    <c:choose>
                        <c:when test="${order.status eq 1}">未打印</c:when>
                        <c:when test="${order.status eq 2}">已打印</c:when>
                        <c:when test="${order.status eq 3}">已发货</c:when>
                        <c:otherwise>未知</c:otherwise>
                    </c:choose>
                </td>
                <td>${order.createTime}</td>
                <td>
                    <div class="layui-btn-group">
                        <a href="<%=basePath%>/order/detail?oId=${order.id}" target="iframe"><button id="printBtn" type="button" class="layui-btn layui-btn-sm layui-btn-normal">详情</button></a>
                        <a href="<%=basePath%>/order/print?oId=${order.id}" target="iframe"
                            <c:if test="${order.status !=1}">
                                onclick="javascript:return false;"
                            </c:if>
                        >
                            <button id="deliverBtn" type="button" class="layui-btn layui-btn-sm layui-btn-warm">打印</button></a>
                        <a href="<%=basePath%>/order/deliver?oId=${order.id}" target="iframe"
                            <c:if test="${order.status !=2}">
                                onclick="javascript:return false;"
                            </c:if>
                        >
                            <button type="button" class="layui-btn layui-btn-sm layui-btn-checked">发货</button></a>
                        <button type="button" onclick="deleteDo('${order.id}')" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <form class="layui-form" method="post" action="<%=basePath%>/order/paging">
        <a href="<%=basePath%>/order/paging?pageNumber=${pageBean.pageNumber-1}&pageSize=${pageBean.pageSize}"
                <c:if test="${pageBean.pageNumber<=1}">
                    onclick="javascript:return false;"
                </c:if> class="layui-input-inline">
            <button id="last" class="layui-btn layui-btn-sm layui-btn-normal" type="button" >上一页</button>
        </a>
        <a href="<%=basePath%>/order/paging?pageNumber=${pageBean.pageNumber+1}&pageSize=${pageBean.pageSize}"
                <c:if test="${pageBean.pageNumber>=pageBean.totalPage}">
                    onclick="javascript:return false;"
                </c:if> class="layui-input-inline">
            <button id="next" class="layui-btn layui-btn-sm layui-btn-normal" type="button" >下一页</button>
        </a>
        <strong>共&nbsp${pageBean.totalCount}&nbsp条,&nbsp${pageBean.totalPage}&nbsp页</strong>
        <strong style="margin-left: 100px">跳转到</strong>
        <div class="layui-input-inline">
            <input id="jump" name="pageNumber" lay-verify="number" style="width:50px;height:30px" type="text" class="layui-input" oninput="if(value>${pageBean.totalPage}){value=${pageBean.totalPage};}else if(value<=1){value=1;}">
        </div>
        <strong>页</strong>
        <button id="jump_btn" class="layui-input-inline layui-btn layui-btn-sm layui-btn-normal" type="submit" >跳转</button>
    </form>
</body>
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<script src="<%=basePath%>/static/js/jquery-3.4.1.js"></script>
<script>
    function deleteDo(oId){
        var layer = layui.layer;
        layer.open({
            title:'警告！',
            content:"是否要删除该订单？",
            btn:['确定','取消'],
            btn1:function(index,layero){
                $.ajax({
                    url:"<%=basePath%>/order/delete",
                    method:"post",
                    data:{oId:oId},
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
