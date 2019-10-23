package entity;

public class Products implements java.io.Serializable {

    private String masp;
    private String tensp;
    private Double gia;
    private String giaXuLy = "";
    private String hinh;

    public Products() {
    }

    public Products(String masp) {
        this.masp = masp;
    }

    public Products(String masp, String tensp, Double gia, String hinh) {
        this.masp = masp;
        this.tensp = tensp;
        this.gia = gia;
        this.giaXuLy = String.format("%,.2f", gia);
        this.hinh = hinh;
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

    public Double getGia() {
        return this.gia;
    }

    public void setGia(Double gia) {
        this.gia = gia;
    }

    public String getGiaDaXuLy() {
        return giaXuLy;
    }

    public String getGiaXuLy() {
        return giaXuLy;
    }

    public void setGiaXuLy(String giaXuLy) {
        this.giaXuLy = giaXuLy;
    }

    public String getHinh() {
        return hinh;
    }

    public void setHinh(String hinh) {
        this.hinh = hinh;
    }

}
