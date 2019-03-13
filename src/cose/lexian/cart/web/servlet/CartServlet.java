package cose.lexian.cart.web.servlet;

import cn.itcast.servlet.BaseServlet;
import cose.lexian.cart.domain.Cart;
import cose.lexian.cart.domain.CartItem;
import cose.lexian.goods.domain.Goods;
import cose.lexian.goods.service.GoodsService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "CartServlet", urlPatterns = "/CartServlet")
public class CartServlet extends BaseServlet {
    /** 添加购物条目 */
    public String add(HttpServletRequest request, HttpServletResponse response) {
        /** 1.得到购物车。购物车在用户登录成功后就在session中添加一辆车 */
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        /**
         * 2.得到条目：表单传递的只有g_id和数量
         *  > 得到商品和数量
         *  > 先得到商品的g_id，然后通过g_id查询数据库得到Goods
         *  > 数量从表单中直接得
         */
        String g_id = request.getParameter("g_id");
        Goods goods = new GoodsService().load("g_id");
        int count = Integer.parseInt(request.getParameter("count"));
        CartItem cartItem = new CartItem();
        cartItem.setCi_goods(goods);
        cartItem.setCi_count(count);

        cart.add(cartItem);
        return "";
    }

    /** 清空购物条目 */
    public String clear(HttpServletRequest request, HttpServletResponse response) {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        cart.clear();

        return "";
    }

    /** 删除购物条目 */
    public String delete(HttpServletRequest request, HttpServletResponse response) {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        String g_id = request.getParameter("g_id");
        cart.delete(g_id);

        return "";
    }
}
