<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
    <head>
        <title>上架商品</title>

        <style type="text/css">
            body {
                background: rgb(254, 238, 189);
            }
        </style>
        <script type="text/javascript">
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
            window.onload = function () {
                /**
                 * 给<select id="type">添加onchange监听
                 */
                document.getElementById("type").onchange = function () {
                    //异步请求服务器，得到选择的省下所有市
                    var xmlHttp = createXMLHttpRequest();
                    xmlHttp.open("POST", "<c:url value="/LoadSubTypeServlet"/>", true);
                    //设置请求头
                    xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
                    //发送
                    xmlHttp.send("t_id=" + this.value); //用户选择的一级分类id
                    xmlHttp.onreadystatechange = function () {
                        if(xmlHttp.readyState == 4 && xmlHttp.status == 200) {
                            /**
                             * 0.先要清空原来的<option>元素
                             * 1.得到服务器发送过来的所有二级分类
                             * 2.使用每个二级分类生成<option>元素添加到<select id="subtype">中
                             */
                            //清空<select id="subtype">中的选项
                            var subtypeSelect = document.getElementById("subtype");
                            //获取select中的所有子元素
                            var subtypeOptionArray = subtypeSelect.getElementsByTagName("option");
                            while(subtypeOptionArray.length > 1) { //这里只控制循环的次数
                                subtypeSelect.removeChild((subtypeOptionArray[1])); //只删除1下标，不会删除0
                            }

                            //得到服务器发送过来的所有二级分类
                            var subtypeArray = eval("(" + xmlHttp.responseText + ")");
                            for(var i=0; i<subtypeArray.length; i++) {
                                var subtype = subtypeArray[i]; //得到每个subtype对象
                                var optionEle = document.createElement("option"); //创建option元素
                                optionEle.value = subtype.sub_id; //给<option>的实际值赋为sub_id
                                var textNode = document.createTextNode(subtype.sub_name);//给<option>的显示值赋为sub_name
                                optionEle.appendChild(textNode);

                                //把option元素添加到select元素中
                                document.getElementById("subtype").appendChild(optionEle);
                            }
                        }
                    };
                }
            };
        </script>
    </head>

    <body>
        <h1>上架商品</h1>
        <p style="font-size: 16px; color: firebrick">${msg }</p>
        <form action="<c:url value="/seller/SellerAddGoodsServlet"/>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="s_id" value="${session_seller.s_id}"/>
            商品名称：<input style="width: 150px; height: 20px;" type="text" name="g_name" value="${goods.g_name}"/><br/>
            商品价格：<input style="width: 150px; height: 20px;" type="text" name="g_price" value="${goods.g_price}"/><br/>
            促销价格：<input style="width: 150px; height: 20px;" type="text" name="g_discount" value="${goods.g_discount}"/><br/>
            商品描述：<input style="width: 500px; height: 20px;" type="text" maxlength="200" name="g_desc" value="${goods.g_desc}"/><br/>
            商品图片：<input style="width: 225px; height: 20px;" type="file" name="g_image"><br/>
            商品一级分类：
            <select name="t_id" id="type">
                <option>===选择一级分类===</option>
                <c:forEach items="${typeList}" var="type">
                    <option value="${type.t_id}">${type.t_name}</option>
                </c:forEach>
            </select><br/>
            商品二级分类：
            <select name="sub_id" id="subtype">
                <option>===选择二级分类===</option>
            </select><br/>
            商品库存：<input style="width: 150px; height: 20px;" type="text" name="g_count" value="${goods.g_count}"/><br/>
            <input type="submit" value="上架商品"/>
        </form>
    </body>
</html>
