<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
    <head lang="en">
        <title>设置门店信息</title>
        <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->
        <style type="text/css">
            body {
                background: rgb(254, 238, 189);
            }
        </style>
        <script type="text/javascript">
            function _change() {
                var ele = document.getElementById("img_verifyCode");
                ele.src = "<c:url value="/VerifyCodeServlet" />?xxx=" + new Date().getTime();
            }
        </script>
    </head>

    <body>
        <h1>设置门店信息</h1>
        <p style="font-weight: 900; color: red">${msg }</p>
        <form action="<c:url value="/SellerServlet"/>" method="post">
            <input type="hidden" name="method" value="modifyInfo"/>
            <input type="hidden" name="s_id" value="${seller.s_id}"/>
            门店名称：<input style="width: 150px; height: 20px;" type="text" name="s_storeName" value="${seller.s_storeName}"/><br/>
            门店电话：<input style="width: 223px; height: 20px;" type="text" name="s_phone" value="${seller.s_phone}"/><br/>
            门店地址：<input style="width: 150px; height: 20px;" type="text" name="s_addr" value="${seller.s_addr}"/><br/>
            营业时间：<input style="width: 150px; height: 20px;" type="time" name="s_openTime" value="${seller.s_openTime}"/> ——
            <input style="width: 150px; height: 20px;" type="time" name="s_closeTime" value="${seller.s_closeTime}"/><br/>
            验证码：<input type="text" size="3" name="s_verifyCode" />
            <img id="img_verifyCode" src="<c:url value="/VerifyCodeServlet" />" border="1"/>
            <a href="javascript:_change()">看不清，换一张</a><br/>
            <input type="submit" value="保存修改"/>
        </form>
    </body>
</html>
