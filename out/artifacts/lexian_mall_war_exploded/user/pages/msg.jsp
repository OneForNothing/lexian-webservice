<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title> lexian-mall </title>
  <link rel="stylesheet" href="../common/css/base.css">
  <link rel="stylesheet" href="../common/css/init.css">
  <link rel="stylesheet" href="../works/css/u_footer.css">
  <link rel="stylesheet" href="../works/css/msg.css">
</head>

<body>
  <div class="container">
    <header>
      <h1>系统消息</h1>
    </header>
    <div class="m-body">
      <!-- 未读消息 -->
      <div class="m-func-area">
        <p class="tip">您有未读消息</p>
        <ul class="all-msg  new-msg">
          <li class="msg-item">
            <h4 class="msg-source">lexian开发者</h4>
            <div class="msg-detail">
              <p>
                lexian-mall电子商务平台正式上线，感谢您的使用，如果您有宝贵的意见或者建议，欢迎在个人信息板块，反馈功能给提出反馈。
              </p>
              <p>(/ω＼*)……… (/ω•＼*)</p>
            </div>
            <a href="#"> 已读 ></a>
          </li>
        </ul>
      </div>
      <!-- 历史订单 -->
      <div class="m-func-area">
        <p class="tip">最近10条历史消息</p>
        <ul class="all-msg old-msg">
          <li class="msg-item">
            <h4 class="msg-source">lexian运营组</h4>
            <div class="msg-detail">
              <p>
                夏天请注意避暑，南京西瓜降价，建议购买！
              </p>
              <p>ο(=•ω＜=)ρ⌒☆</p>
            </div>
          </li>
        </ul>
      </div>
    </div>


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
  <script type="module" src="../works/js/msg.js"></script>
</body>

</html>