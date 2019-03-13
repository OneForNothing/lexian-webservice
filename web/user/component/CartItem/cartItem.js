// 购物车中的每个店铺的内容，有下单功能
class CartItem {
  // 构造函数，参数，父容器，数据
  constructor(option) {
    this.faEle = option.faEle;// 父容器
    this.data = option.data;  // 商家信息，商品信息

    this.goods = this.data.goods; // 抽取商品信息
    this.totalMoney = 0;

    this.create();
    this.init();
  }
  create() {
    // 创建文档碎片
    let flagment = document.createDocumentFragment();
    // 三段构建
    let goodsNum = this.goods.length;
    let template1 = `<li class="bill-item">
        <p class="seller">${this.data.s_name}</p>
        `
    // 构建一个个商品
    for (let i = 0; i < goodsNum; i++) {
      const gooditem = this.goods[i];
      let template2 = `<div class="good-area clearfix">
          <img src="${gooditem.g_image}">
          <div class="good-msg">
            <p class="good-name">${gooditem.g_name}</p>
            <p class="good-price">￥${gooditem.g_price}</p>
            <div class="count border flex">
              <button class="cut-btn" type="button">-</button>
              <span class="num">${gooditem.g_num}</span>
              <button class="add-btn" type="button">+</button>
            </div>
          </div>
          </div>`;
      template1 += template2;
    }
    let template3 = `
        
        <div class="pay-control clearfix">
          <button class="pay">下单</button>
          <p class="money">￥0</p>
        </div>
      </li>`
    // 拼接完整的item
    template1 += template3;
    // 回填到页面中
    flagment.appendChild($(template1)[0]);
    console.log(this.faEle)
    this.faEle.appendChild(flagment);
  }
  init() {
    let goodsNum = this.goods.length,
      addBtn = document.getElementsByClassName('add-btn'),
      cutBtn = document.getElementsByClassName('cut-btn'),
      num = document.getElementsByClassName('num'),
      money = document.getElementsByClassName('money')[0];

    this.getMoney();
    money.innerHTML = `￥${this.totalMoney}`
    // 每一个商品增加减少算价钱
    for (let i = 0; i < goodsNum; i++) {
      const gooditem = this.goods[i];
      cutBtn[i].addEventListener('click', (event) => {
          event.preventDefault();
          // 只有大于 0 才可以
          if (gooditem.g_num > 0) {
              num[i].innerHTML = --gooditem.g_num;
              this.totalMoney -= gooditem.g_price;
              money.innerHTML = `￥${this.getMoney()}`;
          }
      });
      addBtn[i].addEventListener('click', (event) => {
        event.preventDefault();
        num[i].innerHTML = ++gooditem.g_num;
        this.totalMoney += gooditem.g_price;
        money.innerHTML = `￥${this.getMoney()}`;
      });

    }
    $('.pay').click(()=>{
      this.placeOrder();
    })
  }
  // 计算总价
  getMoney() {
    this.totalMoney = 0;
    for (let i = 0; i < this.goods.length; i++) {
      const gooditem = this.goods[i];
      this.totalMoney += gooditem.g_num * gooditem.g_price;
    }
    this.totalMoney = parseFloat(this.totalMoney.toFixed(2))
    return this.totalMoney;
  }
  // 下订单 
  placeOrder(){
    let goodSend = [];
    for (let i = 0; i < this.goods.length; i++) {
      const gooditem = this.goods[i];
      if (gooditem.g_num != 0){
        goodSend.push({
            g_id:gooditem.g_id,
            g_num:gooditem.g_num,
        })
      }
    }
    goodSend = JSON.stringify(goodSend)
      if (goodSend != "[]"){
          $.ajax({
              type:"POST",
              url:"/lexian-mall/AddOrderServlet",
              data:{
                  u_id:localStorage.getItem('lexian-user-u_id'),
                  s_id:this.data.s_id,
                  goods:goodSend
              }
          }).then((data)=>{
              // 直接清除本地购物车中的这一项
              let localCart = JSON.parse(localStorage.getItem('lexian-user-cart'));
              for (let i = 0; i < localCart.length; i++) {
                  const ele = localCart[i];
                  // 通过s_id判断要删除哪一项
                  console.log(ele.s_id  == this.data.s_id)
                  if (ele.s_id == this.data.s_id) {
                      console.log(i)
                      localCart.splice(i,1);
                      break;
                  }
              }
              localStorage.setItem('lexian-user-cart',JSON.stringify(localCart));
              // 刷新页面
              window.location.reload();
          })
      } else{
        alert('您还没买东西呢，不能下订单！')
      }


  }
}

export {
  CartItem
}