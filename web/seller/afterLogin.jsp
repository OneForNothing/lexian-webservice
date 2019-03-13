<%--
  Created by IntelliJ IDEA.
  User: 炸弹人
  Date: 2018/8/24
  Time: 15:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <title>已登录</title>
    </head>
    <body>
        <h1>这是登录后才能到的页面，欢迎你：${session_seller.s_name}</h1>
        <a href="<c:url value="/seller/SellerServlet?method=quit"/>">退出登录</a><br/>
        <a href="<c:url value="/seller/SellerServlet?method=modifyPre&s_id=${session_seller.s_id}"/>">设置门店信息</a><br/>
        <a href="<c:url value="/seller/SellerOrderServlet?method=findAll"/>">查询所有订单</a><br/>
        按订单状态查询订单: <a href="<c:url value="/seller/SellerOrderServlet?method=findByState&state=1"/>">交易中订单</a>&nbsp;&nbsp;&nbsp;
        <a href="<c:url value="/seller/SellerOrderServlet?method=findByState&state=2"/>">已完成订单</a><br/>
        按订单时间查询订单:
        <form action="<c:url value="/seller/SellerOrderServlet?method=findByOrderTime"/>" method="post">
            <input type="date" name="orderTime"/>
            <input type="submit" value="查询"/>
        </form>
        <a href="<c:url value="/seller/SellerGoodsServlet?method=addGoodsPre"/>">上架商品</a><br/>
    </body>
</html>
