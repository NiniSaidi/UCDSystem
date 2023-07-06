<%-- 
    Document   : view-booking-info
    Created on : Jun 9, 2022, 11:08:26 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="java.sql.*, com.UCDSystem.InspectionBooking, com.UCDSystem.Seller, com.UCDSystem.DBConnection" %>
<jsp:useBean id="database" class="com.UCDSystem.DBConnection" scope="request"/>
<jsp:useBean id="sellerDao" class="com.UCDSystem.SellerDAO" scope="request"/>
<jsp:useBean id="inspectionbookingDao" class="com.UCDSystem.InspectionBookingDAO" scope="request"/>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>BOOKING HISTORY</title>
	<!-- BOOTSTRAP STYLES-->
    <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">
        <!-- bootstrap css -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/bootstrap.min.css">
        <!-- style css -->
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/style.css">
        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/styletable.css">
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
.mySlides {display:none;}
.centers{
    margin-left: auto;
    margin-right: auto;
    text-align: center;
}
.columns {
  float: left;
  width: 40%;
  padding: 10px;
}
.rows:after {
  content: "";
  display: table;
  clear: both;
}
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 16px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
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
       <div id="contact" style=" overflow:hidden; background-color: whitesmoke;width: auto; height: auto; background-image: url('<%=request.getContextPath()%>/resources/images/carstore.png')">
            <div style="padding: 10px; width: 95%; margin-left: auto; margin-right: auto">
                <br>
                <%
            String inspectID = request.getParameter("inspectID");
            Connection cn = DBConnection.getConnection();
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from inspectionbooking where inspectID = '"+inspectID+"'");
        %>
        
        <div class='row'>
            <div class='col-md-12 container1 center' style="margin-left: auto; margin-right: auto">
                <div class='panel panel-default container2 col-md-4'>
                    <% while (rs.next()) {%>
                    <h1 style="text-align: center; padding-top: 15px; font-size: 30px ">Booking Information</h1>
                    <div class='panel-body rows'>
                        <div class="columns">
                            
                            <img class="mySlides centers" src='<%=request.getContextPath()%>/sellerPanel/getImage.jsp?inspectID=<%=rs.getString("inspectID") %>' width='450px'/>
                            <img class="mySlides centers" src='<%=request.getContextPath()%>/sellerPanel/getImage2.jsp?inspectID=<%=rs.getString("inspectID") %>' width='450px'/>
                            <img class="mySlides centers" src='<%=request.getContextPath()%>/sellerPanel/getImage3.jsp?inspectID=<%=rs.getString("inspectID") %>' width='450px'/>
                            <img class="mySlides centers" src='<%=request.getContextPath()%>/sellerPanel/getImage4.jsp?inspectID=<%=rs.getString("inspectID") %>' width='450px'/>
                            <img class="mySlides centers" src='<%=request.getContextPath()%>/sellerPanel/getImage5.jsp?inspectID=<%=rs.getString("inspectID") %>' width='450px'/>
                            
                                <button type="button"  onclick="plusDivs(-1)">&#10094;</button>
                                <button type="button"  style="margin-left: 95%" onclick="plusDivs(1)">&#10095;</button>
                            
                        </div>
                            
                        <div class="">
                            <fieldset>
                                <table style="margin-left: 10px; margin-bottom: 2px; width: 100%">
                                    <tr>
                                        <td><b>Inspection ID:</b> <%=rs.getString("inspectID") %></td>
                                        <td><b>Inspection Date:</b> <%=rs.getString("inspectDate") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>Booking Status:</b> <%=rs.getString("bookingStatus") %></td>
                                        <td><b>Car ID:</b> <%=rs.getString("carID") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>Car Name:</b> <%=rs.getString("carName") %></td>
                                        <td><b>Color:</b> <%=rs.getString("color") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>Selling Price:</b> <%=rs.getString("sellingPrice") %></td>
                                        <td><b>Condition:</b> <%=rs.getString("conditions") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>Made By:</b> <%=rs.getString("madeBy") %></td>
                                        <td><b>Model:</b> <%=rs.getString("model") %></td>
                                        
                                    </tr>
                                    <tr>
                                        <td><b>Description:</b> <%=rs.getString("description") %></td>
                                        <td><b>ID:</b> <%=rs.getString("id") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>Owner Name:</b> <%=rs.getString("ownerName") %></td>
                                        <td><b>Owner Address:</b> <%=rs.getString("ownerAddress") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>Engine No:</b> <%=rs.getString("engineNo") %></td>
                                        <td><b>Engine Capacity:</b> <%=rs.getString("engineCapacity") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>Fuel Type:</b> <%=rs.getString("fuelType") %></td>
                                        <td><b>Original Status:</b> <%=rs.getString("originStatus") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>Use Class:</b> <%=rs.getString("useClass") %></td>
                                        <td><b>Body Type:</b> <%=rs.getString("bodyType") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>Year Made:</b> <%=rs.getString("yearMade") %></td>
                                        <td><b>Registration Date:</b> <%=rs.getString("regDate") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>BDM/BGK:</b> <%=rs.getString("bdm_bgk") %></td>
                                        <td><b>BTM:</b> <%=rs.getString("btm") %></td>
                                    </tr>
                                </table>
                            </fieldset>
                        </div>
                    </div>
                    <%}%><button class="button button1" type="button" style="margin-bottom: 10px; margin-left: 50%" onclick="window.location='<%=request.getContextPath()%>/sellerPanel/process-view-booking.jsp'">Back</button>    
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
    

    <!-- JQUERY SCRIPTS -->
    <script src="<%=request.getContextPath()%>/resources/js/jsdashboard/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="<%=request.getContextPath()%>/resources/js/jsdashboard/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="<%=request.getContextPath()%>/resources/js/jsdashboard/jquery.metisMenu.js"></script>
     <!-- DATA TABLE SCRIPTS -->
    <script src="<%=request.getContextPath()%>/resources/js/jsdashboard/dataTables/jquery.dataTables.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jsdashboard/dataTables/dataTables.bootstrap.js"></script>
        <script>
            $(document).ready(function () {
                $('#dataTables-example').dataTable();
            });
    </script>
      <!-- CUSTOM SCRIPTS -->
    <script src="<%=request.getContextPath()%>/resources/js/jsdashboard/custom.js"></script>
        <script>
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1}
  if (n < 1) {slideIndex = x.length}
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  x[slideIndex-1].style.display = "block";  
}
</script>
    </body>
 </html>   