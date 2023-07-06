<%-- 
    Document   : process-add-user
    Created on : Jun 8, 2022, 11:20:48 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.BuyerDAO, com.UCDSystem.SellerDAO, com.UCDSystem.UserDAO" %>
<jsp:useBean id="buyer" class="com.UCDSystem.Buyer" scope="request"/>
<jsp:setProperty name="buyer" property="*"/>
<jsp:useBean id="seller" class="com.UCDSystem.Seller" scope="request"/>
<jsp:setProperty name="seller" property="*"/>
<jsp:useBean id="user" class="com.UCDSystem.User" scope="request"/>
<jsp:setProperty name="user" property="*"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Buyer Record</title>
    </head>
    <body>
        <%
            DBConnection database = new DBConnection();
            BuyerDAO buyerDao = new BuyerDAO();
            SellerDAO sellerDao = new SellerDAO();
            int userType = Integer.parseInt(request.getParameter("userType"));
            
            int result = 0;
            if (userType == 1){
                result = buyerDao.addBuyer(buyer);
            }
            else if (userType == 2){
                result = sellerDao.addSeller(seller);
            }
            out.println("");
            
            if (result > 0)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Your account successfully registered. You will be redirected to login page.\")");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("userLogin.jsp");
                rd.include(request, response);
            }
            database.closeConnection();
        %>
    </body>
</html>
