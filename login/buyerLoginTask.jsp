<%-- 
    Document   : buyerLoginTask
    Created on : Jun 6, 2022, 11:37:27 AM
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
    String dbbuyerID;
    String dbbuyerPw;
%>
<%
    String buyerID = request.getParameter("buyerID");
    String buyerPw = request.getParameter("buyerPw");
    
    try{
        Connection con = DBConnection.getConnection();
        String sql = "select * from buyer where buyerID = ? and buyerPw = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, buyerID);
        ps.setString(2, buyerPw);
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next())
        {
            dbbuyerID = rs.getString("buyerID");
            dbbuyerPw = rs.getString("buyerPw");
            buyerID = rs.getString(1);
            String buyerFirstName = rs.getString(2);
            String buyerLastName = rs.getString(3);
            String buyerPhoneNo = rs.getString(4);
            String buyerEmail = rs.getString(5);
            String buyerAddress = rs.getString(6);
            buyerPw = rs.getString(7);
            
            if (buyerID.equals(dbbuyerID) && buyerPw.equals(dbbuyerPw))
            {
                
                session.setAttribute("buyerID", buyerID);
                session.setAttribute("buyerFirstName", buyerFirstName);
                session.setAttribute("buyerLastName", buyerLastName);
                session.setAttribute("buyerPhoneNo", buyerPhoneNo);
                session.setAttribute("buyerEmail", buyerEmail);
                session.setAttribute("buyerAddress", buyerAddress);
                session.setAttribute("buyerPw", buyerPw);
                response.sendRedirect(request.getContextPath()+"/buyerPanel/buyerDashboard.jsp");
            }
        }
        else{
            response.sendRedirect("buyerError.jsp");
            rs.close();
            ps.close();
        }
        
        
    }
    catch(Exception e){
        
    }
%>