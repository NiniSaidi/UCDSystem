<%-- 
    Document   : adminDashboard
    Created on : Jan 2, 2022, 11:33:20 PM
    Author     : User
--%>

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
       td{
           padding-right: 10px
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
  <div style="color: white; padding: 15px 50px 5px 50px;float: right; font-size: 16px;"> <fmt:formatDate type = "both" dateStyle = "medium" timeStyle = "medium" value = "${now}" /> &nbsp; <a href="<%=request.getContextPath()%>/login/dealerLogin.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
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
                                <a class="active-menu" href="<%=request.getContextPath()%>/dealerPanel/add-car-form.jsp">New Car Form</a>
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
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Add Car Information Form</h2>   
                    </div>
                </div>              
                
                 <div>
                     
                     <div class="row">
                        <div class="col-md-12">
                            <form name="carform" id="carform" action="${pageContext.request.contextPath}/uploadImage" method="POST" enctype="multipart/form-data">
                                <fieldset style="padding: 10px">
                                    <table style="border-collapse:separate; border-spacing:0 15px;">
                                        <tr>
                                            <td><label for="carID">Car ID: </label></td>
                                            <td><input type="text" name="carID" class="form-control" id="" placeholder="WUA9601" required></td>
                                            <td><label for="carName">Car Name: </label></td>
                                            <td><input type="text" name="carName" class="form-control" id="" placeholder="Myvi" required></td>
                                            <td><label for="carStatus">Car Status: </label></td>
                                            <td>
                                                <select name="carStatus" id="carStatus" class="form-control">
                                                    <option value="Select">Select Status</option>
                                                    <option value="Available">Available</option>
                                                    <option value="Under Maintenance">Under Maintenance</option>
                                                    <option value="Booked">Booked</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><label for="color">Color</label></td>
                                            <td><input type="text" name="color" class="form-control" id="" placeholder="Black" required></td>
                                            <td><label for="sellingPrice">Selling Price</label></td>
                                            <td><input type="text" name="sellingPrice" class="form-control" id="" placeholder="17500" required></td>
                                            <td><label for="conditions">Condition</label></td>
                                            <td><input type="text" name="conditions" class="form-control" id="" placeholder="Good running condition" required></td>
                                        </tr>
                                        <tr>
                                            <td><label for="idno">ID No.</label></td>
                                            <td><input type="text" name="id" class="form-control" id="" placeholder="XX123456" required></td>
                                            <td><label for="ownerName">Owner Name</label></td>
                                            <td><input type="text" name="ownerName" class="form-control" id="" placeholder="Ali bin Ahmad" required></td>
                                            <td><label for="ownerAddress">Owner Address</label></td>
                                            <td><input type="text" name="ownerAddress" class="form-control" id="" placeholder="Tmn Sejati, Kuala Nerus, Trg" required></td>
                                        </tr>
                                        <tr>
                                            <td><label for="engineNo">Engine No.</label></td>
                                            <td><input type="text" name="engineNo" class="form-control" id="" placeholder="123456" required></td>
                                            <td><label for="chassisNo">Chassis No.</label></td>
                                            <td><input type="text" name="chassisNo" class="form-control" id="" placeholder="123456" required></td>
                                            <td><label for="madeBy">Made By</label></td>
                                            <td><input type="text" name="madeBy" class="form-control" id="" placeholder="Perodua" required></td>
                                        </tr>
                                        <tr>
                                            <td><label for="model">Model</label></td>
                                            <td><input type="text" name="model" class="form-control" id="" placeholder="Myvi SE Auto" required></td>
                                            <td><label for="engineCapacity">Engine Capacity</label></td>
                                            <td><input type="text" name="engineCapacity" class="form-control" id="" placeholder="150" required></td>
                                            <td><label for="fuelType">Fuel Type</label></td>
                                            <td><input type="text" name="fuelType" class="form-control" id="" placeholder="Petrol" required></td>
                                        </tr>
                                        <tr>
                                            <td><label for="originStatus">Original Car Status</label></td>
                                            <td><input type="text" name="originStatus" class="form-control" id="" placeholder="Local Installation" required></td>
                                            <td><label for="useClass">Use Class</label></td>
                                            <td><input type="text" name="useClass" class="form-control" id="" placeholder="Car" required></td>
                                            <td><label for="bodyType">Body Type</label></td>
                                            <td><input type="text" name="bodyType" class="form-control" id="" placeholder="Car" required></td>
                                        </tr>
                                        <tr>
                                            <td><label for="yearMade">Year Made</label></td>
                                            <td><input type="text" name="yearMade" class="form-control" id="" placeholder="1965" required></td>
                                            <td><label for="regDate">Registration Date</label></td>
                                            <td><input type="date" name="regDate" class="form-control" id="" placeholder="11/05/1965" required></td>
                                            <td><label for="bdm_bgk">BDM / BGK</label></td>
                                            <td><input type="text" name="bdm_bgk" class="form-control" id="" placeholder=" - " required></td>
                                        </tr>
                                        <tr>
                                            <td><label for="btm">BTM</label></td>
                                            <td><input type="text" name="btm" class="form-control" id="" placeholder=" - " required></td>
                                            <td><label for="description">Description</label></td>
                                            <td><input type="text" name="description" class="form-control" id="" placeholder="Can change ownership name" required></td>
                                        </tr>
                                    </table>
                                    <table style="border-collapse:separate; border-spacing:0 15px;">
                                        <tr>
                                            <td><label for="grantImage1"><strong>Front Car Grant Image</strong></label>
                                                <small id="username1" class="form-text text-muted">Maximum size: 1.5MB (png,jpeg,jpg)</small></td>
                                            <td><input type="file" name="grantImage1"></td>
                                            <td><label for="grantImage2"><strong>Back Car Grant Image</strong></label>
                                                <small id="username1" class="form-text text-muted">Maximum size: 1.5MB (png,jpeg,jpg)</small></td>
                                            <td><input type="file" name="grantImage2"></td>
                                        </tr>
                                        <tr>
                                            <td><label for="image1"><strong>Car Image 1</strong></label>
                                                <small id="username1" class="form-text text-muted">Maximum size: 1.5MB (png,jpeg,jpg)</small></td>
                                            <td><input type="file" name="image1"></td>
                                            <td><label for="image1"><strong>Car Image 2</strong></label>
                                                <small id="username1" class="form-text text-muted">Maximum size: 1.5MB (png,jpeg,jpg)</small></td>
                                            <td><input type="file" name="image2"></td>
                                        </tr>
                                        <tr>
                                            <td><label for="image1"><strong>Car Image 3</strong></label>
                                                <small id="username1" class="form-text text-muted">Maximum size: 1.5MB (png,jpeg,jpg)</small></td>
                                            <td><input type="file" name="image3"></td>
                                            <td><label for="image1"><strong>Car Image 4</strong></label>
                                                <small id="username1" class="form-text text-muted">Maximum size: 1.5MB (png,jpeg,jpg)</small></td>
                                            <td><input type="file" name="image4"></td>
                                        </tr>
                                        <tr>
                                            <td><label for="image1"><strong>Car Image 5</strong></label>
                                                <small id="username1" class="form-text text-muted">Maximum size: 1.5MB (png,jpeg,jpg)</small></td>
                                            <td><input type="file" name="image5"></td>
                                        </tr>
                                    </table>

                                <hr class="mb-4">
                                <button type="submit" style="margin-left: 40%">Submit</button>
                                <button type="button" onclick="window.location.href = 'dealerDashboard.jsp';return false;">Cancel</button>
                                </fieldset>
                            </form>
                        </div>
                    </div>

                     
                 </div>
                 <!-- /. car form  -->
                               
                          
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