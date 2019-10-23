<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Sign Up Form by Colorlib</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="css/regstyle.css">
</head>
<body>

    <div class="main">

        <section class="signup">
            <!-- <img src="images/signup-bg.jpg" alt=""> -->
            <div class="container">
                <div class="signup-content">
                    <form method="POST" id="signup-form" class="signup-form" action="RegisterController">
                        <h2 class="form-title">Create account</h2>
                        <div class="form-group">
                            Username:
                            <input type="text" class="form-input" name="txtUsername" id="name" placeholder="Your Username"/>
                        </div>
                        <div class="form-group">
                            Email:
                            <input type="email" class="form-input" name="txtEmail" id="email" placeholder="Your Email"/>
                        </div>
                        <div class="form-group">
                            Full name:
                            <input type="text" class="form-input" name="txtHoten" id="name" placeholder="Your Name"/>
                        </div>
                        <div class="form-group">
                            Phone Number:
                            <input type="text" class="form-input" name="txtSDT" id="name" placeholder="Your Phone num"/>
                        </div>
                        <div class="form-group">
                            Address:
                            <input type="text" class="form-input" name="txtDiaChi" id="name" placeholder="Your Address"/>
                        </div>
                        <div class="form-group">
                            Password: 
                            <input type="text" class="form-input" name="txtPassword" id="password" placeholder="Password"/>
                            <span toggle="#password" class="zmdi zmdi-eye field-icon toggle-password"></span>
                        </div>
                        <div class="form-group">
                            Re-Password: 
                            <input type="password" class="form-input" name="txtRepassword" id="re_password" placeholder="Repeat your password"/>
                        </div>
<!--                        <div class="form-group">
                            <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                            <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree all statements in  <a href="#" class="term-service">Terms of service</a></label>
                        </div>-->
                        <div class="form-group">
                            <button type="submit" name="submit" id="submit" class="form-submit" value="btnReg">Sign up</button>
                        </div>
                    </form>
                    <p class="loginhere">
                        Have already an account ? <a href="login.jsp" class="loginhere-link">Login here</a>
                    </p>
                </div>
            </div>
        </section>

    </div>

    <!-- JS -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
</body>
</html>