<%-- 
    Document   : process-delete-buyer
    Created on : May 15, 2022, 6:37:31 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.BuyerDAO" %>
<%@page import="com.UCDSystem.Buyer" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Account</title>
    </head>
    <body>
        <%
            String buyerID = request.getParameter("buyerID");
            DBConnection database = new DBConnection();
            BuyerDAO buyerDAO = new BuyerDAO();
            int result = buyerDAO.deleteBuyer(buyerID);
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
