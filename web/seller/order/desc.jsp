<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html>
  <head>
    <title>订单详细</title>

<style type="text/css">
	* {
		font-size: 11pt;
	}
	div {
		border: solid 2px gray;
		width: 75px;
		height: 75px;
		text-align: center;
	}
	li {
		margin: 10px;
	}
</style>
  </head>
  
  <body>
<h1>当前订单</h1>

<table border="1" width="100%" cellspacing="0" background="black">
	<tr bgcolor="gray" bordercolor="gray">
		<td colspan="6">
			订单编号：${order.o_id}
			成交时间：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${order.o_orderTime}"/>
			金额：<font color="red"><b>${order.o_totalPrice}</b></font>
			买家：${order.o_user.u_name}
			订单状态：
			<c:choose>
				<c:when test="${order.o_state eq 1}">交易中</c:when>
				<c:when test="${order.o_state eq 2}">已完成</c:when>
			</c:choose>
			<%--<c:choose>--%>
				<%--<c:when test="${state eq '0'}">--%>
					<%--<a href="<c:url value="/seller/SellerOrderServlet?method=findAll&state=${state}"/>">返回所有订单</a></c:when>--%>
				<%--<c:when test="${state eq '1'}">&nbsp;&nbsp;--%>
					<%--<a href="<c:url value="/seller/SellerOrderServlet?method=findByState&state=${order.o_state}"/>">返回未付款订单</a></c:when>--%>
				<%--<c:when test="${state eq '2'}">&nbsp;&nbsp;--%>
					<%--<a href="<c:url value="/seller/SellerOrderServlet?method=findByState&state=${order.o_state}"/>">返回已付款订单</a></c:when>--%>
			<%--</c:choose>--%>
		</td>
	</tr>

	<c:forEach items="${order.o_orderItemList}" var="orderItem">
		<tr bordercolor="gray" align="center">
			<td width="15%">
				<div><img src="<c:url value="/${orderItem.oi_goods.g_image}"/>" height="75"/></div>
			</td>
			<td>商品名：${orderItem.oi_goods.g_name}</td>
			<td>单价：${orderItem.oi_singlePrice}元</td>
			<td>数量：${orderItem.oi_count}</td>
			<td>小计：${orderItem.oi_subTotal}元</td>
		</tr>
	</c:forEach>

</table>
  </body>
</html>

