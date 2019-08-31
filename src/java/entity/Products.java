package entity;

public class Products  implements java.io.Serializable {


     private String masp;
     private String tensp;
     private Integer gia;

    public Products() {
    }

	
    public Products(String masp) {
        this.masp = masp;
    }
    public Products(String masp, String tensp, Integer gia) {
       this.masp = masp;
       this.tensp = tensp;
       this.gia = gia;
    }
   
    public String getMasp() {
        return this.masp;
    }
    
    public void setMasp(String masp) {
        this.masp = masp;
    }
    public String getTensp() {
        return this.tensp;
    }
    
    public void setTensp(String tensp) {
        this.tensp = tensp;
    }
    public Integer getGia() {
        return this.gia;
    }
    
    public void setGia(Integer gia) {
        this.gia = gia;
    }




}


