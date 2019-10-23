<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${empty sessionScope.User}">
    <c:redirect url="login.jsp"/>
</c:if>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Table V01</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->	
        <link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/tableutil.css">
        <link rel="stylesheet" type="text/css" href="css/table.css">
        <!--===============================================================================================-->
        <!-- css updateForm -->
        <link rel="stylesheet" type="text/css" href="css/updateForm.css">
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <style>
            .vertical-menu {
                width: 15%; /* Set a width if you like */
                float: left;
            }

            .vertical-menu a {
                background-color: #eee; /* Grey background color */
                color: black; /* Black text color */
                display: block; /* Make the links appear below each other */
                padding: 12px; /* Add some padding */
                text-decoration: none; /* Remove underline from links */
            }

            .vertical-menu a:hover {
                background-color: #ccc; /* Dark grey background on mouse-over */
            }

            .vertical-menu a.active {
                background-color: #4CAF50; /* Add a green color to the "active/current" link */
                color: white;
            }
            #button-add{
                padding: 10px;
                margin: 10px;
                color: white;
                border: 1px solid;
            }
        </style>
    </head>
    <body>
        <div id="addForm" class="containerUpdate" style="display: none">
            <div class="signup-content">
                <form method="POST" id="signup-form" class="signup-form" action="CustomerController">
                    <h2 class="form-title">THÊM KHÁCH HÀNG</h2>
                    <div class="form-group">
                        Username: <input type="text" class="form-input" name="txtUsername" id="name" placeholder="Username"/>
                    </div>
                    <div class="form-group">
                        Họ tên: <input type="text" class="form-input" name="txtFullname" id="name" placeholder="Nhập họ tên"/>
                    </div>
                    <div class="form-group">
                        Email: <input type="email" class="form-input" name="txtEmail" id="email" placeholder="Nhập Email"/>
                    </div>
                    <div class="form-group">
                        SĐT: <input type="text" class="form-input" name="txtPhoneNum" id="email" placeholder="Nhập số điện thoại"/>
                    </div>
                    <div class="form-group">
                        Mật khẩu: <input type="text" class="form-input" name="txtPassword" id="password" placeholder="Nhập mật khẩu"/>
                        <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                    </div>
                    <div class="form-group">
                        Re-Mật Khẩu: <input type="password" class="form-input" name="txtRepassword" id="re_password" placeholder="Nhập lại mật khẩu"/>
                    </div>
                    <div class="form-group">
                        Vai trò: <label><input type="radio" name="rdoVaitro" id="agree-term" class="agree-term" value="Trưởng Phòng"/> Trưởng Phòng</label>
                        <label><input type="radio" name="rdoVaitro" id="agree-term" class="agree-term" value="Nhân Viên" checked/> Nhân Viên</label>
                    </div>
                    <div class="form-group">
                        <button type="submit" name="action" id="submit" class="form-submit" value="btnThem">Thêm</button>
                    </div>
                </form>
            </div>
        </div>

        <div class="limiter">
            <div class="vertical-menu">
                <a>${sessionScope.User}</a>
                <a href="index.jsp" class="active">Home</a>
                <a href="CustomerController">Quản lý khách hàng</a>
                <a href="ProductController">Quản lý sản phẩm</a>
            </div> 
            <div class="container-table100">
                <div class="wrap-table100">
                    <div class="table100">
                        <table>
                            <thead>
                                <tr class="table100-head">
                                    <th class="column1">STT</th>
                                    <th class="column2">Họ Tên</th>
                                    <th class="column3">Điện Thoại</th>
                                    <th class="column4">Địa Chỉ</th>
                                    <th class="column5">Email</th>
                                    <th class="column6">Username</th>
                                    <th class="column6">Password</th>
                                    <th class="column6">Vai Trò</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="list" value="${sessionScope.ListCustomer}" />
                                <c:if test="${not empty list}">
                                    <c:set var="count" value="0"/>
                                    <c:forEach var="rows" items="${list}">
                                        <c:set var="count" value="${count+1}"/>
                                        <tr>
                                            <td class="column1">${count}</td>
                                            <td class="column2">${rows.hoten}</td>
                                            <td class="column3">${rows.sdt}</td>
                                            <td class="column4">${rows.diachi}</td>
                                            <td class="column5">${rows.email}</td>
                                            <td class="column6">${rows.username}</td>
                                            <td class="column6">${rows.password}</td>
                                            <td class="column6">${rows.role}</td>
                                    <form action="CustomerController" method="post">
                                        <input type="hidden" name="txtCode" value="${rows.code}" />
                                        <td><button type="submit" name="action" value="btnInfo">Cập Nhật</button></td>
                                    </form>

                                    <form action="CustomerController" method="post">
                                        <td>
                                            <input type="hidden" name="txtCode" value="${rows.code}">
                                            <button type="submit" name="action" value="btnXoa" onclick="{
                                                        return confirmComplete();
                                                    }">Xóa</button>
                                        </td>
                                    </form>
                                    </tr>

                                </c:forEach>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                    <div>
                        <button id="button-add" onclick="getModal('addForm')">Thêm Khách Hàng</button>
                    </div>

                </div>

            </div>

        </div>


        <script>
            var modal;
            function getModal(id) {
                // Get the modal
                modal = document.getElementById(id);
                modal.style.display = "block";
            }
            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }
        </script>

        <!--===============================================================================================-->	
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

    </body>
</html>
