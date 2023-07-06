<%-- 
    Document   : sellerLoginTask
    Created on : Jun 6, 2022, 11:37:15 AM
    Author     : User
--%>


<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.UCDSystem.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
<%! 
    String dbsellerID;
    String dbsellerPw;
%>
<%
    String sellerID = request.getParameter("sellerID");
    String sellerPw = request.getParameter("sellerPw");
    
    try{
        Connection con = DBConnection.getConnection();
        String sql = "select * from seller where sellerID = ? and sellerPw = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, sellerID);
        ps.setString(2, sellerPw);
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next())
        {
            dbsellerID = rs.getString("sellerID");
            dbsellerPw = rs.getString("sellerPw");
            sellerID = rs.getString(1);
            String sellerFirstName = rs.getString(2);
            String sellerLastName = rs.getString(3);
            String sellerPhoneNo = rs.getString(4);
            String sellerEmail = rs.getString(5);
            String sellerAddress = rs.getString(6);
            sellerPw = rs.getString(7);
            
            if (sellerID.equals(dbsellerID) && sellerPw.equals(dbsellerPw))
            {
                
                session.setAttribute("sellerID", sellerID);
                session.setAttribute("sellerFirstName", sellerFirstName);
                session.setAttribute("sellerLastName", sellerLastName);
                session.setAttribute("sellerPhoneNo", sellerPhoneNo);
                session.setAttribute("sellerEmail", sellerEmail);
                session.setAttribute("sellerAddress", sellerAddress);
                session.setAttribute("sellerPw", sellerPw);
                response.sendRedirect(request.getContextPath()+"/sellerPanel/sellerDashboard.jsp");
            }
        }
        else{
            response.sendRedirect("sellerError.jsp");
            rs.close();
            ps.close();
        }
        
        
    }
    catch(Exception e){
        
    }
%>
