<%-- 
    Document   : process-update-tdbooking2
    Created on : Jun 25, 2022, 12:42:56 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.TestDriveBookingDAO" %>
<%@page import="com.UCDSystem.TestDriveBooking" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Booking Status</title>
    </head>
    <body>
        <%
            int formID = Integer.parseInt(request.getParameter("formID"));
            String bookingStatus = request.getParameter("bookingStatus");
            String buyerID = request.getParameter("buyerID");
            String carID = request.getParameter("carID");
            String bookingDate = request.getParameter("bookingDate");
            String description = request.getParameter("description");
            
            DBConnection database = new DBConnection();
            TestDriveBookingDAO tdbookingDao = new TestDriveBookingDAO();
            TestDriveBooking tdbooking = new TestDriveBooking();
            
            tdbooking.setFormID(formID);
            tdbooking.setBuyerID(buyerID);
            tdbooking.setCarID(carID);
            tdbooking.setBookingDate(bookingDate);
            tdbooking.setDescription(description);
            tdbooking.setBookingStatus(bookingStatus);
            
            int result = tdbookingDao.updateBooking(tdbooking);
            if (result > 0)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Updating Booking Status\")");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("process-view-tdbooking.jsp");
                rd.include(request, response);
            }
            else
            {
                out.println("result is 0");
            }
            database.closeConnection();
        %>
    </body>
</html>
