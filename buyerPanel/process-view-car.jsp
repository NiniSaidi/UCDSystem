<%-- 
    Document   : process-view-car
    Created on : Jun 23, 2022, 9:39:27 AM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.UCDSystem.DBConnection, com.UCDSystem.Car"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<jsp:useBean id="carDao" class="com.UCDSystem.CarDAO" scope="request"/>
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
            <div style="padding: 10px; width: 95%; margin-left: auto; margin-right: auto">
                <br>
                <%
            String carID = request.getParameter("carID");
            Connection cn = DBConnection.getConnection();
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from car where carID = '"+carID+"'");
        %>
        <div class='row'>
            <div class='col-md-12 container1 center' style="margin-left: auto; margin-right: auto">
                <div class='panel panel-default container2 col-md-4'>
                    <% while (rs.next()) {%>
                    <h1 style="text-align: center; padding-top: 15px; font-size: 30px ">Car Information</h1>
                    <div class='panel-body rows'>
                        <div class="columns">
                            
                            <img class="mySlides centers" src='<%=request.getContextPath()%>/images/getImage.jsp?carID=<%=rs.getString("carID")%>' width='450px'/>
                            <img class="mySlides centers" src='<%=request.getContextPath()%>/images/getImage2.jsp?carID=<%=rs.getString("carID")%>' width='450px'/>
                            <img class="mySlides centers" src='<%=request.getContextPath()%>/images/getImage3.jsp?carID=<%="carID"%>' width='450px'/>
                            <img class="mySlides centers" src='<%=request.getContextPath()%>/images/getImage4.jsp?carID=<%="carID"%>' width='450px'/>
                            <img class="mySlides centers" src='<%=request.getContextPath()%>/images/getImage5.jsp?carID=<%="carID"%>' width='450px'/>
                            
                            <button type="button" class="centers" onclick="plusDivs(-1)">&#10094;</button>
                            <button type="button" class="centers" onclick="plusDivs(1)">&#10095;</button>
                            
                        </div>
                            
                        <div class="">
                            <fieldset>
                                <table style="margin-left: 10px; margin-bottom: 15px; width: 100%">
                                    <tr>
                                        <td><b>Car ID:</b> <%=rs.getString("carID") %></td>
                                        <td><b>Car Name:</b> <%=rs.getString("carName") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>Car Status:</b> <%=rs.getString("carStatus") %></td>
                                        <td><b>Color:</b> <%=rs.getString("color") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>Selling Price:</b> RM<%=rs.getString("sellingPrice") %></td>
                                        <td><b>Condition:</b> <%=rs.getString("conditions") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>Made By:</b> <%=rs.getString("madeBy") %></td>
                                        <td><b>Model:</b> <%=rs.getString("model") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>Engine Capacity:</b> <%=rs.getString("engineCapacity") %></td>
                                        <td><b>Fuel Type:</b> <%=rs.getString("fuelType") %></td>
                                    </tr>
                                    <tr>
                                        <td><b>Description:</b> <%=rs.getString("description") %></td>
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
                                    </tr>
                                </table>
                            </fieldset>
                        </div>
                    </div>
                    <%}%>
                    <button class="button button1" type="submit" style="margin-bottom: 10px; margin-left: 40%"><a style=" text-decoration: none" href="tdbooking-form.jsp?carID=<%=carID%>">Book Now</a></button>  &nbsp;
                    <button class="button button1" type="button" style=" margin-bottom: 10px;" onclick="window.location='<%=request.getContextPath()%>/buyerPanel/view-car-list.jsp'">Back</button>    
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
