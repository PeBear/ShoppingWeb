<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <!-- cart.jsp -->
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
        <!-- index.jsp -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/productDetail.css">

        <title>Document</title>
    </head>

    <body>

        <div>
            <div id="clock"></div>
        </div>
        <a id="chatting">Chatting</a>
        <div id="box-chat" style="display: none" ng-app="app" ng-controller="myController">
            <input type="text" ng-model="txtName" placeholder="Name">
            <input type="text" ng-model="txtMess" placeholder="Mess">
            <button ng-click="sendMess()">Send</button>
            <div id="content"></div>
        </div>
        <header>
            <div class="bg-cover">
                <div class="login">
                    <ul>
                        <li><a href="login.jsp">LOGIN</a></li>
                        <li><a href="reg.jsp">REGISTER</a></li>
                    </ul>
                </div>
                <div class="logo">
                    <a href="index.jsp">xPeter</a>
                </div>
                <div class="logo-nav">
                    <ul>
                        <li><a href="https://www.facebook.com/peter.vuog" target="blank"><i class="fa fa-facebook"></i></a>
                        </li>
                        <li><a href=""><i class="fa fa-instagram"></i></a></li>
                        <li><a href=""><i class="fa fa-google"></i></a></li>
                        <li><a href=""><i class="fa fa-twitter"></i></a></li>
                        <li><a href=""><i class="fa fa-rss"></i></a></li>
                    </ul>
                </div>
                <br>
                <div class="menu">
                    <ul>
                        <li><a href="index.jsp">HOME</a></li>
                        <li><a href="customers.jsp">CUSTOMERS</a></li>
                        <li><a href="products.jsp">PRODUCTS</a></li>
                        <li><a href="cart.jsp">YOUR CART</a></li>
                    </ul>
                </div>
            </div>
        </header>
        <script src="js/clock.js"></script>

        <c:set var="cart" value="${sessionScope.Cart}" />
        <div class="limiter">
            <div class="container-table100" style="margin: auto; background: white">
                <div class="wrap-table100">
                    <div class="table100">
                        <table>
                            <thead>
                                <tr class="table100-head">
                                    <th class="column1">STT</th>
                                    <th class="column1"></th>
                                    <th class="column2">Sản Phẩm</th>
                                    <th class="column3">Số Lượng</th>
                                    <th class="column4">Giá</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:set var="count" value="0"/>
                                <c:forEach var="row" items="${cart}">
                                    <c:set var="count" value="${count +1 }"/>
                                    <tr>
                                        <td style="text-align: center">${count}</td>
                                        <td style="text-align: center"><img src="images/${row.value.sanpham.hinh}" width="100" ></td>
                                        <td>${row.value.sanpham.tensp} </td>
                                        <td>${row.value.soluong}</td>
                                        <td>${row.value.sanpham.giaXuLy} vnd</td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="4" style="font-size: 2em; text-align: right"><b>Total:</b></td>
                                    <td style="font-size: 2em"><b>${sessionScope.CartTotal} vnd</b></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="text-align: center">
                        <button>Thanh Toán</button>
                    </div>
                </div>

            </div>

        </div>
        <%@include file="footer.html" %>
</html>
