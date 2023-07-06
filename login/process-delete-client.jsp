<%-- 
    Document   : process-delete-client
    Created on : Jan 20, 2022, 9:12:20 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.ClientDAO" %>
<%@page import="com.UCDSystem.Client" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Login Information</title>
    </head>
    <body>
        <%
            String clientID = request.getParameter("clientID");
            DBConnection database = new DBConnection();
            ClientDAO clientDAO = new ClientDAO();
            int result = clientDAO.deleteClient(clientID);
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
