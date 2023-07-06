<%-- 
    Document   : process-delete-car
    Created on : Jan 19, 2022, 3:38:58 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.CarDAO" %>
<%@page import="com.UCDSystem.Car" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Car Record</title>
    </head>
    <body>
        <%
            String carID = request.getParameter("carID");
            DBConnection database = new DBConnection();
            CarDAO carDao = new CarDAO();
            int result = carDao.deleteCar(carID);
            database.closeConnection();
            if (result > 0)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Delete the Record\")");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("process-view-car.jsp");
                rd.include(request, response);
            }
        %>
    </body>
</html>
