package cose.lexian.cart.domain;

import cose.lexian.goods.domain.Goods;

import java.math.BigDecimal;

public class CartItem {
    private Goods ci_goods; //商品
    private int ci_count; //商品数量

    /**
     * 小计方法
     * 处理了二进制计算的误差问题
     */
    public double getSubtotal() {
        BigDecimal d1;
        if(ci_goods.getG_discount() != null) {
            d1 = new BigDecimal(ci_goods.getG_discount() + "");
        } else {
            d1 = new BigDecimal(ci_goods.getG_price() + "");
        }
        BigDecimal d2 = new BigDecimal(ci_count + "");
        return d1.multiply(d2).doubleValue();
    }

    @Override
    public String toString() {
        return "CartItem{" +
                "ci_goods=" + ci_goods +
                ", ci_count=" + ci_count +
                '}';
    }

    public Goods getCi_goods() {
        return ci_goods;
    }

    public void setCi_goods(Goods ci_goods) {
        this.ci_goods = ci_goods;
    }

    public int getCi_count() {
        return ci_count;
    }

    public void setCi_count(int ci_count) {
        this.ci_count = ci_count;
    }
}
