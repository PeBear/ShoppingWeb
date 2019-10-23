<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <!-- cart.jsp -->
        <!--        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>-->
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="assets/css/custom.css"/>
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