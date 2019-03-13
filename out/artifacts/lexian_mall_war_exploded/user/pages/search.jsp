<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title> lexian-mall search </title>
  <link rel="stylesheet" href="../common/css/base.css">
  <link rel="stylesheet" href="../common/css/init.css">
  <link rel="stylesheet" href="../works/css/u_footer.css">
  <link rel="stylesheet" href="../works/css/like.css">
</head>

<body>
  <div class="container">
    <header>
      <div class="control">
        <button class="z-active">商品</button>
        <button>店铺</button>
      </div>
    </header>

    <!-- 视口容器，内部内容左右滑动 -->
    <div class="frame-view">
      <!-- 搜索的商品 -->
      <iframe class="iframe-like1" src="goodsSearch.jsp" frameborder="0"></iframe>
      <iframe class="iframe-like2" src="shopSearch.jsp" frameborder="0"></iframe>
    </div>
  </div>

  
  <script src="../common/js/myzepto.js"></script>
  <!-- 由于内容和like一样，所以就不复制粘贴了 -->
  <script type="module" src="../works/js/like.js"></script>
</body>

</html>