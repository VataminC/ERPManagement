<%--
  Created by IntelliJ IDEA.
  User: 19204
  Date: 2019-10-21
  Time: 20:43
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
    <title>类别管理</title>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title">
    <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 100px;border-bottom: none;"><strong>类别管理</strong></legend>
</fieldset>
<div style="width:45%;height: 100%;margin: 0px 2% "  class="layui-input-inline">
    <table id="" style="text-align: center" class="layui-table">
        <thead>
        <tr>
            <th width="10% ">id</th>
            <th>类别名称</th>
            <th width="24%">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pageBean.beanList}" var="category">
            <tr>
                <td>${category.id}</td>
                <td>${category.name}</td>
                <td>
                    <a href="<%=basePath%>/category/toUpdateCategory?c_id=${category.id}" target="iframe"><button type="button" class="layui-btn layui-btn-sm layui-btn-normal">编辑</button></a>
                    <button type="button" onclick="deleteDo(${category.id})" class="layui-btn layui-btn-sm layui-btn-danger">删除</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <form class="layui-form" method="post" action="<%=basePath%>/brand/paging">
        <a href="<%=basePath%>/category/paging?pageNumber=${pageBean.pageNumber-1}&pageSize=${pageBean.pageSize}"
                <c:if test="${pageBean.pageNumber<=1}">
                    onclick="javascript:return false;"
                </c:if> class="layui-input-inline">
            <button id="last" class="layui-btn layui-btn-sm layui-btn-normal" type="button" >上一页</button>
        </a>
        <a href="<%=basePath%>/category/paging?pageNumber=${pageBean.pageNumber+1}&pageSize=${pageBean.pageSize}"
                <c:if test="${pageBean.pageNumber>=pageBean.totalPage}">
                    onclick="javascript:return false;"
                </c:if> class="layui-input-inline">
            <button id="next" class="layui-btn layui-btn-sm layui-btn-normal" type="button" >下一页</button>
        </a>
        <strong>共&nbsp${pageBean.totalCount}&nbsp条,&nbsp${pageBean.totalPage}&nbsp页,</strong>
        <strong style="margin-left: 100px">跳转到</strong>
        <div class="layui-input-inline">
            <input name="pageNumber" lay-verify="number" style="width:50px;height:30px" type="text" class="layui-input" oninput="if(value>${pageBean.totalPage}){value=${pageBean.totalPage};}else if(value<=1){value=1;}">
        </div>
        <strong>页</strong>
        <button class="layui-input-inline layui-btn layui-btn-sm layui-btn-normal" type="submit" >跳转</button>
    </form>
</div>
<div style="width: 1px;height: 100%;background-color: gray" class="layui-input-inline"></div>
<div style="width: 45%;height: 100%;margin: 0px 2% " class="layui-input-inline">
    <div style="width: 100%;height: 30%;">
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 100px;border-bottom: none;"><strong>编辑类别</strong></legend>
        </fieldset>
        <form method="post" action="<%=basePath%>/category/updateCategory" class="layui-form layui-form-pane">
            <div style="margin-left: 20%;" class="layui-form-item">
                <label class="layui-form-label">id：</label>
                <div style="width: 25%;" class="layui-input-block">
                    <input name="reId" type="text" value="${category.id}" class="layui-input" readonly>
                </div>
            </div>
            <div style="margin-left: 20%;" class="layui-form-item">
                <label class="layui-form-label">类别名称：</label>
                <div style="width: 30%;" class="layui-input-block">
                    <input name="reName" type="text" value="${category.name}" class="layui-input" placeholder="请重新输入类别名称">
                </div>
            </div>
            <div style="margin-left: 35%;" class="layui-form-item">
                <input type="submit" class="layui-btn layui-bg-blue" value="提交" >
            </div>
        </form>
    </div>
    <div style="width: 100%;height: 30%">
        <fieldset class="layui-elem-field layui-field-title">
            <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 100px;border-bottom: none;"><strong>添加类别 </strong></legend>
        </fieldset>
        <form method="post" action="<%=basePath%>/category/insBrand" class="layui-form layui-form-pane">
            <div style="margin-left: 20%;" class="layui-form-item">
                <label class="layui-form-label">类别名称：</label>
                <div style="width: 30%;" class="layui-input-block">
                    <input name="insName" type="text" class="layui-input" placeholder="请输入类别名称">
                </div>
            </div>
            <div style="margin-left: 35%;" class="layui-form-item">
                <input type="submit" class="layui-btn layui-bg-blue" value="添加" >
            </div>
        </form>
    </div>
</div>
</body>
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<script src="<%=basePath%>/static/js/jquery-3.4.1.js"></script>
<script>
    function deleteDo(cId){
        var layer = layui.layer;
        layer.open({
            title:'警告！',
            content:"是否要删除该商品类别？（如果该类别下有商品，此操作将会失败）",
            btn:['确定','取消'],
            btn1:function(index,layero){
                $.ajax({
                    url:"<%=basePath%>/category/delete",
                    method:"post",
                    data:{cId:cId},
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
