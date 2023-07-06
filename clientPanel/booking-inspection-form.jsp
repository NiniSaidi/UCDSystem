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
        <title>Inspection Booking Form</title>
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
               <h2>Inspection Booking Form</h2>
             </div>
        </div>
        
      <div class="container" style="background-color: #dde4ed; margin-bottom: 25px">
            <div class="row">
                <div class="col-md-8" style="margin-left: auto; margin-right: auto">
                    <form style="color:black">
                        <div class="form-group">
                            <input type="hidden" name="inspectionid" class="form-control" id="inspectionid">
                        </div>
                        
                        <div class="form-group">
                            <label for="username"><strong>Seller ID</strong></label>
                            <input type="text" class="form-control" id="" placeholder="901014105228" readonly>
                            
                        </div>
                        
                        <div class="form-group">
                            <label for="firstname"><strong>Inspection Date</strong></label>
                            <input type="date" class="form-control" id="" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="phoneno"><strong>Car Grant Image</strong></label><br>
                                    <small id="username1" class="form-text text-muted">Select Image File</small>
                                    <input type="file" name="image">
                        </div>

                        <div class="form-group">
                            <label for="phoneno"><strong>Car Name</strong></label>
                                    <input type="text" class="form-control" id="" placeholder="Myvi SE Auto" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="phoneno"><strong>Model</strong></label>
                                    <input type="text" class="form-control" id="" placeholder="Perodua" required>
                                </div>
                                    
                        <div class="form-group">
                            <label for="phoneno"><strong>Selling Price</strong></label>
                                    <input type="text" class="form-control" id="" placeholder="19500" required>
                        </div>
                                
                        <div class="form-group">
                            <label for="phoneno"><strong>Manufacture Year</strong></label>
                                    <input type="text" class="form-control" id="" placeholder="2017" required>
                        </div>
                                    
                        <div class="form-group">
                            <label for="phoneno"><strong>Color</strong></label>
                                    <input type="text" class="form-control" id="" placeholder="Orange" required>
                        </div>
                                
                        <div class="form-group">
                            <label for="phoneno"><strong>Description</strong></label>
                                    <input type="text" class="form-control" id="" placeholder="Never crashed" required>
                        </div>
                                    
                                
                        <div class="form-group">
                            <label for="phoneno"><strong>Car Image 1</strong></label><br>
                                    <small id="username1" class="form-text text-muted">Select Image File</small>
                                    <input type="file" name="image">
                        </div>
                        
                        
                        <div class="form-group">
                            <label for="phoneno"><strong>Car Image 2</strong></label><br>
                                    <small id="username1" class="form-text text-muted">Select Image File</small>
                                    <input type="file" name="image">
                        </div>
                        
                        
                        <div class="form-group">
                            <label for="phoneno"><strong>Car Image 3</strong></label><br>
                                    <small id="username1" class="form-text text-muted">Select Image File</small>
                                    <input type="file" name="image">
                        </div>
                        
                        
                        <div class="form-group">
                            <label for="phoneno"><strong>Car Image 4</strong></label><br>
                                    <small id="username1" class="form-text text-muted">Select Image File</small>
                                    <input type="file" name="image">
                        </div>
                        
                        
                        <div class="form-group">
                            <label for="phoneno"><strong>Car Image 5</strong></label><br>
                                    <small id="username1" class="form-text text-muted">Select Image File</small>
                                    <input type="file" name="image">
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
                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="window.location='<%=request.getContextPath()%>/clientPanel/clientDashboard.jsp'">Cancel</button>
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
