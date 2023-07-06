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
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/css/login.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    </head>
    <body>
        
        
        
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-2"></div>
            <div class="col-lg-6 col-md-8 login-box">
                <div style="padding-top: 5px;">
                    <h1><a href="<%=request.getContextPath()%>/index.jsp" style="background-color: black; padding: 5px; color: white; text-decoration: none; font-size: 25px"><b>EPICU TRADING</b></a></h1>
                </div>
                <div class="col-lg-12 login-key">
                    <i class="fa fa-question-circle" aria-hidden="true"></i>
                </div>
                <div class="col-lg-12 login-title">
                    CREATE AN ACCOUNT
                </div>
                <br><br>
                <div>
                    <button class="button button1" onclick="window.location='<%=request.getContextPath()%>/login/sellerForm.jsp'" type="button">AS SELLER</button>
                    <button class="button button1" onclick="window.location='<%=request.getContextPath()%>/login/buyerForm.jsp'" type="button">AS BUYER</button>
                </div><br>
                <div>
                    <button class="button button1" onclick="window.location='<%=request.getContextPath()%>/login/userLogin.jsp'" type="button">CANCEL</button>
                </div>
                <br><br>
                <div class="col-lg-12 ">
                                <div class="col-lg-6 ">
                                    <!-- Error Message -->
                                </div>
                                <div class="hr"><br>
                                    <p>Dealer <a href="<%=request.getContextPath()%>/login/dealerLogin.jsp" style="color: yellow">login</a></p>
                                </div>
                            </div>
                            <br><br><br>

                
                <div class="col-lg-3 col-md-2"></div>
            </div>
        </div>
    </div>

        
        
    </body>
</html>



