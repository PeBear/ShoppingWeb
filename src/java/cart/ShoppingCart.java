package cart;

import java.util.HashMap;

public class ShoppingCart extends HashMap {

    public ShoppingCart() {
        super();
    }

    public void addProduct(ProductDTO sp) {
        String key = sp.getSanpham().getMasp();
        if (this.containsKey(key)) {
            int soLuongCu = ((ProductDTO) this.get(key)).getSoluong();
            ((ProductDTO) this.get(key)).setSoluong(soLuongCu + 1);
        } else {
            this.put(key, sp);
        }

    }

    public boolean removeProduct(String masp) {
        if (this.containsKey(masp)) {
            this.remove(masp);
            return true;
        }
        return false;
    }

    public double getTongGia() {
        double tonggia = 0;
        for (Object x : this.values()) {
            tonggia += ((ProductDTO) x).getSanpham().getGia() * ((ProductDTO) x).getSoluong();
        }
        return tonggia;
    }
}
