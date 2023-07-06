<%-- 
    Document   : seller-view-profile
    Created on : Jun 8, 2022, 12:33:21 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.SellerDAO" %>
<%@page import="com.UCDSystem.Seller" %>
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
        <title>SELLER DASHBOARD</title>
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
            .container1{
}
.container2{
display: table;
max-width: 1200px;
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
                               <a href="<%=request.getContextPath()%>/sellerPanel/sellerDashboard.jsp"><h1 style="font-size:35px">EPICU TRADING</h1></a>
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
                         Object sellerID = session.getAttribute("sellerID");
                         Object sellerFirstName = session.getAttribute("sellerFirstName");
                         Object sellerLastName = session.getAttribute("sellerLastName");
                         
                        Connection cn = DBConnection.getConnection();
                        Statement st = cn.createStatement();
                        ResultSet rs = st.executeQuery("select * from seller where sellerID = '"+sellerID+"'");
                         
                         if (sellerID!= null){
                            out.println("HELLO, "+sellerFirstName+"!");
                         }
                         
                     %>
                                  <i class="fa fa-caret-down"></i></button>
                                  <div class="dropdown1-content">
                                      <a href="<%=request.getContextPath()%>/sellerPanel/sellerDashboard.jsp">Dashboard</a>
                                      <a href="<%=request.getContextPath()%>/sellerPanel/ibooking-form-new.jsp">Booking Form</a>
                                      <a href="<%=request.getContextPath()%>/sellerPanel/process-view-booking.jsp">Booking History</a>
                                      <a href="<%=request.getContextPath()%>/sellerPanel/seller-view-profile.jsp">View Profile</a>
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
      <div id="contact" style="background-color: whitesmoke;width: auto; height: auto; background-image: url('<%=request.getContextPath()%>/resources/images/carstore.png')">
            <div style="padding: 10px; width: 60%; margin-left: auto; margin-right: auto">
                <br>
                <div class="container1 center">
                <div class="container2 col-md-4" style="margin-left: auto; margin-right: auto"">
                 <h1 style="text-align: center; padding-top: 15px; font-size: 30px ">My Profile</h1>
                 
                 <form name="viewprofile" class="form-group" id="tdbooking" action="process-update-account.jsp" method="POST">
                    <fieldset style="padding: 15px">
                        <% while (rs.next()) {%>
                        <table style="border-collapse:separate; border-spacing:0 15px;" class="center">
                            <tr>
                                <td><label for="sellerID"><b>Seller ID : </b></label></td>
                                <td><input type="text" name="sellerID" id="sellerID" value="<%=sellerID%>" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="sellerFirstName"><b>Seller First Name : </b></label></td>
                                <td><input type="text" name="sellerFirstName" id="sellerFirstName" value="<%=sellerFirstName%>" readonly></td>
                                <td><label for="sellerLastName"><b>Seller Last Name : </b></label></td>
                                <td><input type="text" name="sellerLastName" id="sellerLastName" value="<%=sellerLastName%>" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="sellerPhoneNo"><b>Phone Number : </b></label></td>
                                <td><input type="text" name="sellerPhoneNo" id="sellerPhoneNo" value="<%=rs.getString("sellerPhoneNo") %>" readonly></td>
                                <td><label for="sellerEmail"><b>E-mail : </b></label></td>
                                <td><input type="text" name="sellerEmail" id="sellerEmail" value="<%=rs.getString("sellerEmail") %>" readonly></td>
                            </tr>
                            <tr>
                                <td><label for="sellerAddress"><b>Address : </b></label></td>
                                <td><input type="text" name="sellerAddress" id="sellerAddress" value="<%=rs.getString("sellerAddress") %>" readonly></td>
                                <td><label for="sellerPw"><b>Password : </b></label></td>
                                <td><input type="password" name="sellerPw" id="sellerPw" value="<%=rs.getString("sellerPw") %>" readonly></td>
                            </tr>
                        </table>
                         <%}%>
                        <div style=" text-align: center">
                            <button type="submit" class="button button1">Update</button>
                        <button type="button" class="button button1" onclick="window.location='<%=request.getContextPath()%>/sellerPanel/sellerDashboard.jsp'">Cancel</button>
                        <br>
                        </div>
                        
                       </fieldset>
                    </form>
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
