<%-- 
    Document   : process-delete-seller
    Created on : May 15, 2022, 6:37:49 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.SellerDAO" %>
<%@page import="com.UCDSystem.Seller" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Account</title>
    </head>
    <body>
        <%
            String sellerID = request.getParameter("sellerID");
            DBConnection database = new DBConnection();
            SellerDAO sellerDAO = new SellerDAO();
            int result = sellerDAO.deleteSeller(sellerID);
            database.closeConnection();
            if (result > 0)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Delete the Account\")");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("process-view-client.jsp");
                rd.include(request, response);
            }
        %>
    </body>
</html>
