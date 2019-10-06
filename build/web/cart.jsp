<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Shopping Cart</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="assets/css/custom.css"/>		
    </head>

    <body>
        <c:set var="cart" value="${sessionScope.Cart}" />
        <div class="container-fluid breadcrumbBox text-center">
            <ol class="breadcrumb">
                <li><a href="#">Review</a></li>
                <li class="active"><a href="#">Order</a></li>
                <li><a href="#">Payment</a></li>
            </ol>
        </div>

        <div class="container text-center">

            <div class="col-md-7 col-sm-12 text-left">
                <ul>
                    <li class="row list-inline columnCaptions">
                        <span>QTY</span>
                        <span>ITEM</span>
                        <span>Price</span>
                    </li>
                    <c:forEach var="rows" items="${cart}">
                        <li class="row">
                            <span class="quantity">${rows.value.soluong}</span>
                            <span class="itemName">${rows.value.sanpham.tensp}</span>
                            <span class="popbtn"><a class="arrow"></a></span>
                            <span class="price">${rows.value.sanpham.gia}</span>
                        </li>
                    </c:forEach>
                    <li class="row totals">
                        <span class="itemName">Total:</span>
                        <span class="price">${sum}</span>
                        <span class="order"> <a class="text-center">ORDER</a></span>
                    </li>
                </ul>
            </div>

        </div>

        <!-- The popover content -->

        <div id="popover" style="display: none">
            <a href="#"><span class="glyphicon glyphicon-pencil"></span></a>
            <a href="#"><span class="glyphicon glyphicon-remove"></span></a>
        </div>

        <!-- JavaScript includes -->

        <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script> 
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/customjs.js"></script>

    </body>
</html>
