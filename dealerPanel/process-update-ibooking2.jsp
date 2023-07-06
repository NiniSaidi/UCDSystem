<%-- 
    Document   : process-update-ibooking2
    Created on : Jun 25, 2022, 12:42:39 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.InspectionBookingDAO" %>
<%@page import="com.UCDSystem.InspectionBooking" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Booking Status</title>
    </head>
    <body>
        <%
            int inspectID = Integer.parseInt(request.getParameter("inspectID"));
            String bookingStatus = request.getParameter("bookingStatus");
            
            DBConnection database = new DBConnection();
            InspectionBookingDAO ibookingDao = new InspectionBookingDAO();
            InspectionBooking ibooking = new InspectionBooking();
            
            ibooking.setInspectID(inspectID);
            ibooking.setBookingStatus(bookingStatus);
            
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("update inspectionbooking set bookingStatus=? where inspectID=?");
                ps.setString(1, bookingStatus);
                
                ps.setInt(2,inspectID);
                ps.executeUpdate();
                ps.close();
                
                
            } catch (Exception e) {
                out.println(e);
            }
            
            int result = ibookingDao.updateBooking(ibooking);
            if (result > 0)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Updating Booking Status\")");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("process-view-ibooking.jsp");
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
