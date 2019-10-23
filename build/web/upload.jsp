<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload Page</title>
    </head>
    <body style="text-align: center">
        <h1>Hello World!</h1>
        <form action="UploadFileServlet" method="post" enctype="multipart/form-data">
            <input type="file" name="fImage">
            <button type="submit">Thêm ảnh</button>
        </form>
    </body>
</html>
