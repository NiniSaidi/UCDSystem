<%-- 
    Document   : process-add-seller
    Created on : May 15, 2022, 6:37:00 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.SellerDAO" %>
<jsp:useBean id="seller" class="com.UCDSystem.Seller" scope="request"/>
<jsp:setProperty name="seller" property="*"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Seller Record</title>
    </head>
    <body>
        <%
            DBConnection database = new DBConnection();
            SellerDAO sellerDao = new SellerDAO();
            int result = sellerDao.addSeller(seller);
            out.println("");
            
            if (result > 0)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Your account successfully registered. You will be redirected to login page.\")");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("SellerLogin.jsp");
                rd.include(request, response);
            }
            database.closeConnection();
        %>
    </body>
</html>
