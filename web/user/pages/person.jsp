<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>lexian-mall-person</title>
  <link rel="stylesheet" href="<c:url value="/user/common/css/base.css"/>">
  <link rel="stylesheet" href="<c:url value="/user/common/css/init.css"/>">
  <link rel="stylesheet" href="<c:url value="/user/works/css/person.css"/>">
</head>

<body>
  <!-- 本页面内完成登录,注册,查看个人信息,修改个人信息功能 -->
  <!-- 进入页面后根据localStorage判断自己的登录状态,然后按需渲染 -->
  <div class="container">
    <!-- 登录表单 -->
    <div class=" login none">
      <div class="flex logo">
        <img src="<c:url value="/user/res/static/logo.png"/>" alt="logo">
      </div>

      <form  method="POST" class="login-form">
        <input type="text" name="u_name" id="u_name" placeholder="独一无二的用户名">
        <input type="password" name="u_pwd" id="u_pwd" placeholder="想不起来的密码">
        <button class="login-btn" type="button">登录LeX</button>
      </form>
      <p class="tip alert"></p>
      <p class="tip">还没有账号?快速注册~</p>
    </div>
    <!-- 注册表单 -->
    <div class="signin none">
      <div class="flex logo">
        <img src="<c:url value="/user/res/static/logo.png"/>" alt="logo">
      </div>
      <form action="" method="post" class="sign-form">
        <input type="text" name="u_name_sign" id="u_name_sign" placeholder="独一无二的用户名">
        <input type="password" name="u_pwd_sign" id="u_pwd_sign" placeholder="6~15位安全的密码">
        <input type="password" name="u_pwd_confirm" id="u_pwd_confirm" placeholder="确认密码">
        <button type="submit">注册LeX</button>
      </form>
      <p class="tip alert"></p>
      <p class="cancel">放弃本次注册</p>
    </div>
    <!-- 个人信息内容 -->
    <div class="person-info none">
      <div class="p-header">
        <div class="flex logo">
          <img src="<c:url value="/user/res/static/logo.png"/>" alt="">
        </div>
        <p class="p-username">
          欢迎你<span>lexian开发者</span>o(￣ε￣*)
        </p>
      </div>
      <div class="p-func">
        <a href="like.jsp">
          <img src="<c:url value="/user/res/icon_user/like.svg"/>">
          <span>收藏</span>
        </a>
        <a href="bill.jsp">
          <img src="<c:url value="/user/res/icon_user/bill.svg"/>">
          <span>订单</span>
        </a>
        <a href="cart.jsp">
          <img src="<c:url value="/user/res/icon_user/cart.svg"/>">
          <span>购物车</span>
        </a>
      </div>
      <div class="p-control">
        <button>狠心下线o(TヘTo)</button>
      </div>
    </div>

  </div>
  <script src="<c:url value="/user/common/js/myzepto.js"/>"></script>
  <script type="module" src="<c:url value="/user/works/js/person.js"/>"></script>


</body>

</html>