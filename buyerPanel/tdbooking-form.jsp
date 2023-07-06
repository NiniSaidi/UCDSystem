<%-- 
    Document   : tdbooking-form
    Created on : May 28, 2022, 7:20:38 PM
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
        <style>
            .container1{
}
.container2{
display: table;
max-width: 700px;
width: 100%;
background-color: #ffffff;
box-shadow: 1px 1px 5px rgba(0, 0, 0, 0.5);
}
.center{
    margin-left: auto; margin-right: auto
}
td {
padding:5px;
}
.button {
  border: none;
  color: white;
  padding: 10px 20px;
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
.centered{
      font-size: 40px;
  position: absolute;
  top: 5%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: black;
  padding: 5px; 
}
        </style>
    </head>
    
    <body>
        
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
                         String carID = request.getParameter("carID");
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
      
      <div id="contact" style=" overflow:hidden; background-color: whitesmoke;width: auto; height: auto; background-image: url('<%=request.getContextPath()%>/resources/images/carstore.png')">
            <div style="padding: 10px; width: 100%; margin-left: auto; margin-right: auto">
                <br>
                <div class="container1 center">
                <div class="container2 col-md-4" style="margin-left: auto; margin-right: auto"">
                 <h1 style="text-align: center; padding-top: 15px; font-size: 30px ">Test Drive Booking Form</h1>
                 <form name="tdbooking" class="form-group" id="tdbooking" action="process-add-tdbooking.jsp" method="POST">
                    <fieldset style="padding: 15px">
                        <table style="border-collapse:separate; border-spacing:0 15px;" class="center">
                            
                                <label for="formID"></label>
                                <input type="hidden" name="formID" class="form-control" id="formID"/>   
                     
                            
                            <tr>
                                <td><label for="buyerID"><b>Buyer ID</b></label></td>
                                <td><input type="text" name="buyerID" class="form-control" id="buyerID" placeholder="Buyer ID" value="<%=buyerID%>" readonly></td>
                                <td><label for="carID"><b>Car ID</b></label></td>
                                <td><input type="text" name="carID" class="form-control" id="carID" placeholder="BJG4392" value="<%=carID%>" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="bookingDate"><b>Booking Date</b></label></td>
                                <td><input type="date" name="bookingDate" class="form-control" id="bookingDate" required></td>
                                <td><label for="bookingStatus"><b>Booking Status </b></label></td>
                                <td><input type="text" name="bookingStatus" class="form-control" id="bookingStatus" placeholder="Pending" value="Pending" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="description"><b>Description</b></label></td>
                                <td><input type="text" name="description" class="form-control" id="description" placeholder="Want to test drive the car" required></td>
                            </tr>
                        </table>
                        <div style=" text-align: center">
                            <button type="submit" class="button button1">Book Now</button>
                         <button type="button" class="button button1" onclick="history.back()">Cancel</button>
                        </div>
                        
                       </fieldset>
                    </form>
             </div>
            </div>
            </div>
            <br><br>
        </div>
        
                     <!--  footer -->
      <footer>
         <div class="">
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
