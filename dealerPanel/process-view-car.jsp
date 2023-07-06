<%-- 
    Document   : process-view-car
    Created on : Jan 3, 2022, 11:44:46 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="java.sql.*, com.UCDSystem.Car" %>
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
 
</head>
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
                
               
                 
        <%
            List <Car> allCar = carDao.retrieveAllCar();
            out.println("<div class='row'>");
            out.println("<div class='col-md-12'>");
            out.println("<div class='panel panel-default'>");
            out.println("<div class='panel-heading'>");
            out.println("<b>CAR LIST</b>");
            out.println("</div>");
            out.println("<div class='panel-body'>");
            out.println("<div class='table-responsive'>");
            out.println("<table class='table table-striped table-bordered table-hover' id='dataTables-example'>");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>CAR ID</th>");
            out.println("<th>CAR NAME</th>");
            out.println("<th>CAR STATUS</th>");
            out.println("<th>MODEL</th>");
            out.println("<th>SELLING PRICE (RM)</th>");
            out.println("<th>CONDITION</th>");
            out.println("<th>YEAR</th>");
            out.println("<th>COLOR</th>");
            out.println("<th>DESCRIPTION</th>");
            out.println("<th>IMAGE</th>");
            out.println("<th>ACTIONS</th>");
            out.println("</tr>");
            out.println("</thead>");
            out.println("<tbody>");
            for (int i = 0; i < allCar.size(); i++)
            {
                out.println("<tr>");
                out.println("<td>" + allCar.get(i).getCarID() + "</td>");
                out.println("<td>" + allCar.get(i).getCarName() + "</td>");
                out.println("<td>" + allCar.get(i).getCarStatus() + "</td>");
                out.println("<td>" + allCar.get(i).getModel() + "</td>");
                out.println("<td>" + allCar.get(i).getSellingPrice() + "</td>");
                out.println("<td>" + allCar.get(i).getConditions() + "</td>");
                out.println("<td>" + allCar.get(i).getYearMade() + "</td>");
                out.println("<td>" + allCar.get(i).getColor() + "</td>");
                out.println("<td>" + allCar.get(i).getDescription() + "</td>");
                out.println("<td><img src='"+ request.getContextPath()+ "/images/getImage.jsp?carID=" + allCar.get(i).getCarID() + "' width='50px'/></td>");
                out.println("<td><a href=process-view-car2.jsp?carID="
                        + allCar.get(i).getCarID() + ">View</a>"
                        + "|" + "<a href=process-delete-car.jsp?carID="
                        + allCar.get(i).getCarID() + " onclick=\"return confirm"
                        + "('Are you sure you want to delete?')\">Delete</a>"
                        + "</td>");
                out.println("</tr>");
            }
            
            out.println("</tbody>");
            out.println("</table>");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
            out.println("</div>");
            out.println();
        %>         
        
                <!-- /. ROW  -->                

   
      
                
                
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
    
   
</body>
</html>