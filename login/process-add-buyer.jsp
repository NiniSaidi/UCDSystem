<%-- 
    Document   : process-add-buyer
    Created on : May 15, 2022, 6:36:22 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.BuyerDAO" %>
<jsp:useBean id="buyer" class="com.UCDSystem.Buyer" scope="request"/>
<jsp:setProperty name="buyer" property="*"/>
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
            int result = buyerDao.addBuyer(buyer);
            out.println("");
            
            if (result > 0)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Your account successfully registered. You will be redirected to login page.\")");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("buyerLogin.jsp");
                rd.include(request, response);
            }
            database.closeConnection();
        %>
    </body>
</html>
