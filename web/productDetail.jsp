<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.html" %>

<sql:setDataSource driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost/JAVA4"
                   user="root"
                   password="forgetforgot"
                   var="con1"/>
<sql:query dataSource="${con1}" var="rs">
    select * from PRODUCTS  where MASP like ?
    <sql:param value="%${sessionScope.ProductCode}%"/>
</sql:query>
<div class="container-product">
    <c:forEach var="line" items="${rs.rows}">
        <div class="container-img"> <img src="images/iphonexs.jpeg"> </div>
        <div class="product-detail">
            <p><i>Ten san pham:</i> <span class="product-name">${line.TENSP}</span></p>
            <p><i>Ma san pham:</i> <span class="product-code">${line.MASP}</span></p>
            <p><i>Gia niem yet:</i> <span class="product-price">${line.GIA}d</span></p>
            <p><i>Mota:</i></p>
            <button class="button-MUAHANG">MUA NGAY</button>
            <button class="button-GIOHANG"><img src="images/cart.png"/> THEM VAO GIO HANG</button>
        </div>
    </c:forEach>
</div>

<%@include file="footer.html" %>