<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="entity.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="big-box">
    <%
        List<Products> list = ProductDAO.getListProducts("");
        for (Products x : list) {
            out.print("<div class=\"box\">"
                    + "<div class=\"sanpham\">"
                    + "<a href=\"#\" onclick=\"$('#myIframe').toggle()\">"
                    + "<img src=\"images/iphonexs.jpeg\">"
                    + "<p>"+x.getTensp()+"</p>"
                    + "<h3 class=\"price\">"+x.getGia()+" đ</h3>"
                    + "</a>"
                    + "</div>"
                    + "</div>");
        }
    %>
</div>

