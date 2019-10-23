<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/updateForm.css">
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <title>JSP Page</title>
    </head>
    <body>
        <c:set var="pd" value="${sessionScope.getInfoProduct}" />
        <div id="updateForm" class="containerUpdate">
            <div class="signup-content">
                <form method="POST" id="signup-form" class="signup-form" action="ProductController" enctype="multipart/form-data">
                    <h2 class="form-title">CẬP NHẬT SẢN PHẨM</h2>
                    <div class="form-group">
                        Mã sản phẩm: <input value="${pd.masp}" type="text" class="form-input" name="txtCode" id="name" placeholder="Nhập mã sản phẩn"/>
                    </div>
                    <div class="form-group">
                        Tên sản phẩm: <input value="${pd.tensp}" type="text" class="form-input" name="txtName" id="name" placeholder="Nhập tên sản phẩn"/>
                    </div>
                    <div class="form-group">
                        Giá: <input value="${pd.gia}" type="text" class="form-input" name="txtPrice" id="name" placeholder="Nhập giá"/>
                    </div>
                    <div class="form-group">
                        <button type="submit" name="action" id="submit" class="form-submit" value="btnUpdate">Cập Nhật</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
