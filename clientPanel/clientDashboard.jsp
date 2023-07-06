<%-- 
    Document   : clientDashboard
    Created on : Jan 3, 2022, 5:47:34 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- basic -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- mobile metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1">
        <!-- site metas -->
        <title>CLIENT DASHBOARD</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
        <!-- Responsive-->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/responsive.css">
        <!-- fevicon -->
        <link rel="icon" href="<%=request.getContextPath()%>/resources/images/fevicon.png" type="image/gif" />
        <!-- Scrollbar Custom CSS -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/jquery.mCustomScrollbar.min.css">
        <!-- Tweaks for older IEs-->
        <link rel="stylesheet" href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css" media="screen">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>
    <body class="main-layout">
        <!-- loader  -->
      <div class="loader_bg">
         <div class="loader"><img src="<%=request.getContextPath()%>/resources/images/loading.gif" alt="#" /></div>
      </div>
      <!-- end loader -->
      <!-- header -->
      <header>
         <!-- header inner -->
         <div class="header">
            <div class="container">
               <div class="row">
                  <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
                     <div class="full">
                        <div class="center-desk">
                           <div class="logo">
                               <a href="<%=request.getContextPath()%>/clientPanel/clientDashboard.jsp"><h1 style="font-size:35px">EPICU TRADING</h1></a>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
                     <nav class="navigation navbar navbar-expand-md navbar-dark ">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample04" aria-controls="navbarsExample04" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarsExample04">
                            <div class="navbar">
                                <div class="dropdown1">
                                  <button class="dropbtn1">HELLO! <i class="fa fa-caret-down"></i></button>
                                  <div class="dropdown1-content">
                                    <a href="<%=request.getContextPath()%>/clientPanel/view-profile.jsp">View Profile</a>
                                    <a href="<%=request.getContextPath()%>/clientPanel/booking-history.jsp">Booking History</a>
                                    <a href="#">Settings</a>
                                    <a href="<%=request.getContextPath()%>/index.jsp">Logout</a>
                                  </div>
                                </div> 
                            </div>
                        </div>
                     </nav>
                  </div>
               </div>
            </div>
         </div>
      </header>
      <!-- end header inner -->
      <!-- end header -->
      <!-- choosing section -->
            <!-- bestCar -->
      <div id="contact" style="background-color: #002752;width: auto; height: auto">
            <div class=""style="">
                <br><br>
                <div style="width: 50%; float: left; background: #002752;"> 
                    <div class="col-md-12 offset-md-6 imagezoom" style="margin: auto">
                        <a href="<%=request.getContextPath()%>/clientPanel/option-buying-car.jsp">
                            <img src="<%=request.getContextPath()%>/resources/images/buycar.jpg" alt="#" />
                            <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%)">
                                <h6><strong class="multi" style="color: white; font-size: 60px; text-shadow: 4px 4px black;">Buy Car?</strong></h6>
                            </div>
                        </a>
                     </div>
                </div>
                <div style="margin-left: 50%; background: #002752;"> 
                    <div class="col-md-12 offset-md-6 imagezoom" style="margin: auto">
                        <a href="<%=request.getContextPath()%>/clientPanel/option-selling-car.jsp">
                            <img src="<%=request.getContextPath()%>/resources/images/sellcar1.jpg" alt="#" />
                            <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%)">
                                <h6><strong class="multi" style="color: white; font-size: 60px; text-shadow: 4px 4px black;">Sell Car?</strong></h6>
                            </div>
                        </a>
                     </div>
                </div><br><br>
                     
            </div>
        </div>
 
      <!-- end bestCar -->
      <!-- end choosing section -->

      
      <!--  footer -->
      <footer>
         <div class="footer">
            <div class="container">
               <div class="row">
                  <div class="col-md-12">
                     <div class="cont_call">
                        <h6> <strong class="multi color_chang"> Call Now</strong><br>
                            019-7199338 (PAK CHU)<br>
                            019-6129414 (EPI)
                        </h6>
                     </div>
                     <div class="cont">
                        <h6> <strong class="multi"> Location</strong> 
                           In front of Pejabat Pos Selising, 16810 Pasir Puteh Kelantan
                        </h6>
                     </div>
                  </div>
               </div>
            </div>
            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <p>EPICU TRADING © 2022 All Rights Reserved.</p>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </footer>
      <!-- end footer -->
      <!-- Javascript files-->
      <script src="<%=request.getContextPath()%>/resources/js/jquery.min.js"></script>
      <script src="<%=request.getContextPath()%>/resources/js/popper.min.js"></script>
      <script src="<%=request.getContextPath()%>/resources/js/bootstrap.bundle.min.js"></script>
      <script src="<%=request.getContextPath()%>/resources/js/jquery-3.0.0.min.js"></script>
      <script src="<%=request.getContextPath()%>/resources/js/plugin.js"></script>
      <!-- sidebar -->
      <script src="<%=request.getContextPath()%>/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
      <script src="<%=request.getContextPath()%>/resources/js/custom.js"></script>
      <script src="https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
    </body>
</html>

