<%-- 
    Document   : process-update-car
    Created on : Jan 19, 2022, 3:39:16 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="java.sql.*, com.UCDSystem.Car, com.UCDSystem.ClientDAO, com.UCDSystem.DBConnection" %>
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
                                <a  class="active-menu" href="<%=request.getContextPath()%>/dealerPanel/process-view-car.jsp">Car List</a>
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
                    <div class="col-md-12">
                     <h2>View Car List</h2>   
                        <h5>List of all car registered in the system. </h5>
                    </div>
                </div>  
                                 <!-- /. ROW  -->
                 <hr />
               
              <div class="row">
                <div class="col-md-8" style="margin-left: auto; margin-right: auto">
                    <form name="carform" id="carform" action="<%=request.getContextPath()%>/dealerPanel/process-update-car2.jsp" method="POST">
                        
                        <div class="form-group">
                            <label for="carID">Car ID</label>
                            <input type="text" name="carID" class="form-control" id="" value="<c:out value="${updateCar.carID}"/>" readonly>
                        </div>
                        
                        <div class="form-group">
                            <label for="carName">Car Name</label>
                            <input type="text" name="carName" class="form-control" id="" value="<c:out value="${updateCar.carName}"/>" readonly>
                        </div>
                        
                        <c:choose>
                            <c:when test="${updateCar.carStatus == 'Available'}">
                                <c:set var="option1" value="selected"></c:set>
                            </c:when>
                            <c:when test="${updateCar.carStatus == 'Under Maintenance'}">
                                <c:set var="option2" value="selected"></c:set>
                            </c:when>
                            <c:when test="${updateCar.carStatus == 'Booked'}">
                                <c:set var="option3" value="selected"></c:set>
                            </c:when>
                        </c:choose>
                        
                        <div class="form-group">
                           <label for="carStatus">Car Status</label><br>
                           <select name="carStatus" id="carStatus">
                                <option>Select Status</option>
                                <option <c:out value="${option1}"/>>Available</option>
                                <option <c:out value="${option2}"/>>Under Maintenance</option>
                                <option <c:out value="${option3}"/>>Booked</option>
                            </select>
                        </div>
                        
                        <div class="form-group">
                            <label for="color">Color</label>
                            <input type="text" name="color" class="form-control" id="" value="<c:out value="${updateCar.color}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="sellingPrice">Selling Price</label>
                            <input type="text" name="sellingPrice" class="form-control" id="" value="<c:out value="${updateCar.sellingPrice}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="conditions">Condition</label>
                            <input type="text" name="conditions" class="form-control" id="" value="<c:out value="${updateCar.conditions}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="id">ID No.</label>
                            <input type="text" name="id" class="form-control" id="" value="<c:out value="${updateCar.id}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="ownerName">Owner Name</label>
                            <input type="text" name="ownerName" class="form-control" id="" value="<c:out value="${updateCar.ownerName}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="ownerAddress">Owner Address</label>
                            <input type="text" name="ownerAddress" class="form-control" id="" value="<c:out value="${updateCar.ownerAddress}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="engineNo">Engine No.</label>
                            <input type="text" name="engineNo" class="form-control" id="" value="<c:out value="${updateCar.engineNo}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="chassisNo">Chassis No.</label>
                            <input type="text" name="chassisNo" class="form-control" id="" value="<c:out value="${updateCar.chassisNo}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="madeBy">Made By</label>
                            <input type="text" name="madeBy" class="form-control" id="" value="<c:out value="${updateCar.madeBy}"/>">
                        </div>
                            
                        <div class="form-group">
                            <label for="model">Model</label>
                            <input type="text" name="model" class="form-control" id="" value="<c:out value="${updateCar.model}"/>">
                        </div>

                        <div class="form-group">
                            <label for="engineCapacity">Engine Capacity</label>
                            <input type="text" name="engineCapacity" class="form-control" id="" value="<c:out value="${updateCar.engineCapacity}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="fuelType">Fuel Type</label>
                            <input type="text" name="fuelType" class="form-control" id="" value="<c:out value="${updateCar.fuelType}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="originStatus">Original Car Status</label>
                            <input type="text" name="originStatus" class="form-control" id="" value="<c:out value="${updateCar.originStatus}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="useClass">Use Class</label>
                            <input type="text" name="useClass" class="form-control" id="" value="<c:out value="${updateCar.useClass}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="bodyType">Body Type</label>
                            <input type="text" name="bodyType" class="form-control" id="" value="<c:out value="${updateCar.bodyType}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="yearMade">Year Made</label>
                            <input type="text" name="yearMade" class="form-control" id="" value="<c:out value="${updateCar.yearMade}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="regDate">Registration Date</label>
                            <input type="date" name="regDate" class="form-control" id="" value="<c:out value="${updateCar.regDate}"/>">
                        </div>
                                    
                        <div class="form-group">
                            <label for="bdm_bgk">BDM / BGK</label>
                            <input type="text" name="bdm_bgk" class="form-control" id="" value="<c:out value="${updateCar.bdm_bgk}"/>">
                        </div>
                                    
                        <div class="form-group">
                            <label for="btm">BTM</label>
                            <input type="text" name="btm" class="form-control" id="" value="<c:out value="${updateCar.btm}"/>">
                        </div>
                        
                        <div class="form-group">
                            <label for="description">Description</label>
                            <input type="text" name="description" class="form-control" id="" value="<c:out value="${updateCar.description}"/>">
                        </div>
                        
                        <hr class="mb-4">
                        <button type="submit" class="button button1" >Update</button>
                        <button type="button" class="button button1" onclick="window.location.href = 'process-view-car.jsp';return false;">Cancel</button>
                    </form>
                </div>
            </div>      
        
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
