<%-- 
    Document   : process-add-car
    Created on : Jan 19, 2022, 3:38:19 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.CarDAO" %>
<jsp:useBean id="car" class="com.UCDSystem.Car" scope="request"/>
<jsp:setProperty name="car" property="*"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Car Record</title>
    </head>
    <body>
        <%
            DBConnection database = new DBConnection();
            CarDAO carDao = new CarDAO();
            int result = carDao.addCar(car);
            out.println("");
            
            if (result > 0)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Add Record\")");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("process-view-car.jsp");
                rd.include(request, response);
            }
            database.closeConnection();
        %>
    </body>
</html>
