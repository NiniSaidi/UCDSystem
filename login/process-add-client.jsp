<%-- 
    Document   : process-add-client
    Created on : Jan 20, 2022, 9:11:48 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.ClientDAO" %>
<jsp:useBean id="client" class="com.UCDSystem.Client" scope="request"/>
<jsp:setProperty name="client" property="*"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Client Record</title>
    </head>
    <body>
        <%
            DBConnection database = new DBConnection();
            ClientDAO clientDao = new ClientDAO();
            int result = clientDao.addClient(client);
            out.println("");
            
            if (result > 0)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Your account successfully registered. You will be redirected to login page.\")");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("clientLogin.jsp");
                rd.include(request, response);
            }
            database.closeConnection();
        %>
    </body>
</html>
