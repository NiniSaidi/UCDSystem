<%-- 
    Document   : process-view-client2
    Created on : Jan 21, 2022, 12:41:18 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*, com.UCDSystem.Client, com.UCDSystem.ClientDAO, com.UCDSystem.DBConnection" %>
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
<%
        String clientID = request.getParameter("clientID");
        DBConnection database = new DBConnection();
        
        Class.forName("com.mysql.jdbc.Driver");
        String myURL = "jdbc:mysql://localhost:3306/usedcardealersystem";
        Connection cn = DriverManager.getConnection(myURL, "root", "admin");
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from client where clientID = '"+clientID+"'");
        
        database.closeConnection();
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
                <a class="navbar-brand" href="<%=request.getContextPath()%>/dealerPanel/dealerDashboard.jsp">DEALER PANEL</a> 
            </div>
            <c:set var = "now" value = "<%= new java.util.Date()%>" />
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> <fmt:formatDate type = "both" dateStyle = "medium" timeStyle = "medium" value = "${now}" /> &nbsp; <a href="<%=request.getContextPath()%>/login/ownerLogin.jsp" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="<%=request.getContextPath()%>/resources/images/find_user.png" class="user-image img-responsive"/>
					</li>
				
					
                    <li>
                        <a href="<%=request.getContextPath()%>/dealerPanel/dealerDashboard.jsp"><i class="fa fa-dashboard fa-2x"></i> Dashboard</a>
                    </li>
                    
                    <li>
                        <a  href="#"><i class="fa fa-user fa-2x"></i> Customer Account List</a>
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
                    
                    <li>
                        <a  href="#"><i class="fa fa-cogs fa-2x"></i> Settings</a>
                    </li>
                    
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>View Client Profile</h2>   
                        
                    </div>
                </div>              

                                 <!-- /. ROW  -->
                 <hr />
                       
                 
        <div class="row">
                <div class="col-md-8" style="margin-left: auto; margin-right: auto">
                    <form name="clientform" id="clientform" action="" method="POST">
                        <% while (rs.next()) {%>
                        <div class="form-group">
                            <label for="clientID">Client ID</label>
                            <input type="text" name="clientID" class="form-control" id="" value="<%=rs.getString("clientID") %>" readonly>
                        </div>
                        
                        <div class="form-group">
                            <label for="firstname">First Name</label>
                            <input type="text" name="clientFirstName" class="form-control" id="" value="<%=rs.getString("clientFirstName") %>" readonly>
                        </div>
                        
                        <div class="form-group">
                            <label for="lastname">Last Name</label>
                            <input type="text" name="clientLastName" class="form-control" id="" value="<%=rs.getString("clientLastName") %>" readonly>
                        </div>
                        
                        <div class="form-group">
                            <label for="phoneno">Phone No</label>
                            <input type="text" name="clientPhoneNo" class="form-control" id="" value="<%=rs.getString("clientPhoneNo") %>" readonly>
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" name="clientEmail" class="form-control" id="exampleInputEmail1" value="<%=rs.getString("clientEmail") %>" aria-describedby="emailHelp" readonly>
                            
                        </div>

                        <div class="form-group">
                            <label for="address">Address </label>
                            <input type="text" name="clientAddress" class="form-control" id="address" value="<%=rs.getString("clientAddress") %>" readonly>
                        </div>
                        
                        <%}%>
                        <hr class="mb-4">
                        <button type="button" class="button button1" onclick="window.location.href = 'process-view-client.jsp';return false;">Back</button>
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

