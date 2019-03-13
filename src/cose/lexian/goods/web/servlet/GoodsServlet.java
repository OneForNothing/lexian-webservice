package cose.lexian.goods.web.servlet;

import cn.itcast.servlet.BaseServlet;
import cose.lexian.goods.domain.Goods;
import cose.lexian.goods.service.GoodsService;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@WebServlet(name = "GoodsServlet", urlPatterns = "/GoodsServlet")
public class GoodsServlet extends BaseServlet {
    private GoodsService goodsService = new GoodsService();

    /** 按二级分类查询商品 */
    public String findBySubType(HttpServletRequest request, HttpServletResponse response) {
        String sub_id = request.getParameter("sub_id");
        List<Goods> goodsList = goodsService.findGoodsBySubType(sub_id); //包含商品信息和店铺信息
        request.setAttribute("goodsList", goodsList);
        return "";
    }

    /** 加载商品详情 */
    public String load(HttpServletRequest request, HttpServletResponse response) {
        request.setAttribute("goods", goodsService.load(request.getParameter("g_id"))); //包含商品信息和店铺信息
        return "";
    }
}
