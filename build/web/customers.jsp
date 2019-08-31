<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customers Page</title>
    </head>
    <body>
        <h1>Danh sach cac thanh vien</h1>
        <c:set var="list" value="${sessionScope.ListCustomer}" />
        <c:if test="${not empty list}">
            <table border="1">
                <tr>
                    <th>STT</th>
                    <th>Hoten</th>
                    <th>SDT</th>
                    <th>Diachi</th>
                    <th>Email</th>
                </tr>
                <c:set var="count" value="0"/>
                <c:forEach var="rows" items="${list}">
                    <c:set var="count" value="${count+1}"/>
                    <tr>
                        <td>${count}</td>
                        <td>${rows.hoten}</td>
                        <td>${rows.sdt}</td>
                        <td>${rows.diachi}</td>
                        <td>${rows.email}</td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
    </body>
</html>
