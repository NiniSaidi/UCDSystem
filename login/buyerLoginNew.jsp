<%-- 
    Document   : login
    Created on : Dec 31, 2021, 12:36:22 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Buyer Login</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <style>
.register-photo {
background: #f1f7fc;
padding: 80px 0
}
.register-photo .image-holder {
display: table-cell;
width: 50%;
background: url(https://imagescdn.dealercarsearch.com/dealerimages/18477/25190/1.jpg);
background-size: cover
}
.register-photo .form-container {
display: table;
max-width: 1000px;
width: 90%;
margin: 0 auto;
box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.5)
}
.register-photo form {
display: table-cell;
width: 400px;
background-color: #ffffff;
padding: 40px 60px;
color: #505e6c
}
@media (max-width:991px) {
.register-photo form {
padding: 40px
}
}
.register-photo form h2 {
font-size: 24px;
line-height: 1.5;
margin-bottom: 30px
}
.register-photo form .form-control {
background: transparent;
border: none;
border-bottom: 2px solid #dfe7f1;
border-radius: 0;
box-shadow: none;
outline: none;
color: inherit;
text-indent: 0px;
height: 40px
}
.register-photo form .form-check {
font-size: 13px;
line-height: 20px
}
.register-photo form .btn-primary {
background: green;
border: none;
border-radius: 4px;
padding: 11px;
box-shadow: none;
margin-top: 35px;
text-shadow: none;
outline: none !important
}
.register-photo form .btn-primary:hover,
.register-photo form .btn-primary:active {
background: green
}
.register-photo form .btn-primary:active {
transform: translateY(1px)
}
.register-photo form .already {
display: block;
text-align: center;
font-size: 12px;
color: #6f7a85;
opacity: 0.9;
text-decoration: none
}

.centered {
  font-size: 50px;
  position: absolute;
  top: 60%;
  left: 30%;
  transform: translate(-50%, -50%);
}
.login-title {
    margin-top: 15px;
    text-align: center;
    font-size: 30px;
    letter-spacing: 2px;
    margin-top: 15px;
    font-weight: bold;
    color: black;
}
.button {
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}
.button1 {
  background-color: #505e6c; 
  color: white; 
  border: 2px solid #505e6c;
}

.button1:hover {
  background-color: whitesmoke;
  color: black;
}
input {
    text-align: center;
}
        </style>
    </head>
    <body>
        
        <div class="register-photo">
            <div class="form-container">
                <div class="image-holder">
                    <h1 class="centered">
                        <a href="<%=request.getContextPath()%>/index.jsp" style="background-color: black;padding: 5px; color: white; text-decoration: none"><b>EPICU TRADING</b></a>
                    </h1>
                </div>
                
                    <form method="post" action="buyerLoginTask.jsp" style=" text-align: center">
                    <div class="col-lg-12">
                        <i class="fa fa-user-circle fa-5x" aria-hidden="true"></i>
                    </div>
                    <div class="col-lg-12 login-title">
                        BUYER LOGIN
                    </div>
                        <br>
                    <div>
                        <div class="form-group"><input class="form-control" type="text" name="buyerID" placeholder="Buyer ID"></div>
                        <div class="form-group"><input class="form-control" type="password" name="buyerPw" placeholder="Password"></div><br>
                        <button class="button button1" type="submit">LOGIN</button>
                        <button class="button button1" onclick="window.location='<%=request.getContextPath()%>/login/userLogin.jsp'" type="button">CANCEL</button>
                    </div>
                    
                    <div class="col-lg-12 ">
                                    <div class="col-lg-6 ">
                                        <!-- Error Message -->
                                    </div>
                                    <div>
                                        <p class="signup">Don't have an account? &nbsp;<a href="<%=request.getContextPath()%>/login/createAccount.jsp" style="color: blue">Sign up</a></p>
                                    </div><hr>
                                    <div class="hr">
                                        <p>Dealer <a href="<%=request.getContextPath()%>/login/dealerLogin.jsp" style="color: blue">login</a></p>
                                    </div>
                    </div>
                </form>
            </div>
        </div> 

        
        
    </body>
</html>



