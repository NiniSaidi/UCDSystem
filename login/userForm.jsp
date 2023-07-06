<%-- 
    Document   : userForm
    Created on : Jun 2, 2022, 9:49:17 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=request.getContextPath()%>/resources/css/css1/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
        <title>User Account Registration Form</title>
        <style>
.container1{
                background: #f1f7fc;
               padding: 80px 0 ;
}
.container{
display: table;
max-width: 1000px;
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
  padding: 16px 32px;
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
    <body>
         <div class="container1">
             <h1 class="centered">
                        <a href="<%=request.getContextPath()%>/index.jsp" style="color: white; text-decoration: none;"><b>EPICU TRADING</b></a>
                    </h1>
             <div class="container col-md-6" style="">
                 <h1 style="text-align: center; padding-top: 15px">New Account Registration Form</h1>
                 <form name="buyerform" class="form-group" id="buyerform" action="process-add-user.jsp" method="POST">
                    <fieldset style="padding: 15px">

                        <table style="border-collapse:separate; border-spacing:0 15px;" class="center">
                            <tr>
                                <td><label class="control-label"><b>Account Type </b></label></td>
                                <td><input type="radio" name="userType" value="1" class="radio-button"> Buyer
                                    <input type="radio" name="userType" value="2" class="radio-button"> Seller</td>
                                <td><label class="control-label col-sm-4"></label></td>
                                <td><label><b>ID </b></label></td>
                                <td><input type="text" name="buyerID" class="form-control" id="" placeholder="IC Number" required/>
                            </tr>
                            <tr>
                                <td><label for="firstname"><b>First Name</b></label></td>
                                <td><input type="text" name="buyerFirstName" class="form-control" id="" placeholder="Ahmad" required></td>
                                <td><label></label></td>
                                <td><label for="lastname"><b>Last Name</b></label></td>
                                <td><input type="text" name="buyerLastName" class="form-control" id="" placeholder="Abdullah" required></td>
                            </tr>
                            <tr>
                                <td><label for="phoneno"><b>Phone No</b></label></td>
                                <td><input type="text" name="buyerPhoneNo" class="form-control" id="" placeholder="0123456789" required></td>
                                <td><label></label></td>
                                <td><label for="email"><b>Email</b></label></td>
                                <td><input type="email" name="buyerEmail" class="form-control" id="exampleInputEmail1" placeholder="ahmad@email.com" aria-describedby="emailHelp">
                                    
                            </tr>
                            <tr>
                                <td><label for="address"><b>Address </b></label></td>
                                <td><input type="text" name="buyerAddress" class="form-control" id="address" placeholder="Address" required></td>
                                <td><label></label></td>
                                <td><label for="password"><b>Password</b></label></td>
                                <td><input type="password" name="buyerPw" class="form-control" id="password" placeholder="Minimum 8 character" required></td>
                            </tr>
                            <tr>
                                <td><label for="userCode"></label></td>
                                <td><input type="hidden" name="userCode" class="form-control" id="usercode" value="1" required></td>
                            </tr>
                        </table>
                        <div style=" text-align: center">
                            <button type="submit" class="button button1">Register</button>
                         <button type="button" class="button button1" onclick="history.back()">Cancel</button>
                        </div>
                        
                       </fieldset>
                    </form>
             </div>
            
        </div>
                    
    </body>
</html>
