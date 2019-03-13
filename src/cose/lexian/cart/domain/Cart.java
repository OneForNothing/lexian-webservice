package cose.lexian.cart.domain;

import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;

public class Cart {
    private LinkedHashMap<String, CartItem> c_map; //商品条目映射表

    /** 计算合计, 解决了二进制运算的误差问题 */
    public double getTotal() {
        /** 合计 = 所有条目的小计之和 */
        BigDecimal total = new BigDecimal(0);
        for(CartItem cartItem : c_map.values()) {
            BigDecimal subtotal = new BigDecimal("" + cartItem.getSubtotal());
            total = total.add(subtotal);
        }
        return total.doubleValue();
    }

    /** 添加条目到车中 */
    public void add(CartItem cartItem) {
        if(c_map.containsKey(cartItem.getCi_goods().getG_id())) {
            CartItem _cartItem = c_map.get(cartItem.getCi_goods().getG_id());
            _cartItem.setCi_count(_cartItem.getCi_count() + cartItem.getCi_count());
            c_map.put(cartItem.getCi_goods().getG_id(), _cartItem);
        } else {
            c_map.put(cartItem.getCi_goods().getG_id(), cartItem);
        }
    }

    /** 清空所有条目 */
    public void clear() {
        c_map.clear();
    }

    /** 删除指定条目 */
    public void delete(String g_id) {
        c_map.remove(g_id);
    }

    /** 获取所有条目 */
    public Collection<CartItem> getCartItems() {
        return c_map.values();
    }

    @Override
    public String toString() {
        return "Cart{" +
                "c_map=" + c_map +
                '}';
    }
}
