import {
  setRemFontSize
} from './init.js';

$(function () {
  // 设置rem
  setRemFontSize();
  // 基本功能跳转
  let jmp = $("footer>span");
  $(jmp[0]).click(() => {
    if (localStorage.getItem('lexian-user-u_id')) {
      window.location.href = "/lexian-mall/user/pages/like.jsp";
    } else {
      window.location.href = "/lexian-mall/user/pages/person.jsp";
    }
  });
  $(jmp[1]).click(() => {
    if (localStorage.getItem('lexian-user-u_id')) {
      window.location.href = "/lexian-mall/user/pages/msg.jsp";
    } else {
      window.location.href = "/lexian-mall/user/pages/person.jsp";
    }
  });
  $(jmp[2]).click(() => {
    window.location.href = "/lexian-mall/user/index.jsp";
  });
  $(jmp[3]).click(() => {
    if (localStorage.getItem('lexian-user-u_id')) {
      window.location.href = `/lexian-mall/user/OrderServlet?method=findAll&u_id=${localStorage.getItem('lexian-user-u_id')}`;
    } else {
      window.location.href = "/lexian-mall/user/pages/person.jsp";
    }
  });

  $(jmp[4]).click(() => {
    if (localStorage.getItem('lexian-user-u_id')) {
      window.location.href = "/lexian-mall/user/pages/cart.jsp";
    } else {
      window.location.href = "/lexian-mall/user/pages/person.jsp";
    }
  });
})