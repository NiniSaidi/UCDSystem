<%-- 
    Document   : clientForm
    Created on : Jan 2, 2022, 10:47:13 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Saurav">
        <link href="<%=request.getContextPath()%>/resources/css/css1/bootstrap.min.css" rel="stylesheet">
        <title>Seller Account Registration Form</title>
    </head>
    
    <body class="bg-light">
        
        <div class="container">
            <div class="py-5 text-center">
               <h2><b>EPICU TRADING</b></h2>
               <h3>Seller Account Registration Form</h3>
             </div>
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-md-8" style="margin-left: auto; margin-right: auto">
                    <form name="sellerform" id="clientform" action="process-add-seller.jsp" method="POST">
                        <div class="form-group">
                            <label for="sellerID">ID</label>
                            <input type="text" name="sellerID" class="form-control" id="" placeholder="800111115059" required>
                            <small id="username1" class="form-text text-muted">Insert your IC no. This ID will be your Seller ID.</small>
                        </div>
                        
                        <div class="form-group">
                            <label for="firstname">First Name</label>
                            <input type="text" name="sellerFirstName" class="form-control" id="" placeholder="Ahmad" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="lastname">Last Name</label>
                            <input type="text" name="sellerLastName" class="form-control" id="" placeholder="Abdullah" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="phoneno">Phone No</label>
                            <input type="text" name="sellerPhoneNo" class="form-control" id="" placeholder="0123456789" required>
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" name="sellerEmail" class="form-control" id="exampleInputEmail1" placeholder="ahmad@email.com" aria-describedby="emailHelp">
                            <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>

                        <div class="form-group">
                            <label for="address">Address </label>
                            <input type="text" name="sellerAddress" class="form-control" id="address" placeholder="Address" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="password">Password</label>
                            <input type="password" name="sellerPw" class="form-control" id="password" placeholder="" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="userCode"></label>
                            <input type="hidden" name="userCode" class="form-control" id="usercode" value="2" required>
                        </div>
                        
                        <hr class="mb-4">
                        <button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>
                        <button type="button" class="btn btn-primary btn-lg btn-block" onclick="window.location='<%=request.getContextPath()%>/login/userLogin.jsp'">Cancel</button>
                    </form>
                </div>
            </div>
             <footer class="my-5 pt-5 text-muted text-center text-small">
               <p class="mb-1">&copy; 2022 Epicu Trading</p>
               <ul class="list-inline">
                 <li class="list-inline-item"><a href="#">Privacy</a></li>
                 <li class="list-inline-item"><a href="#">Terms</a></li>
                 <li class="list-inline-item"><a href="#">Support</a></li>
               </ul>
             </footer>
        </div>
</body>
</html>
