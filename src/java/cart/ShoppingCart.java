package cart;

import java.util.HashMap;

public class ShoppingCart extends HashMap {

    public ShoppingCart() {
        super();
    }

    public void addProduct(ProductDTO sp) {
        String key = sp.getSanpham().getMasp();
        int temp = 0;
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

}
