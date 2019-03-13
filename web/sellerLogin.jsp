<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>

        <title>登录</title>

        <meta http-equiv="pragma" content="no-cache">
        <meta http-equiv="cache-control" content="no-cache">
        <meta http-equiv="expires" content="0">
        <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
        <meta http-equiv="description" content="This is my page">
        <meta http-equiv="content-type" content="text/html;charset=utf-8">
        <!--
        <link rel="stylesheet" type="text/css" href="styles.css">
        -->

        <script type="text/javascript">
            function _change() {
                var ele = document.getElementById("img_verifyCode");
                ele.src = "<c:url value="/VerifyCodeServlet" />?xxx=" + new Date().getTime();
            }
        </script>
    </head>

    <body>
        <h1>登录</h1>
        <%--
            1.显示错误信息
            2.回显
        --%>
        <p style="font-size: 18px; color: firebrick">${msg }</p>
        <form action="<c:url value='/SellerServlet'/>" method="post" target="_top">
            <input type="hidden" name="method" value="login"/>
            用户名：<input type="text" name="s_name" value="${form.s_name}"/><br/>
            密　码：<input type="password" name="s_pwd"/><br/>
            验证码：<input type="text" size="3" name="s_verifyCode"/>
            <img id="img_verifyCode" src="<c:url value="/VerifyCodeServlet" />" border="1"/>
            <a href="javascript:_change()">看不清，换一张</a><br/>
            <input type="submit" value="登录"/>
        </form>
    </body>
</html>
