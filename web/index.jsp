<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Document</title>
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/jquery-ui.js"></script>
        <script src="js/angular.min.js"></script>
        <script src="js/chatting.js"></script>
    </head>

    <body onload="showAutoSlide('autoImg_fairy')">
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
                        <li>
                            <a href="" onmouseover="showChildMenu('child-menu')" onmouseout="hideChildMenu('child-menu')">HOME</a>
                        </li>
                        <li><a href="">ABOUT</a></li>
                        <li><a href="">CONTACT</a></li>
                        <li><a href="cart.jsp">SHOP</a></li>
                    </ul>
                </div>
                <div class="container-slide">
                    <div class="slideshow" onload="showSlides()">
                        <div class="images-box fade">
                            <a href="trang1.html" target="blank"><img src="images/anh1.jpg" alt=""></a>
                        </div>
                        <div class="images-box fade">
                            <a href="trang2.html" target="blank"><img src="images/anh2.jpg" alt=""></a>
                        </div>
                        <div class="images-box fade">
                            <a href="trang3.html" target="blank"><img src="images/anh3.png" alt=""></a>
                        </div>
                        <a class="prev slide-button" onclick="plusSlide(-1)">
                            <</a>
                                <a class="next slide-button" onclick="plusSlide(1)">></a>
                    </div>
                </div>
            </div>
        </header>

        <article>
            <%@include file="shop.jsp"%>
        </article>
        <aside>
        </aside>
        <footer>
            xPeter - web shopping - copyright by xPeter
            contact: 0902284213 - minhthang3792@gmail.com
        </footer>
        <script>
            $("#chatting").click(function() {
                $("#box-chat").toggle();
            });
        </script>
        <script src="js/loginForm.js"></script>
        <script src="js/slide.js"></script>
        <script src="js/autoSlide.js"></script>
        <script src="js/showChildmenu.js"></script>
        <script src="js/clock.js"></script>
        <script src="js/validateForm.js"></script>
        <script src="js/datepicker.js"></script>

    </body>

    </html>