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
        <c:set var="cus" value="${sessionScope.getInFoCustomer}" />
        <div id="updateForm" class="containerUpdate">
            <div class="signup-content">
                <form method="POST" id="signup-form" class="signup-form" action="CustomerController">
                    <h2 class="form-title">CẬP NHẬT KHÁCH HÀNG</h2>
                    <input type="hidden" value="${cus.code}" name="txtCode" />
                    <div class="form-group">
                        Username: <input value="${cus.username}" type="text" class="form-input" name="txtUsername" id="name" placeholder="Username"/>
                    </div>
                    <div class="form-group">
                        Họ tên: <input value="${cus.hoten}" type="text" class="form-input" name="txtFullname" id="name" placeholder="Nhập họ tên"/>
                    </div>
                    <div class="form-group">
                        Email: <input value="${cus.email}" type="email" class="form-input" name="txtEmail" id="email" placeholder="Nhập Email"/>
                    </div>
                    <div class="form-group">
                        SĐT: <input value="${cus.sdt}" type="text" class="form-input" name="txtPhoneNum" id="email" placeholder="Nhập số điện thoại"/>
                    </div>
                    <div class="form-group">
                        Mật khẩu: <input value="${cus.password}" type="password" class="form-input" name="txtPassword" id="password" placeholder="Nhập mật khẩu"/>
                        <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                    </div>
                    <div class="form-group">
                        Re-Mật Khẩu: <input value="${cus.password}" type="password" class="form-input" name="txtRepassword" id="re_password" placeholder="Nhập lại mật khẩu"/>
                    </div>
                    <div class="form-group">
                        Vai trò: 
                        <c:choose>
                            <c:when test="${cus.role eq 'Trưởng Phòng'}">
                                <label>
                                    <input type="radio" name="rdoVaitro" id="agree-term" class="agree-term" value="Trưởng Phòng" checked/> Trưởng Phòng
                                </label>
                                <label>
                                    <input type="radio" name="rdoVaitro" id="agree-term" class="agree-term" value="Nhân Viên" /> Nhân Viên
                                </label>
                            </c:when>
                            <c:when test="${cus.role eq 'Nhân Viên'}">
                                <label><input type="radio" name="rdoVaitro" id="agree-term" class="agree-term" value="Trưởng Phòng" /> Trưởng Phòng</label>
                                <label><input type="radio" name="rdoVaitro" id="agree-term" class="agree-term" value="Nhân Viên" checked/> Nhân Viên</label>
                            </c:when>
                        </c:choose>
                    </div>
                    <div class="form-group">
                        <button type="submit" name="action" id="submit" class="form-submit" value="btnUpdate">Cập Nhật</button>
                    </div>
                </form>
            </div>
        </div>
    </body>
</html>
