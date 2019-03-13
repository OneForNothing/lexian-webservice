<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>修改商家信息</title>
        <link rel="stylesheet" href="<c:url value="/sellerjsps/works/css/information-modify.css"/>">
        <link rel="stylesheet" href="<c:url value="/sellerjsps/works/css/manager-main.css"/>">
        <link rel="stylesheet" href="<c:url value="/common/css/base.css"/>">
    </head>
    <body>
        <a href="javascript:history.go(-1);" style="float: left; margin-left: 20px">&lt;&lt;返回</a><br/>
        <div id="modify">
            <label id="modify-title">修改商店信息</label>
            <form action="<c:url value='/seller/SellerServlet'/>">
                <input type="hidden" name="method" value="modifyInfo"/>
                <input type="hidden" name="s_id" value="${seller.s_id}"/>
                <div class="modify-shopname">
                    <label>店&nbsp;&nbsp;&nbsp;名&nbsp;：</label>
                    <input type="text" id="modify-shopname" name="s_storeName" value="${seller.s_storeName}">
                </div>
                <div class="modify-tel">
                    <label>电&nbsp;&nbsp;&nbsp;话&nbsp;：</label>
                    <input type="tel" id="modify-tel" name="s_phone" value="${seller.s_phone}">
                </div>
                <div class="modify-address">
                    <label>地&nbsp;&nbsp;&nbsp;址&nbsp;：</label>
                    <input type="text" id="modify-address" name="s_addr" value="${seller.s_addr}">
                </div>
                <div class="modify-email">
                    <label>邮&nbsp;&nbsp;&nbsp;箱&nbsp;：</label>
                    <input type="emailt" id="modify-email" name="s_email" value="${seller.s_email}">
                </div>
                <div class="modify-time">
                    <label>营业时间：</label>
                    <c:choose>
                        <c:when test="${s_openTime eq null}">
                            <input type="time" id="modify-opentime" name="s_openTime" value="${seller.s_openTime}">
                        </c:when>
                        <c:otherwise>
                            <input type="time" id="modify-opentime" name="s_openTime" value="${s_openTime}">
                        </c:otherwise>
                    </c:choose>
                    至
                    <c:choose>
                        <c:when test="${s_openTime eq null}">
                            <input type="time" id="modify-closetime" name="s_closeTime" value="${seller.s_closeTime}">
                        </c:when>
                        <c:otherwise>
                            <input type="time" id="modify-closetime" name="s_closeTime" value="${s_closeTime}">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="modify-bottom" style="margin-bottom: 20px">
                    <input type="submit" id="save" value="保存" style="border: none"/>
                </div>
            </form>
            <p style="font-size: 18px; color: firebrick">${msg }</p>
        </div>
    </body>
</html>
