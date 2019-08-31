
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <form action="LoginController" method="post">
            <label>Username: <input type="text" name="txtUsername"></label>
            <label>Password: <input type="password" name="txtPassword"></label>
            <button type="submit" name="btnLogin">Login</button>
        </form>
    </body>
</html>
