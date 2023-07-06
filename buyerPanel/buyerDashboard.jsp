<%-- 
    Document   : buyerDashboard
    Created on : Jun 6, 2022, 12:30:30 PM
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
        <title>BUYER DASHBOARD</title>
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
        <style>
   
            .leftbox{
                float: left;
                width: 40%;
            }
            .middlebox{
                float: left;
                width: 20%;
            }
            .rightbox{
                float: left;
                width: 40%
            }
.link{
    border-radius: 25px;
    border: 2px solid #73AD21;
    padding: 20px;
    width: 200px;
    height: 150px;
	margin: 10px;
	color: #000;
	background: white;
  text-decoration: none;
}

.link:hover{
	text-decoration: none;
	color: #000;
}

/*===================*/
/* FLOAT
/*===================*/

.float-on-hover {
  display: inline-block;
  vertical-align: middle;
  -webkit-transform: perspective(1px) translateZ(0);
  transform: perspective(1px) translateZ(0);
  box-shadow: 0 0 1px rgba(0, 0, 0, 0);
  -webkit-transition-duration: 0.3s;
  transition-duration: 0.3s;
  -webkit-transition-property: transform;
  transition-property: transform;
  -webkit-transition-timing-function: ease-out;
  transition-timing-function: ease-out;
}
.float-on-hover:hover, .float-on-hover:focus, .float-on-hover:active {
  -webkit-transform: translateY(-8px);
  transform: translateY(-8px);
}
        </style>
    
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
                               <a href="<%=request.getContextPath()%>/buyerPanel/buyerDashboard.jsp"><h1 style="font-size:35px">EPICU TRADING</h1></a>
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
                                    <button class="dropbtn1">
                    <%
                         Object buyerID = session.getAttribute("buyerID");
                         Object buyerFirstName = session.getAttribute("buyerFirstName");
                         
                         if (buyerID!= null){
                            out.println("HELLO, "+buyerFirstName+"!");
                         }
                         
                     %>
                                  <i class="fa fa-caret-down"></i></button>
                                  <div class="dropdown1-content">
                                      <a href="<%=request.getContextPath()%>/buyerPanel/buyerDashboard.jsp">Dashboard</a>
                                      <a href="<%=request.getContextPath()%>/buyerPanel/view-car-list.jsp">Used Car List</a>
                                      <a href="<%=request.getContextPath()%>/buyerPanel/process-view-booking.jsp">Booking History</a>
                                      <a href="<%=request.getContextPath()%>/buyerPanel/buyer-view-profile.jsp">View Profile</a>
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
      <div id="contact" style=" overflow:hidden; background-color: whitesmoke;width: auto; height: auto; background-image: url('<%=request.getContextPath()%>/resources/images/carstore.png')">
            <div style="padding: 10px; width: 80%; margin-left: auto; margin-right: auto">
                <br><br>
                <div class="row">
                            <div class="col-xl-3 col-md-6 container py-5 text-center float-on-hover container1">
                                <div class="card bg-white text-white mb-4 mt-auto" style="width: 300px; padding: 10px ">
                                    <a href="<%=request.getContextPath()%>/buyerPanel/view-car-list.jsp">
                                        <i class="fa fa-car fa-5x" aria-hidden="true"></i>
                                        <br><br>
                                        <h2>Used Car List</h2>
                                    </a>
                                    
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 container py-5 text-center float-on-hover">
                                <div class="card bg-white text-white mb-4 mt-auto" style="width: 300px; padding: 10px ">
                                    <a href="<%=request.getContextPath()%>/buyerPanel/process-view-booking.jsp">
                                        <i class="fa fa-list-alt fa-5x" aria-hidden="true"></i>
                                        <br><br>
                                        <h2>Booking History</h2>
                                    </a>
                                    
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 container py-5 text-center float-on-hover">
                                <div class="card bg-white text-white mb-4 mt-auto" style="width: 300px; padding: 10px ">
                                    <a href="<%=request.getContextPath()%>/buyerPanel/buyer-view-profile.jsp">
                                        <i class="fa fa-user-circle-o fa-5x" aria-hidden="true"></i>
                                        <br><br>
                                        <h2>View Profile</h2>
                                    </a>
                                    
                                </div>
                            </div>
                        </div>
                     
            </div>
            <br><br>
        </div>
 
      <!-- end bestCar -->
      <!-- end choosing section -->

      
      <!--  footer -->
      <footer>
            <div class="copyright">
               <div class="container">
                  <div class="row">
                     <div class="col-md-12">
                        <p>EPICU TRADING © 2022 All Rights Reserved.</p>
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
