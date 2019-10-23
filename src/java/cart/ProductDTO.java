package cart;

import entity.Products;
import java.io.Serializable;

public class ProductDTO implements Serializable{

    private Products sanpham;
    private int soluong;
    private int tonggia;

    public ProductDTO() {

    }

    public ProductDTO(Products sanpham) {
        this.sanpham = sanpham;
        this.soluong = 1;
    }

    public Products getSanpham() {
        return sanpham;
    }

    public void setSanpham(Products sanpham) {
        this.sanpham = sanpham;
    }

    public int getSoluong() {
        return soluong;
    }

    public void setSoluong(int soluong) {
        this.soluong = soluong;
    }

    public int getTonggia() {
        return tonggia;
    }

    public void setTonggia(int tonggia) {
        this.tonggia = tonggia;
    }

}
