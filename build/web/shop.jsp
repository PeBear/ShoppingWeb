<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="DAO.ProductDAO"%>
<%@page import="java.util.List"%>
<%@page import="entity.Products"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="big-box">
    <%
        List<Products> list = ProductDAO.getListProducts("");
        for (Products x : list) {
            out.print("<form id=\"hello\" action=\"ShowProductController\" method=\"post\" style=\"width: 100%;\">"
                    + "<div class=\"box\" onclick=\"javascript:this.parentNode.submit()\">"
                    + "<div class=\"sanpham\">"
                    + "<img src=\"images/iphonexs.jpeg\">"
                    + "<p>" + x.getTensp() + "</p>"
                    + "<h3 class=\"price\">" + x.getGia() + " đ</h3>"
                    + "</div>"
                    + "<input type=\"hidden\" name=\"txtCode\" value='" + x.getMasp() + "'>"
                    + "</div>"
                    + "</form>");
        }
    %>
</div>

