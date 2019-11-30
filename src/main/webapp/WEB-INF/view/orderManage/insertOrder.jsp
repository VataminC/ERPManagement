<%--
  Created by IntelliJ IDEA.
  User: 19204
  Date: 2019-10-26
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <link rel="stylesheet" href="<%=basePath%>/static/layui/css/layui.css">
    <title>添加订单</title>
</head>
<body>
    <fieldset class="layui-elem-field layui-field-title">
        <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 100px;border-bottom: none;"><strong>添加订单</strong></legend>
    </fieldset>
    <div style="width:55%;height: 100%;margin: 0px 2% "  class="layui-input-inline">
        <table id="" style="text-align: center" class="layui-table">
            <thead>
            <tr>
                <th width="10% ">id</th>
                <th>商品名称</th>
                <th>价格</th>
                <th width="15%">操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${pageBean.beanList}" var="goods">
                <tr id="${goods.id}">
                    <td>${goods.id}</td>
                    <td>${goods.name}</td>
                    <td>${goods.price}</td>
                    <td>
                        <button type="button" class="layui-btn layui-btn-sm layui-btn-normal" onclick="addGoods(${goods.id})">添加</button>
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
            <strong>共&nbsp${pageBean.totalCount}&nbsp,&nbsp${pageBean.totalPage}&nbsp页,</strong>
            <strong style="margin-left: 100px">跳转到</strong>
            <div class="layui-input-inline">
                <input name="pageNumber" lay-verify="number" style="width:50px;height:30px" type="text" class="layui-input" oninput="if(value>${pageBean.totalPage}){value=${pageBean.totalPage};}else if(value<=1){value=1;}">
            </div>
            <strong>页</strong>
            <button class="layui-input-inline layui-btn layui-btn-sm layui-btn-normal" type="submit" >跳转</button>
        </form>
    </div>
    <div style="width: 1px;height: 100%;background-color: gray" class="layui-input-inline"></div>
    <div style="width: 35%;height: 100%;margin: 0px 2% " class="layui-input-inline">
        <div style="width: 100%;height: 30%;">
            <fieldset class="layui-elem-field layui-field-title">
                <legend style="margin-left: 20px;padding: 0 10px;text-align: left;width: 170px;border-bottom: none;"><strong>已添加的商品</strong></legend>
            </fieldset>
            <form method="post" action="<%=basePath%>/category/updateCategory" >
                <table id="addedGOods" class="layui-table">
                    <thead>
                        <tr>
                            <th>id</th>
                            <th>商品名称</th>
                            <th>价格</th>
                            <th>数量</th>
                        </tr>
                    </thead>
                    <tbody id="inner"></tbody>
                </table>
            </form>
            <button id="createOrder" class="layui-btn layui-btn-normal">生成订单</button>
            <button id="clear" class="layui-btn layui-btn-danger layui-input-inline">清空</button>
        </div>
    </div>
</body>
<script src="<%=basePath%>/static/layui/layui.all.js"></script>
<script src= "<%=basePath%>/static/js/jquery-3.4.1.js"></script>
<script>
    function addGoods(goodsId){
        //获取数据表格中的值
        var gId = $("#"+goodsId).children("td").eq(0).text();
        var gName = $("#"+goodsId).children("td").eq(1).text();
        var gPrice = $("#"+goodsId).children("td").eq(2).text();
        //获取所有tr
        //alert(gId+"-"+gName+"-"+gPrice);
        var trList = $("#inner").children("tr");
        var num = 1;
        //判断是否已经添加了商品
        var flag = false;
        if(trList.length>0){
            for(var i=0;i<trList.length;i++){
                //获取trList中的第i个tr的所有td
                var tdArr = trList.eq(i).find("td");
                //获取id值
                var id = tdArr.eq(0).text();
                //获取商品数量
                num = tdArr.eq(3).text();
                //是否商品是否存在于列表
                console.log(id==gId);
                if(id==gId){//存在：将其数量+1
                    num++;
                    tdArr.eq(3).html(num);
                    flag = true;
                    break;
                }
            }
            if(!flag){
                createTr(gId,gName,gPrice);
            }
        }else{  //未添加
            createTr(gId,gName,gPrice);
        }
    };
    function createTr(gId,gName,gPrice){
        var tr = document.createElement("tr");
        var td0 = document.createElement("td");
        td0.innerText = gId;
        tr.appendChild(td0);
        var td1 = document.createElement("td");
        td1.innerText = gName;
        tr.appendChild(td1);
        var td2 = document.createElement("td");
        td2.innerText = gPrice;
        tr.appendChild(td2);
        var td3 = document.createElement("td");
        td3.innerText = 1;
        tr.appendChild(td3);
        $("#inner").append(tr);
    };

    $("#createOrder").click(function(){
        var trList = $("#inner").children("tr");
        var array = [];
        for(var i=0;i<trList.length;i++){
            var tdList = trList.eq(i).children();
            var id = parseInt(tdList.eq(0).text());
            var price = parseFloat(tdList.eq(2).text());
            var num = Number(tdList.eq(3).text());
            array.push({"id":id,"price":price,"num":num})
        }
        var json = JSON.stringify(array);
        $.ajax({
            url:'<%=basePath%>/order/createOrder',
            method:"POST",
            data:{"data":json},
            success:function(){
                $("#inner").empty();
            }
        });
    });
    $("#clear").click(function(){
       $("#inner").empty()
    });
</script>
</html>
