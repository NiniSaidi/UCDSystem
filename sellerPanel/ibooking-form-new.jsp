<%-- 
    Document   : ibooking-form-new
    Created on : Jun 13, 2022, 9:40:59 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Saurav">
        <title>Inspection Booking Form</title>
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
input {
  padding-left: 12px;
  width: 100%;
  font-size: 17px;
  border: 1px solid #dadfe3;
  border-radius: 5px;
}
input.invalid {
  background-color: #ffdddd;
}
.tab {
  display: none;
}

/* Make circles that indicate the steps of the form: */
.step {
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbbbbb;
  border: none;
  border-radius: 50%;
  display: inline-block;
  opacity: 0.5;
}

/* Mark the active step: */
.step.active {
  opacity: 1;
}

/* Mark the steps that are finished and valid: */
.step.finish {
  background-color: #04AA6D;
}
        </style>
    </head>
    
    <body>
        <div class="loader_bg">
         <div class="loader"><img src="<%=request.getContextPath()%>/resources/images/loading.gif" alt="#" /></div>
      </div>
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
      
      <div id="contact" style=" overflow:hidden; background-color: whitesmoke;width: auto; height: auto; background-image: url('<%=request.getContextPath()%>/resources/images/carstore.png')">
            <div style="padding: 10px; width: 60%" class="center">
                <br>
                <div class="container1 center">
                <div class="container2 col-md-8" style="margin-left: auto; margin-right: auto">
                 <h1 style="text-align: center; padding-top: 15px; font-size: 30px ">Inspection Booking Form</h1>
                 <form name="ibooking" class="form-group" id="ibooking" action="${pageContext.request.contextPath}/uploadImageForm" method="POST" enctype="multipart/form-data">
                     <fieldset style="padding: 10px">
                        <div class="tab">
                            <table style="border-collapse:separate; border-spacing:0 15px;">
                                <tr>
                                    <td><label for="sellerID"><b>Seller ID</b></label></td>
                                    <td><input type="text" name="sellerID" class="form-control" id="sellerID" placeholder="Seller ID" value="<%=sellerID%>" oninput="this.className = ''" readonly></td>
                                    <td><label for="inspectDate"><b>Inspection Date</b></label></td>
                                    <td><input type="date" name="inspectDate" class="form-control" id="inspectDate" oninput="this.className = ''" required></td>
                                </tr>
                                <tr>
                                    <td><label for="carID"><b>Car ID</b></label></td>
                                    <td><input type="text" name="carID" class="form-control" id="carID" placeholder="ABC1234" oninput="this.className = ''" required></td>
                                    <td><label for="carName"><b>Car Name</b></label></td>
                                    <td><input type="text" name="carName" class="form-control" id="carName" placeholder="Myvi Auto" oninput="this.className = ''" required></td>
                                </tr>
                                <tr>
                                    <td><label for="color"><b>Color </b></label></td>
                                    <td><input type="text" name="color" class="form-control" id="color" placeholder="White" oninput="this.className = ''" required></td>
                                    <td><label for="sellingPrice"><b>Selling Price</b></label></td>
                                    <td><input type="text" name="sellingPrice" class="form-control" id="sellingPrice" placeholder="17500" oninput="this.className = ''" required></td>
                                </tr>
                                <tr>
                                    <td><label for="conditions"><b>Conditions</b></label></td>
                                    <td><input type="text" name="conditions" class="form-control" id="conditions" placeholder="Air-cond in good condition" oninput="this.className = ''" required></td>
                                    <td><label for="id"><b>ID</b></label></td>
                                    <td><input type="text" name="id" class="form-control" id="id" placeholder="XX12345" oninput="this.className = ''" required></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab">
                            <table style="border-collapse:separate; border-spacing:0 15px;" class="center">
                                <tr>
                                    <td><label for="ownerName"><b>Owner Name</b></label></td>
                                    <td><input type="text" name="ownerName" class="form-control" id="ownerName" placeholder="Ali bin Ahmad" oninput="this.className = ''" required></td>
                                    <td><label for="ownerAddress"><b>Owner Address</b></label></td>
                                    <td><input type="text" name="ownerAddress" class="form-control" id="ownerAddress" placeholder="Tmn Sejati, Kuala Nerus, Trg" oninput="this.className = ''" required></td>
                                </tr>
                                <tr>
                                    <td><label for="engineNo"><b>Engine No</b></label></td>
                                    <td><input type="text" name="engineNo" class="form-control" id="engineNo" placeholder="123456" oninput="this.className = ''" required></td>
                                    <td><label for="chassisNo"><b>Chassis No</b></label></td>
                                    <td><input type="text" name="chassisNo" class="form-control" id="chassisNo" placeholder="123456" oninput="this.className = ''" required></td>
                                </tr>
                                <tr>
                                    <td><label for="madeBy"><b>Made By</b></label></td>
                                    <td><input type="text" name="madeBy" class="form-control" id="madeBy" placeholder="Perodua" oninput="this.className = ''" required></td>
                                    <td><label for="model"><b>Model</b></label></td>
                                    <td><input type="text" name="model" class="form-control" id="model" placeholder="Myvi M600 Auto" oninput="this.className = ''" required></td>
                                </tr>
                                <tr>
                                    <td><label for="engineCapacity"><b>Engine Capacity</b></label></td>
                                    <td><input type="text" name="engineCapacity" class="form-control" id="engineCapacity" placeholder="150" oninput="this.className = ''" required></td>
                                    <td><label for="fuelType"><b>Fuel Type</b></label></td>
                                    <td><input type="text" name="fuelType" class="form-control" id="fuelType" placeholder="Petrol" oninput="this.className = ''" required></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab">
                            <table style="border-collapse:separate; border-spacing:0 15px;" class="center">
                                <tr>
                                    <td><label for="originStatus"><b>Original Status</b></label></td>
                                    <td><input type="text" name="originStatus" class="form-control" id="originStatus" placeholder="Local Installation" oninput="this.className = ''" required></td>
                                    <td><label for="useClass"><b>Use Class</b></label></td>
                                    <td><input type="text" name="useClass" class="form-control" id="useClass" placeholder="Car" oninput="this.className = ''" required></td>
                                </tr>
                                <tr>
                                    <td><label for="bodyType"><b>Body Type</b></label></td>
                                    <td><input type="text" name="bodyType" class="form-control" id="bodyType" placeholder="Car" oninput="this.className = ''" required></td>
                                    <td><label for="yearMade"><b>Year Made</b></label></td>
                                    <td><input type="text" name="yearMade" class="form-control" id="yearMade" placeholder="2010" oninput="this.className = ''" required></td>
                                </tr>
                                <tr>
                                    <td><label for="regDate"><b>Registration Date</b></label></td>
                                    <td><input type="date" name="regDate" class="form-control" id="regDate" oninput="this.className = ''" required></td>
                                    <td><label for="bdm_bgk"><b>BDM / BGK</b></label></td>
                                    <td><input type="text" name="bdm_bgk" class="form-control" id="bdm_bgk" placeholder="-" oninput="this.className = ''" required></td>
                                </tr>
                                <tr>
                                    <td><label for="btm"><b>BTM</b></label></td>
                                    <td><input type="text" name="btm" class="form-control" id="btm" placeholder="-" oninput="this.className = ''" required></td>
                                    <td><label for="description"><b>Description</b></label></td>
                                    <td><input type="text" name="description" class="form-control" id="description" placeholder="Never involved in any major accident" oninput="this.className = ''" required></td>
                                </tr>
                            </table>
                        </div>
                        <div class="tab">
                             <table style="border-collapse:separate; border-spacing:0 15px;" class="center">
                                <tr>
                                    <td><label for="grantImage1"><b>Grant Image (Front)</b></label></td>
                                    <td><small id="username1" class="form-text text-muted">Maximum size: 1.5MB (png,jpeg,jpg)</small><input type="file" name="grantImage1"></td>
                                    <td><label for="grantImage2"><b>Grant Image (Back)</b></label></td>
                                    <td><small id="username1" class="form-text text-muted">Maximum size: 1.5MB (png,jpeg,jpg)</small><input type="file" name="grantImage2"></td>
                                </tr>
                                <tr>
                                    <td><label for="carImage1"><b>Car Image Front</b></label></td>
                                    <td><small id="username1" class="form-text text-muted">Maximum size: 1.5MB (png,jpeg,jpg)</small><input type="file" name="carImage1"></td>
                                    <td><label for="carImage2"><b>Car Image Back</b></label></td>
                                    <td><small id="username1" class="form-text text-muted">Maximum size: 1.5MB (png,jpeg,jpg)</small><input type="file" name="carImage2"></td>
                                </tr>
                                <tr>
                                    <td><label for="carImage3"><b>Car Image Side</b></label></td>
                                    <td><small id="username1" class="form-text text-muted">Maximum size: 1.5MB (png,jpeg,jpg)</small><input type="file" name="carImage3"></td>
                                    <td><label for="carImage4"><b>Car Image Interior</b></label></td>
                                    <td><small id="username1" class="form-text text-muted">Maximum size: 1.5MB (png,jpeg,jpg)</small><input type="file" name="carImage4"></td>
                                </tr>
                                <tr>
                                    <td><label for="carImage5"><b>Car Image Engine</b></label></td>
                                    <td><small id="username1" class="form-text text-muted">Maximum size: 1.5MB (png,jpeg,jpg)</small><input type="file" name="carImage5"></td>
                                    
                                    <td><input type="hidden" name="bookingStatus" class="form-control" id="bookingStatus" placeholder="Pending" value="Pending" readonly></td>
                                </tr>
                            </table>
                        </div>
                            
         <!--               <div style=" text-align: center">
                            <button type="submit" class="button button1">Book Now</button>
                        <button type="button" class="button button1" onclick="window.location='<%=request.getContextPath()%>/sellerPanel/sellerDashboard.jsp'">Cancel</button>
        -->                
                        
                          <div style="overflow:auto;">
                            <div style="float:right;">
                                <button type="button" class="button button1" id="prevBtn" onclick="nextPrev(-1)">Previous</button>
                                <button type="button" class="button button1" id="nextBtn" onclick="nextPrev(1)">Next</button>
                            </div>
                          </div>
                        <div style="text-align:center;margin-top:10px;">
                            <span class="step"></span>
                            <span class="step"></span>
                            <span class="step"></span>
                            <span class="step"></span>
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
      <!-- Javascript files-->
      <script>
          var currentTab = 0; // Current tab is set to be the first tab (0)
showTab(currentTab); // Display the current tab

function showTab(n) {
  // This function will display the specified tab of the form ...
  var x = document.getElementsByClassName("tab");
  x[n].style.display = "block";
  // ... and fix the Previous/Next buttons:
  if (n == 0) {
    document.getElementById("prevBtn").style.display = "none";
  } else {
    document.getElementById("prevBtn").style.display = "inline";
  }
  if (n == (x.length - 1)) {
    document.getElementById("nextBtn").innerHTML = "Submit";
  } else {
    document.getElementById("nextBtn").innerHTML = "Next";
  }
  // ... and run a function that displays the correct step indicator:
  fixStepIndicator(n);
}

function nextPrev(n) {
  // This function will figure out which tab to display
  var x = document.getElementsByClassName("tab");
  // Exit the function if any field in the current tab is invalid:
  if (n == 1 && !validateForm()) return false;
  // Hide the current tab:
  x[currentTab].style.display = "none";
  // Increase or decrease the current tab by 1:
  currentTab = currentTab + n;
  // if you have reached the end of the form... :
  if (currentTab >= x.length) {
    //...the form gets submitted:
    document.getElementById("ibooking").submit();
    return false;
  }
  // Otherwise, display the correct tab:
  showTab(currentTab);
}

function validateForm() {
  // This function deals with validation of the form fields
  var x, y, i, valid = true;
  x = document.getElementsByClassName("tab");
  y = x[currentTab].getElementsByTagName("input");
  // A loop that checks every input field in the current tab:
  for (i = 0; i < y.length; i++) {
    // If a field is empty...
    if (y[i].value == "") {
      // add an "invalid" class to the field:
      y[i].className += " invalid";
      // and set the current valid status to false:
      valid = false;
    }
  }
  // If the valid status is true, mark the step as finished and valid:
  if (valid) {
    document.getElementsByClassName("step")[currentTab].className += " finish";
  }
  return valid; // return the valid status
}

function fixStepIndicator(n) {
  // This function removes the "active" class of all steps...
  var i, x = document.getElementsByClassName("step");
  for (i = 0; i < x.length; i++) {
    x[i].className = x[i].className.replace(" active", "");
  }
  //... and adds the "active" class to the current step:
  x[n].className += " active";
}
      </script>
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
