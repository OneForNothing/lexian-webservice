<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-cn">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
        <title>lexian-mall</title>

        <link rel="stylesheet" href="<c:url value="/user/common/css/base.css"/>">
        <link rel="stylesheet" href="<c:url value="/user/common/css/init.css"/>">
        <link rel="stylesheet" href="<c:url value="/user/component/Map/map.css"/>">
        <link rel="stylesheet" href="<c:url value="/user/component/Banner/banner.css"/>">
        <link rel="stylesheet" href="<c:url value="/user/component/TypeList/typeList.css"/>">
        <link rel="stylesheet" href="<c:url value="/user/works/css/u_footer.css"/>">
        <link rel="stylesheet" href="<c:url value="/user/works/css/index.css"/>">
    </head>

    <body>

        <div class="container">
            <!-- 头部，包括logo，搜索，头像（个人中心入口） -->
            <header class="flex g-header">
                <div class="h-logo"></div>
                <form class="flex h-search" action="" method="POST">
                    <input type="text" name="" placeholder="搜店铺搜宝贝">
                    <button type="submit"></button>
                </form>
                <div class="h-avatar">
                    <a href="#">
                        <img src="<c:url value="/user/res/static/avatar.png"/>" alt="">
                    </a>
                </div>
            </header>
            <!-- 主体 -->
            <section class="m-body">
                <!-- banner容器，通过Banner.js生成 -->
                <article id="m-banner">
                    <!-- 图片 -->
                    <ul class="b-silder">
                        <li class="b-item z-active">
                            <a href="">
                                <img src="<c:url value="/user/res/static/fff&text=banner.png"/>" alt="">
                            </a>
                        </li>
                        <li class="b-item">
                            <a href="">
                                <img src="<c:url value="/user/res/static/fff&text=banner2.png"/>" alt="">
                            </a>
                        </li>
                        <li class="b-item">
                            <a href="">
                                <img src="<c:url value="/user/res/static/fff&text=banner3.png"/>" alt="">
                            </a>
                        </li>
                        <li class="b-item">
                            <a href="">
                                <img src="<c:url value="/user/res/static/fff&text=banner4.png"/>" alt="">
                            </a>
                        </li>
                    </ul>
                    <!-- 指示器，显示轮播索引，z-index的元素为蓝色 -->
                    <ul class="b-cursor">
                        <li class="z-active"></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </article>
                <!-- 分类列表，通过TypeList自动生成 -->
                <article class="m-func-area m-typeList">
                    <h2></h2>
                    <ul class="flex nav-type " id="nav-type">
                    </ul>
                </article>
                <!-- 自动定位,通过map.js自动生成 -->
                <article class="m-func-area m-map">
                </article>
                <!-- 自动定位,通过map.js自动生成 -->
                <article class="m-func-area m-recommend">
                    <h2></h2>
                    <ul class="good-list" id="goodRecom">

                    </ul>
                </article>
            </section>

            <div style="position: fixed;top: 0;bottom: 0;left: 0;right: 0;" class="none" id="tempmask">
                <div class="mask none"></div>
                <div class="good-details none"></div>
            </div>


            <!-- 底部菜单栏，可以用于主要页面的跳转 -->
            <footer class="flex nav-footer border ">
				<span>
					<img src="<c:url value="/user/res/icon_user/like.svg"/>">
					<h6>收藏</h6>
				</span>
                <span>
					<img src="<c:url value="/user/res/icon_user/msg.svg"/>">
					<h6>消息</h6>
				</span>
                <span>
					<img src="<c:url value="/user/res/icon_user/home.svg"/>">
					<h6>首页</h6>
				</span>
                <span>
					<img src="<c:url value="/user/res/icon_user/bill.svg"/>">
					<h6>订单</h6>
				</span>
                <span>
					<img src="<c:url value="/user/res/icon_user/cart.svg"/>">
					<h6>购物车</h6>
				</span>
            </footer>

            <script src="<c:url value="/user/common/js/myzepto.js"/>"></script>
            <script type="module" src="<c:url value="/user/works/js/index.js"/>"></script>

    </body>

</html>