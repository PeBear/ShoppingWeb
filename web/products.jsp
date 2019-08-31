<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Page</title>
    </head>
    <body>
        <h1>Hello ${sessionScope.User}</h1>
        <sql:setDataSource driver="com.mysql.jdbc.Driver" 
                           url="jdbc:mysql://localhost/JAVA4"
                           user="root"
                           password="forgetforgot"
                           var="con"/>
        <sql:query dataSource="${con}" var="rs">
            select * from PRODUCTS
        </sql:query>

            <table border="1">
                <tr>
                    <th>STT</th>
                    <th>Masp</th>
                    <th>Tensp</th>
                    <th>Gia</th>
                </tr>
                <c:set var="count" value="0"/>
                <c:forEach var="line" items="${rs.rows}">
                    <c:set var="count" value="${count+1}"/>
                    <tr>
                        <td>${count}</td>
                        <td>${line.MASP}</td>
                        <td>${line.TENSP}</td>
                        <td>${line.GIA}</td>
                    </tr>
                </c:forEach>
            </table>
    </body>
</html>
