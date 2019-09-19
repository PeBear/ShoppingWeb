<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
    </head>
    <body>
        <h1>Hello ${sessionScope.User}</h1>
        <a href="customers.jsp">Xem danh sach thanh vien</a>
        <a href="product.jsp">Xem danh sach san pham</a>
    </body>
</html>
