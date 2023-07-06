<%-- 
    Document   : dealerDashboard
    Created on : Mar 20, 2022, 9:39:48 AM
    Author     : User
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.UCDSystem.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
       .shadowdiv {
  box-shadow: 5px 5px #888888;
}
   </style>
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
                <a class="navbar-brand" href="<%=request.getContextPath()%>/dealerPanel/dealerDashboard.jsp">DEALER PANEL</a> 
            </div>
            <c:set var = "now" value = "<%= new java.util.Date()%>" />
  <div style="color: white;padding: 15px 50px 5px 50px;float: right;
font-size: 16px;"> <fmt:formatDate type = "both" dateStyle = "medium" timeStyle = "medium" value = "${now}" /> &nbsp; <a href="<%=request.getContextPath()%>/login/dealerLogin.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
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
                        <a class="active-menu"  href="<%=request.getContextPath()%>/dealerPanel/dealerDashboard.jsp"><i class="fa fa-dashboard fa-2x"></i> Dashboard</a>
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
                                <a href="<%=request.getContextPath()%>/dealerPanel/process-view-car.jsp">Car List</a>
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
        
        <%
            Connection cn = DBConnection.getConnection();
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select count(*) from inspectionbooking where bookingStatus = 'Pending'");
            String count = "0";
            while (rs.next()){
                count = rs.getString(1);
            }
            
            ResultSet rs2 = st.executeQuery("select count(*) from inspectionbooking where bookingStatus = 'Approved'");
            String count2 = "0";
            while (rs2.next()){
                count2 = rs2.getString(1);
            }
            
            ResultSet rs3 = st.executeQuery("select count(*) from inspectionbooking where bookingStatus = 'Completed'");
            String count3 = "0";
            while (rs3.next()){
                count3 = rs3.getString(1);
            }
            
            ResultSet rs4 = st.executeQuery("select count(*) from testdrivebooking where bookingStatus = 'Pending'");
            String count4 = "0";
            while (rs4.next()){
                count4 = rs4.getString(1);
            }
            
            ResultSet rs5 = st.executeQuery("select count(*) from testdrivebooking where bookingStatus = 'Approved'");
            String count5 = "0";
            while (rs5.next()){
                count5 = rs5.getString(1);
            }
            
            ResultSet rs6 = st.executeQuery("select count(*) from testdrivebooking where bookingStatus = 'Completed'");
            String count6 = "0";
            while (rs6.next()){
                count6 = rs6.getString(1);
            }
            
            ResultSet rs7 = st.executeQuery("select count(*) from seller");
            String count7 = "0";
            while (rs7.next()){
                count7 = rs7.getString(1);
            }
            
            ResultSet rs8 = st.executeQuery("select count(*) from buyer");
            String count8 = "0";
            while (rs8.next()){
                count8 = rs8.getString(1);
            }
            
            ResultSet rs9 = st.executeQuery("select count(*) from car where carStatus = 'Available'");
            String count9 = "0";
            while (rs9.next()){
                count9 = rs9.getString(1);
            }
            
            ResultSet rs10 = st.executeQuery("select count(*) from car where carStatus = 'Under Maintenance'");
            String count10 = "0";
            while (rs10.next()){
                count10 = rs10.getString(1);
            }
            
            ResultSet rs11 = st.executeQuery("select count(*) from car where carStatus = 'Booked'");
            String count11 = "0";
            while (rs11.next()){
                count11 = rs11.getString(1);
            }


        %>
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Dealer Dashboard</h2>
                        <%
                            if (dealerid!= null){
                               out.println("<h5>Welcome Dealer "+fname+", Love to see you back. </h5>");
                            }
                        %>
                    </div>
                </div>              
                 <!-- /. ROW  -->
                <hr />
                <div class="row" style="text-align: center"><h3 style="color: black"><b>INSPECTION BOOKING</b></h3><br>
                    <div class=" col-md-4 col-sm-6 col-xs-6">           
			<div class="shadowdiv panel panel-back noti-box">
                            <span class="icon-box bg-color-red set-icon">
                                <i class="fa fa-wpforms"></i>
                            </span>
                            <div class="text-box" >
                                <p class="main-text" style=" font-size: 50px"><%=count%></p>
                                <p class="text-muted">Pending</p>
                            </div>
                        </div>
		     </div>
                    <div class=" col-md-4 col-sm-6 col-xs-6">           
			<div class="shadowdiv panel panel-back noti-box">
                            <span class="icon-box bg-color-green set-icon">
                                <i class="fa fa-list-alt"></i>
                            </span>
                            <div class="text-box" >
                                <p class="main-text" style=" font-size: 50px"><%=count2%></p>
                                <p class="text-muted">Approved</p>
                            </div>
                         </div>
		     </div>
                    <div class=" col-md-4 col-sm-6 col-xs-6">           
			<div class="shadowdiv panel panel-back noti-box">
                            <span class="icon-box bg-color-blue set-icon">
                                <i class="fa fa-calendar-check-o"></i>
                            </span>
                            <div class="text-box" >
                                <p class="main-text" style=" font-size: 50px"><%=count3%></p>
                                <p class="text-muted">Completed</p>
                            </div>
                         </div>
		     </div>
		</div>
                
                 <!-- /. ROW  -->
                <hr />  
                <div class="row" style="text-align: center"><h3 style="color: black"><b>TEST DRIVE BOOKING</b></h3><br>
                    <div class=" col-md-4 col-sm-6 col-xs-6">           
			<div class="shadowdiv panel panel-back noti-box">
                            <span class="icon-box bg-color-red set-icon">
                                <i class="fa fa-wpforms"></i>
                            </span>
                            <div class="text-box" >
                                <p class="main-text" style=" font-size: 50px"><%=count4%></p>
                                <p class="text-muted">Pending</p>
                            </div>
                        </div>
		     </div>
                    <div class=" col-md-4 col-sm-6 col-xs-6">           
			<div class="shadowdiv panel panel-back noti-box">
                            <span class="icon-box bg-color-green set-icon">
                                <i class="fa fa-list-alt"></i>
                            </span>
                            <div class="text-box" >
                                <p class="main-text" style=" font-size: 50px"><%=count5%></p>
                                <p class="text-muted">Approved</p>
                            </div>
                         </div>
		     </div>
                    <div class=" col-md-4 col-sm-6 col-xs-6">           
			<div class="shadowdiv panel panel-back noti-box">
                            <span class="icon-box bg-color-blue set-icon">
                                <i class="fa fa-calendar-check-o"></i>
                            </span>
                            <div class="text-box" >
                                <p class="main-text" style=" font-size: 50px"><%=count6%></p>
                                <p class="text-muted">Completed</p>
                            </div>
                         </div>
		     </div>
		</div>
                 <!-- /. ROW  -->
                 <hr/>
                <div class="row" style="text-align: center"><h3 style="color: black"><b>CAR STATUS</b></h3><br>
                    
                    <div class="col-md-4 col-sm-6 col-xs-6" style="">                       
                        <div class="shadowdiv panel panel-primary text-center no-boder">
                            <div class="panel-body">
                                <i class="fa fa-car fa-5x"></i>
                                <h3><%=count9%></h3>
                            </div>
                            <div class="panel-footer">
                               Available
                            </div>
                        </div>                       
                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-6" >                       
                        <div class="shadowdiv panel panel-primary text-center no-boder">
                            <div class="panel-body">
                                <i class="fa fa-cogs fa-5x"></i>
                                <h3><%=count10%></h3>
                            </div>
                            <div class="panel-footer">
                               Under Maintenance
                            </div>
                        </div>                       
                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-6"  style="">
                        <div class="shadowdiv panel panel-primary text-center no-boder">
                            <div class="panel-body">
                                <i class="fa fa-bookmark-o fa-5x"></i>
                                <h3><%=count11%></h3>
                            </div>
                            <div class="panel-footer">
                                Booked
                            </div>
                        </div>                         
                    </div>
                
                </div>
                
                 <!-- /. ROW  -->
                <hr/>
                <div class="row" style="text-align: center"><h3 style="color: black"><b>USER ACCOUNT</b></h3><br>
                    
                    <div class="col-md-4 col-sm-6 col-xs-6" style=" margin-left: 20%">                       
                        <div class="panel panel-primary text-center no-boder bg-color-green">
                            <div class="panel-body">
                                <i class="fa fa-user-circle-o fa-5x"></i>
                                <h3><%=count7%> USERS</h3>
                            </div>
                            <div class="panel-footer back-footer-red">
                               Seller Account
                            </div>
                        </div>                       
                    </div>
                    <div class="col-md-4 col-sm-6 col-xs-6">
                        <div class="panel panel-primary text-center no-boder bg-color-blue">
                            <div class="panel-body">
                                <i class="fa fa-user-circle fa-5x"></i>
                                <h3><%=count8%> USERS</h3>
                            </div>
                            <div class="panel-footer back-footer-red">
                                Buyer Account
                            </div>
                        </div>                         
                    </div>
                
                </div>
                 <!-- /. ROW  -->
                   
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
     <!-- MORRIS CHART SCRIPTS -->
     <script src="<%=request.getContextPath()%>/resources/js/jsdashboard/morris/raphael-2.1.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/jsdashboard/morris/morris.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="<%=request.getContextPath()%>/resources/js/jsdashboard/custom.js"></script>
    
   
</body>
</html>
