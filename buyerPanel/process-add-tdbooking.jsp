<%-- 
    Document   : process-add-tdbooking
    Created on : May 28, 2022, 8:52:46 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.TestDriveBookingDAO" %>
<jsp:useBean id="testdrivebooking" class="com.UCDSystem.TestDriveBooking" scope="request"/>
<jsp:setProperty name="testdrivebooking" property="*"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add New Booking Record</title>
    </head>
    <body>
        <%
            DBConnection database = new DBConnection();
            TestDriveBookingDAO testdrivebookingDao = new TestDriveBookingDAO();
            int result = testdrivebookingDao.addTestDriveBooking(testdrivebooking);
            out.println("");
            
            if (result > 0)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Your test drive booking is submitted! You will be redirected to view booking list.\")");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("process-view-booking.jsp");
                rd.include(request, response);
            }
            database.closeConnection();
        %>
    </body>
</html>
