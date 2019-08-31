package cart;

import entity.Products;

public class ProductDTO {
    private Products sanpham;
    private int soluong;
    
    public ProductDTO(){
        
    }
    
    public ProductDTO(Products sanpham){
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
    
    
}
