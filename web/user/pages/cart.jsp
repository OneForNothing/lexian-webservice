<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title> lexian-mall cart </title>
  <link rel="stylesheet" href="../common/css/base.css">
  <link rel="stylesheet" href="../common/css/init.css">
  <link rel="stylesheet" href="../works/css/u_footer.css">
  <link rel="stylesheet" href="../works/css/cart.css">
</head>

<body>
  <div class="container">
    <header>
      <header>
        <h1>购物车</h1>
      </header>
    </header>
    <ul class="good-list">

    </ul>

    

    <!-- 底部菜单栏，可以用于主要页面的跳转 -->
    <footer class="flex nav-footer border ">
      <span>
        <img src="../res/icon_user/like.svg">
        <h6>收藏</h6>
      </span>
      <span>
        <img src="../res/icon_user/msg.svg">
        <h6>消息</h6>
      </span>
      <span>
        <img src="../res/icon_user/home.svg">
        <h6>首页</h6>
      </span>
      <span>
        <img src="../res/icon_user/msg.svg">
        <h6>订单</h6>
      </span>
      <span>
        <img src="../res/icon_user/cart.svg">
        <h6>购物车</h6>
      </span>
    </footer>
  </div>

  <script src="../common/js/myzepto.js"></script>
  <script type="module" src="../works/js/cart.js"></script>
</body>

</html>