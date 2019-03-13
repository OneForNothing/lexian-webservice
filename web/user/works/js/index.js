// import '../../common/css/base.css';
// import '../../common/css/init.css';
// import '../css/index.css';
// import '../css/u_footer.css';


import {
	Banner
} from '../../component/Banner/banner.js';
import {
	TypeList
} from '../../component/TypeList/typeList.js';
import {
	Map
} from '../../component/Map/map.js';
import {GoodCard} from '../../component/GoodCard/goodCard.js'
import {
	setRemFontSize
} from './init.js';

$(function () {
	setRemFontSize();
	// 初始化种类列表
	let typeListEle = document.getElementById("nav-type");
	let typeList = new TypeList({
        ele: typeListEle,
        url:'/lexian-mall/LoadTypeServlet',
		link:'./pages/goodsList.jsp'

    });
	// 基本功能跳转
	let jmp = $("footer>span");
	$(jmp[0]).click(() => {
		if (localStorage.getItem('lexian-user-u_id')) {
			window.location.href = "./pages/like.jsp";
		} else {
			window.location.href = "./pages/person.jsp";
		}
	});
	$(jmp[1]).click(() => {
		if (localStorage.getItem('lexian-user-u_id')) {
			window.location.href = "./pages/msg.jsp";
		} else {
			window.location.href = "./pages/person.jsp";
		}
	});
	$(jmp[2]).click(() => {
		window.location.href = "index.jsp";
	});
	$(jmp[3]).click(() => {
		if (localStorage.getItem('lexian-user-u_id')) {
			window.location.href = `/lexian-mall/user/OrderServlet?method=findAll&u_id=${localStorage.getItem('lexian-user-u_id')}`;
		} else {
			window.location.href = "./pages/person.jsp";
		}
	});

	$(jmp[4]).click(() => {
		if (localStorage.getItem('lexian-user-u_id')) {
			window.location.href = "./pages/cart.jsp";
		} else {
			window.location.href = "./pages/person.jsp";
		}
	});


	// 初始化定位组件
	let mapEle = document.getElementsByClassName("m-map")[0];
	let map = new Map(mapEle);
	// 自动定位
	map.autoPosition();

	// 注册个人信息跳转
	$('.h-avatar').click((event) => {
		event.preventDefault();
		window.location.href = './pages/person.jsp'
	})

    // 搜索功能
    $('.h-search>button').click((event)=>{
    	event.preventDefault();
    	if($('.h-search>input').val()){
            localStorage.setItem('lexian-user-keyword',$('.h-search>input').val());
            window.location.href = "./pages/search.jsp"
		}

    })

	// 推荐功能
	let faEle = document.getElementById('goodRecom');
    //    请求推荐商品
	if (localStorage.getItem('lexian-user-u_id')) {
        $.ajax({
            url:"/lexian-mall/GuessLikeServlet",
            data: {
                u_id: localStorage.getItem('lexian-user-u_id')
            }
        })
		.then((data)=>{
			faEle.innerHTML = '';
			let goods = JSON.parse(data).goodsList;
			console.log(goods)
			for (let i = 0,length = goods.length;i<length;i++){
				let card = new GoodCard({
					faEle:faEle,
					data:goods[i]
				})
			}
		})
	}
})