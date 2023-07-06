<%-- 
    Document   : getImage2
    Created on : May 8, 2022, 7:05:56 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.UCDSystem.DBConnection"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String carID = request.getParameter("carID");
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("select * from car where carID=?");
                ps.setString(1, carID);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    Blob blob = rs.getBlob("image2");
                    byte byteArray[] = blob.getBytes(1, (int) blob.length());
                    response.setContentType("image/gif");
                    OutputStream os = response.getOutputStream();
                    os.write(byteArray);
                    os.flush();
                    os.close();
                } else {
                    System.out.println("No image found with this id.");
                }
            } catch (Exception e) {
                out.println(e);
            }
        %>
    </body>
</html>
