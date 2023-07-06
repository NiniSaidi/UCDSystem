<%-- 
    Document   : process-view-car2
    Created on : Jun 21, 2022, 6:43:50 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="java.sql.*, com.UCDSystem.Car, com.UCDSystem.DBConnection" %>
<jsp:useBean id="carDao" class="com.UCDSystem.CarDAO" scope="request"/>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>DEALER PANEL MANAGEMENT</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="<%=request.getContextPath()%>/resources/css/cssdashboard/bootstrap.css" rel="stylesheet" />
     <!-- FONTAWESOME STYLES-->
    <link href="<%=request.getContextPath()%>/resources/css/cssdashboard/font-awesome.css" rel="stylesheet" />
     <!-- MORRIS CHART STYLES-->
    <link href="<%=request.getContextPath()%>/resources/js/jsdashboard/morris/morris-0.4.3.min.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="<%=request.getContextPath()%>/resources/css/cssdashboard/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
<style>
.mySlides {display:none;}
.centered{
    margin-left: auto;
    margin-right: auto;
}
</style>
</head>
<%
        String carID = request.getParameter("carID");
        
        Connection cn = DBConnection.getConnection();
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from car where carID = '"+carID+"'");
        
    %>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=request.getContextPath()%>/dealerPanel/dealerDashboard.jsp"">DEALER PANEL</a> 
            </div>
            <c:set var = "now" value = "<%= new java.util.Date()%>" />
            <div style="color: white; padding: 15px 50px 5px 50px; float: right; font-size: 16px;"> <fmt:formatDate type = "both" dateStyle = "medium" timeStyle = "medium" value = "${now}" /> &nbsp; <a href="<%=request.getContextPath()%>/login/dealerLogin.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="<%=request.getContextPath()%>/resources/images/find_user.png" style="width: 100px" class="user-image img-responsive"/>
                    <%
                         Object dealerid = session.getAttribute("dealerid");
                         Object fname = session.getAttribute("fname");
                         
                         if (dealerid!= null){
                            out.println("<p style='color:white; padding-top: 0px'>Dealer ID: "+dealerid+"<br>");
                            out.println("Dealer Name: "+fname+"</p>");
                         }
                         
                     %>
					</li>
				
					
                    <li>
                        <a href="<%=request.getContextPath()%>/dealerPanel/dealerDashboard.jsp"><i class="fa fa-dashboard fa-2x"></i> Dashboard</a>
                    </li>
                    
                    <li>
                        <a  href="#"><i class="fa fa-user fa-2x"></i> Customer Account List<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=request.getContextPath()%>/dealerPanel/process-view-buyer.jsp">Buyer Account List</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/dealerPanel/process-view-seller.jsp">Seller Account List</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-car fa-2x"></i> Car List Information<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=request.getContextPath()%>/dealerPanel/add-car-form.jsp">New Car Form</a>
                            </li>
                            <li>
                                <a class="active-menu" href="<%=request.getContextPath()%>/dealerPanel/process-view-car.jsp">Car List</a>
                            </li>
                        </ul>
                    </li>
                    
                    <li>
                        <a href="#"><i class="fa fa-th-list fa-2x"></i> Booking List<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="<%=request.getContextPath()%>/dealerPanel/process-view-ibooking.jsp">Inspection Booking List</a>
                            </li>
                            <li>
                                <a href="<%=request.getContextPath()%>/dealerPanel/process-view-tdbooking.jsp">Test Drive Booking List</a>
                            </li>
                        </ul>
                    </li> 
                    	
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        
        <div id="page-wrapper" >
            <div id="page-inner" style="width: 100%">
                <div class="row">
                    <% while (rs.next()) {%>
                    <div class="col-md-12">
                        <fieldset style="background-color: #eeeeee; padding-left: 10px">
                            <legend>Car Information</legend>
                            <table style="margin-left: 10px; margin-bottom: 15px; width: 100%">
                                <tr>
                                    <td style="width: 30%"><b>Car ID:</b> <%=rs.getString("carID") %></td>
                                    <td style="width: 30%"><b>Car Name:</b> <%=rs.getString("carName") %></td>
                                    <td style="width: 30%"><b>Car Status:</b> <%=rs.getString("carStatus") %></td>
                                </tr>
                                <tr>
                                    <td><b>Color:</b> <%=rs.getString("color") %></td>
                                    <td><b>Selling Price:</b> <%=rs.getString("sellingPrice") %></td>
                                    <td><b>Condition:</b> <%=rs.getString("conditions") %></td>
                                </tr>
                                <tr>
                                    <td><b>Made By:</b> <%=rs.getString("madeBy") %></td>
                                    <td><b>Model:</b> <%=rs.getString("model") %></td>
                                    <td><b>Description:</b> <%=rs.getString("description") %></td>
                                </tr>
                            </table>
                        </fieldset>
                        <fieldset style="background-color: #eeeeee; padding-left: 10px">
                            <legend>Car Ownership</legend>
                            <table style="margin-left: 10px; margin-bottom: 15px; width: 100%">
                                <tr>
                                    <td style="width: 30%"><b>ID:</b> <%=rs.getString("id") %></td>
                                    <td style="width: 30%"><b>Owner Name:</b> <%=rs.getString("ownerName") %></td>
                                    <td style="width: 30%"><b>Owner Address:</b> <%=rs.getString("ownerAddress") %></td>
                                </tr>
                            </table>
                        </fieldset>
                        <fieldset style="background-color: #eeeeee; padding-left: 10px">
                            <legend>Engine Information</legend>
                            <table style="margin-left: 10px; margin-bottom: 15px; width: 100%">
                                <tr>
                                    <td style="width: 30%"><b>Engine No:</b> <%=rs.getString("engineNo") %></td>
                                    <td style="width: 30%"><b>Engine Capacity:</b> <%=rs.getString("engineCapacity") %></td>
                                    <td style="width: 30%"><b>Fuel Type:</b> <%=rs.getString("fuelType") %></td>
                                </tr>
                                <tr>
                                    <td><b>Original Status:</b> <%=rs.getString("originStatus") %></td>
                                    <td><b>Use Class:</b> <%=rs.getString("useClass") %></td>
                                    <td><b>Body Type:</b> <%=rs.getString("bodyType") %></td>
                                </tr>
                                <tr>
                                    <td><b>Year Made:</b> <%=rs.getString("yearMade") %></td>
                                    <td><b>Registration Date:</b> <%=rs.getString("regDate") %></td>
                                    <td><b>BDM/BGK:</b> <%=rs.getString("bdm_bgk") %></td>
                                </tr>
                                <tr>
                                    <td><b>BTM:</b> <%=rs.getString("btm") %></td>
                                </tr>
                            </table>
                        </fieldset><hr/>
                        <fieldset >
                            
                            <div style="text-align: center">
                                <img class="mySlides centered" src="<%=request.getContextPath()%>/images/getImage.jsp?carID=<%=carID%>" width='450px'/>
                                <img class="mySlides centered" src="<%=request.getContextPath()%>/images/getImage2.jsp?carID=<%=carID%>" width='450px'/>
                                <img class="mySlides centered" src="<%=request.getContextPath()%>/images/getImage3.jsp?carID=<%=carID%>" width='450px'/>
                                <img class="mySlides centered" src="<%=request.getContextPath()%>/images/getImage4.jsp?carID=<%=carID%>" width='450px'/>
                                <img class="mySlides centered" src="<%=request.getContextPath()%>/images/getImage5.jsp?carID=<%=carID%>" width='450px'/>

                                <button class="centered" onclick="plusDivs(-1)">&#10094;</button>
                                <button class="centered" onclick="plusDivs(1)">&#10095;</button>
                              </div>
                            
                            
                            
                        </fieldset>
                       <hr/>
                    </div>
                    <%}%>   
                    <div style="text-align: center">
                        <button type="button"><a href="process-update-car.jsp?carID=<%=carID%>" style=" text-decoration: none; color: black">Update</a></button>
                        <button type="button" onclick="window.location.href = 'process-view-car.jsp';return false;">Cancel</button>
                    </div>
                     
                </div>
            </div>
             <!-- /. PAGE INNER  -->
        </div>
        
        
        
        
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
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
