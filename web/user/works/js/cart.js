import {
  setRemFontSize
} from './init.js';
import {CartItem} from '../../component/CartItem/cartItem.js';


$(function () {
  // 设置rem
  setRemFontSize();
  // 基本功能跳转
  let jmp = $("footer>span");
  $(jmp[0]).click(() => {
    if (localStorage.getItem('lexian-user-u_id')) {
      window.location.href = "./like.jsp";
    } else {
      window.location.href = "./person.jsp";
    }
  });
  $(jmp[1]).click(() => {
    if (localStorage.getItem('lexian-user-u_id')) {
      window.location.href = "./msg.jsp";
    } else {
      window.location.href = "./person.jsp";
    }
  });
  $(jmp[2]).click(() => {
    window.location.href = "../index.jsp";
  });
  $(jmp[3]).click(() => {
    if (localStorage.getItem('lexian-user-u_id')) {
      window.location.href = `/lexian-mall/user/OrderServlet?method=findAll&u_id=${localStorage.getItem('lexian-user-u_id')}`;
    } else {
      window.location.href = "./person.jsp";
    }
  });
  $(jmp[4]).click(() => {
    if (localStorage.getItem('lexian-user-u_id')) {
      window.location.href = "./cart.jsp";
    } else {
      window.location.href = "./person.jsp";
    }
  });
  // 从本地取出购物车的数据
  let localCart = JSON.parse(localStorage.getItem('lexian-user-cart'));
  // 父容器
  let faEle = $(".good-list")[0];

  for (let i = 0;  i< localCart.length; i++) {
    const element = localCart[i];
    console.log(element)
    let cartitem = new CartItem({
      faEle,
      data:element,
    });
  }
})