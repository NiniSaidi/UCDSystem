<%-- 
    Document   : process-update-car2
    Created on : Jan 19, 2022, 3:39:28 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.CarDAO" %>
<%@page import="com.UCDSystem.Car" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Car Information</title>
    </head>
    <body>
        <%
            String carID = request.getParameter("carID");
            String carName = request.getParameter("carName");
            String carStatus = request.getParameter("carStatus");
            String color = request.getParameter("color");
            String sellingPrice = request.getParameter("sellingPrice");
            String conditions = request.getParameter("conditions");
            String description = request.getParameter("description");
            
            DBConnection database = new DBConnection();
            CarDAO carDao = new CarDAO();
            Car car = new Car();
            
            car.setCarID(carID);
            car.setCarName(carName);
            car.setCarStatus(carStatus);
            car.setColor(color);
            car.setSellingPrice(sellingPrice);
            car.setConditions(conditions);
            car.setDescription(description);
            
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("update car set carName=?, carStatus=?, color=?, sellingPrice=?, conditions=?, description=? where carID=?");
                ps.setString(1, carName);
                ps.setString(2, carStatus);
                ps.setString(3, car.getColor());
                ps.setString(4, car.getSellingPrice());
                ps.setString(5, car.getConditions());
                ps.setString(6, car.getDescription());
                ps.setString(7,carID);
                
                ps.executeUpdate();
                ps.close();
                
                
            } catch (Exception e) {
                out.println(e);
            }
            
            int result = carDao.updateCar(car);
            if (result > 0)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Update the Record\")");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("process-view-car.jsp");
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
