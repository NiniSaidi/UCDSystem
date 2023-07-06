<%-- 
    Document   : clientForm
    Created on : Jan 2, 2022, 10:47:13 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Saurav">
        <link href="<%=request.getContextPath()%>/resources/css/css1/bootstrap.min.css" rel="stylesheet">
        <title>Test Drive Booking Form</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
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
    
    <body class="main-layout" style=" background-color: #082454">
        
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
        
        <div class="container" style="margin-top: 25px; background-color: white">
            <div class="py-5 text-center">
               <h2>Test Drive Booking Form</h2>
             </div>
        </div>
        
        <div class="container" style="background-color: #dde4ed; margin-bottom: 25px">
            <div class="row">
                <div class="col-md-8" style="margin-left: auto; margin-right: auto">
                    <form style="color:black">
                        <div class="form-group">
                            <input type="hidden" class="form-control" id="formid">
                        </div>
                        
                        <div class="form-group">
                            <label for="firstname"><strong>Buyer ID</strong></label>
                            <input type="text" class="form-control" id="" placeholder="800101115051" readonly>
                        </div>
                        
                        <div class="form-group">
                            <label for="firstname"><strong>Car ID</strong></label>
                            <input type="text" class="form-control" id="" placeholder="WUA9601" readonly>
                        </div>
                        
                        <div class="form-group">
                            <label for="lastname"><strong>Booking Date</strong></label>
                            <input type="date" class="form-control"  required>
                        </div>
                        
                        <div class="form-group">
                            <label for="phoneno"><strong>Description</strong></label>
                            <input type="text" class="form-control" id="" placeholder="Want to test drive the car" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="phoneno"><strong>Booking Status</strong></label>
                                    <select id="bookingstatus" name="status" disabled>
                                        <option value="Pending"> Pending </option>
                                        <option value="Accept"> Accept </option>
                                        <option value="Reject"> Reject </option>
                                    </select>
                        </div>

                        <hr class="mb-4">
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Book Now</button>
                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="window.location='<%=request.getContextPath()%>/clientPanel/view-car-info.jsp'">Cancel</button>
                        <br>
                    </form>
                </div>
            </div>
            
        </div>
                     <!--  footer -->
      <footer>
         <div class="footer">
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
</body>
</html>

