// 商品列表卡片，用于搜索商家，收藏的商家
class ShopCard{
  constructor(option){
    this.faEle = option.faEle;
    this.data = option.data;

    this.create();
  }
  create(){
    // 获得商店地址
    // this.addr = '';
    // $.ajax({
    //   url:'https://restapi.amap.com/v3/geocode/regeo',
    //   data:{
    //     key:'648c34239775a77fe9637615026d9f9b',
    //     location:this.data.s_addr
    //   }
    // })
    // .then((data)=>{
    //   this.addr = data.regeocode.formatted_address
    // })

    // 构造模板
    let template = `<li class="shop-area">
        <img src="${this.data.s_image}" alt="">
        <div class="shop-msg">
          <p class="shop-name">${this.data.s_storeName}</p>
          <p class="shop-addr">${this.addr}</p>
        </div>
      </li>`;

    let item = $(template)[0];
    item.onclick = ()=>{
      localStorage.setItem('lexian-user-current-shop',JSON.stringify(this.data));
      window.location.href = './shop.jsp'
    }
    this.faEle.appendChild(item);
  }
}

export {ShopCard}