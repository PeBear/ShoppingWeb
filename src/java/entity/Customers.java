package entity;

import java.io.Serializable;

public class Customers implements Serializable {

    private int code;
    private String hoten;
    private String sdt;
    private String diachi;
    private String email;
    private String username;
    private String password;
    private String role;

    public Customers() {

    }

    public Customers( String hoten, String sdt, String email, String diachi, String username, String password, String role) {
        this.hoten = hoten;
        this.sdt = sdt;
        this.email = email;
        this.diachi = diachi;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public Customers(int code, String hoten, String sdt, String email, String diachi, String username, String password, String role) {
        this.code = code;
        this.hoten = hoten;
        this.sdt = sdt;
        this.email = email;
        this.diachi = diachi;
        this.username = username;
        this.password = password;
        this.role = role;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getHoten() {
        return hoten;
    }

    public void setHoten(String hoten) {
        this.hoten = hoten;
    }

    public String getSdt() {
        return sdt;
    }

    public void setSdt(String sdt) {
        this.sdt = sdt;
    }

    public String getDiachi() {
        return diachi;
    }

    public void setDiachi(String diachi) {
        this.diachi = diachi;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
