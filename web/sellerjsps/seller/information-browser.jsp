<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>商家信息</title>
        <link rel="stylesheet" href="<c:url value="/sellerjsps/works/css/information-browser.css"/>">
        <link rel="stylesheet" href="<c:url value="/sellerjsps/works/css/manager-main.css"/>">
        <link rel="stylesheet" href="<c:url value="/common/css/base.css"/>">
    </head>
    <body>
        <a href="javascript:history.go(-1);" style="float: left; margin-left: 20px">&lt;&lt;返回</a><br/>
        <div id="show">
            <form action="">
                <div class="show-shopname">
                    <c:choose>
                        <c:when test="${seller eq null}">
                            <input type="text" id="show-shopname" value="${session_seller.s_storeName}"
                                   disabled="disabled">
                        </c:when>
                        <c:otherwise>
                            <input type="text" id="show-shopname" value="${seller.s_storeName}" disabled="disabled">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="show-tel">
                    <label class="col-3">电&nbsp;&nbsp;&nbsp;话：</label>
                    <c:choose>
                        <c:when test="${seller eq null}">
                            <input type="text" class="col-7" id="show-tel" value="${session_seller.s_phone}"
                                   disabled="disabled">
                        </c:when>
                        <c:otherwise>
                            <input type="text" class="col-7" id="show-tel" value="${seller.s_phone}"
                                   disabled="disabled">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="show-address">
                    <label class="col-3">地&nbsp;&nbsp;&nbsp;址：</label>
                    <c:choose>
                        <c:when test="${seller eq null}">
                            <input type="text" class="col-7" id="show-address" value="${session_seller.s_addr}"
                                   disabled="disabled">
                        </c:when>
                        <c:otherwise>
                            <input type="text" class="col-7" id="show-address" value="${seller.s_addr}"
                                   disabled="disabled">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="show-email">
                    <label class="col-3">邮&nbsp;&nbsp;&nbsp;箱：</label>
                    <c:choose>
                        <c:when test="${seller eq null}">
                            <input type="text" class="col-7" id="show-email" value="${session_seller.s_email}"
                                   disabled="disabled">
                        </c:when>
                        <c:otherwise>
                            <input type="text" class="col-7" id="show-email" value="${seller.s_email}"
                                   disabled="disabled">
                        </c:otherwise>
                    </c:choose>
                </div>
                <div class="show-time">
                    <label class="col-3">营业时间：</label>
                    <c:choose>
                        <c:when test="${seller eq null}">
                            <input type="text" id="show-opentime" value="${session_seller.s_openTime}"
                                   disabled="disabled">
                        </c:when>
                        <c:otherwise>
                            <input type="text" id="show-opentime" value="${seller.s_openTime}" disabled="disabled">
                        </c:otherwise>
                    </c:choose>
                    &nbsp;至&nbsp;
                    <c:choose>
                        <c:when test="${seller eq null}">
                            <input type="text" id="show-closetime" value="${session_seller.s_closeTime}"
                                   disabled="disabled">
                        </c:when>
                        <c:otherwise>
                            <input type="text" id="show-closetime" value="${seller.s_closeTime}" disabled="disabled">
                        </c:otherwise>
                    </c:choose>
                </div>
            </form>
        </div>

    </body>
</html>
