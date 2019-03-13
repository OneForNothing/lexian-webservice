package cose.lexian.user.web.servlet;

import cose.lexian.goods.service.GoodsService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RemoveLikeGoodsServlet", urlPatterns = "/RemoveLikeGoodsServlet")
public class RemoveLikeSellerServlet extends HttpServlet {
    GoodsService goodsService = new GoodsService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        String u_id = request.getParameter("u_id");
        String s_id = request.getParameter("s_id");
        goodsService.removeLikeSeller(u_id.split("\"")[1], s_id);

    }
}
