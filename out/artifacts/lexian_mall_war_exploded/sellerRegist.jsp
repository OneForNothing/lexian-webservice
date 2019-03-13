<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <head>

        <title>注册</title>

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

            //创建异步对象
            function createXMLHttpRequest() {
                try {
                    return new XMLHttpRequest(); //支持大多数浏览器
                } catch (e) {
                    try {
                        return new ActiveXObject("Msxml2.XMLHTTP"); //IE6.0
                    } catch (e) {
                        try {
                            return new ActiveXObject("Microsoft.XMLHTTP"); //IE5.5及更早版本
                        } catch (e) {
                            alert("您用的浏览器是啥？");
                            throw e;
                        }
                    }
                }
            }

            /** 要求元素的id和name值相同 */
            function confirm(id, url) {
                var element = document.getElementById(id);
                element.onchange = function () {
                    var xmlHttp = createXMLHttpRequest();
                    xmlHttp.open("POST", url, true);
                    xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    xmlHttp.send(id + "=" + element.value);
                    xmlHttp.onreadystatechange = function () {
                        if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                            //获取服务器的响应结果
                            var msg = xmlHttp.responseText;
                            //获取span元素
                            var span = document.getElementById(id + "_msg");
                            span.innerHTML = msg;
                        }
                    }
                };
            }

            /** 验证两次密码是否一致 */
            function confirmPassword() {
                var password1 = document.getElementById("s_pwd");
                var password2 = document.getElementById("_pwd");
                password2.onchange = function () {
                    var password2_msg = document.getElementById("_pwd_msg");
                    password2_msg.innerHTML = "";
                    if(password1.value != password2.value) {
                        password2_msg.innerHTML = "两次密码输入不一致！";
                    } else {
                        password2_msg.innerHTML = " √ ";
                    }
                }
            }

            window.onload = function () {
                confirm("s_name", "<c:url value='/ConfirmUsernameServlet'/>");
                confirm("s_pwd", "<c:url value='/ConfirmPasswordServlet'/>");
                confirm("s_email", "<c:url value='/ConfirmEmailServlet'/>");
                confirmPassword();
            }
        </script>
    </head>

    <body>
        <h1>注册</h1>
        <%--
        1.显示errors --> 字段错误
        2.显示异常错误
        3.回显
        --%>
        <p style="font-size: 18px; color: firebrick">${msg }</p>
        <form action="<c:url value="/SellerBeforeLoginServlet"/>" method="post">
            <input type="hidden" name="method" value="regist"/>
            用户名：<input type="text" id="s_name" name="s_name" value="${form.s_name}"/>
            <span id="s_name_msg" style="font-size: 12px; color: firebrick">${errors.s_name}</span>
            <br/>
            密　码：<input type="password" id="s_pwd" name="s_pwd"/>
            <span id="s_pwd_msg" style="font-size: 12px; color: firebrick">${errors.s_pwd}</span>
            <br/>
            重复密码：<input type="password" id="_pwd" name="_pwd"/>
            <span id="_pwd_msg" style="font-size: 12px; color: firebrick">${errors._pwd}</span>
            <br/>
            邮　箱：<input type="text" id="s_email" name="s_email" value="${form.s_email}"/>
            <span id="s_email_msg" style="font-size: 12px; color: firebrick">${errors.s_email}</span>
            <br/>
            验证码：<input type="text" size="3" name="s_verifyCode" />
            <img id="img_verifyCode" src="<c:url value="/VerifyCodeServlet" />" border="1"/>
            <a href="javascript:_change()">看不清，换一张</a><br/>
            <input type="submit" value="注册"/>
        </form>
    </body>
</html>
