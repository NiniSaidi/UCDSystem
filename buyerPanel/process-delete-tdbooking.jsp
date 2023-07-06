<%-- 
    Document   : process-delete-tdbooking
    Created on : May 28, 2022, 8:53:20 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.TestDriveBookingDAO" %>
<%@page import="com.UCDSystem.TestDriveBooking" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Delete Booking Record</title>
    </head>
    <body>
        <%
            int formID = Integer.parseInt(request.getParameter("formID"));
            DBConnection database = new DBConnection();
            TestDriveBookingDAO testdrivebookingDao = new TestDriveBookingDAO();
            int result = testdrivebookingDao.deleteTestDriveBooking(formID);
            database.closeConnection();
            if (result > 0)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Delete the Record\")");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("process-view-booking.jsp");
                rd.include(request, response);
            }
        %>
    </body>
</html>
