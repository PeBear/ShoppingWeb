<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shopping cart</title>
    </head>
    <body>
        <h1>Your cart!</h1>
        <c:set var="cart" value="${sessionScope.Cart}" />
        <c:if test="${not empty cart}">
            <table border="1">
                <tr>
                    <th>STT</th>
                    <th>Masp</th>
                    <th>Tensp</th>
                    <th>Soluong</th>
                    <th>Dongia</th>
                    <th>Xoa</th>
                </tr>
                <form action="CartController" method="post">
                    <c:set var="count" value="0"/>
                    <c:forEach var="rows" items="${cart}">
                        <c:set var="count" value="${count + 1}" />
                        <tr>
                            <td>${count}</td>
                            <td>${rows.value.sanpham.masp}</td>
                            <td>${rows.value.sanpham.tensp}</td>
                            <td>${rows.value.soluong}</td>
                            <td>${rows.value.sanpham.gia}</td>
                            <td><input type="checkbox" name="chkRemove" value="${rows.value.sanpham.masp}"> </td>
                        </tr>
                    </c:forEach>
                        <tr>
                            <td> <button type="submit" name="action" value="btnRemove">Xoa</button> </td>
                        </tr>
                </form>
            </table>
        </c:if>
    </body>
</html>
