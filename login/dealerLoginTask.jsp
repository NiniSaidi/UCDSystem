<%-- 
    Document   : dealerLoginTask
    Created on : Jun 6, 2022, 7:45:02 AM
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
    </body>
</html>
<%! 
    String dbdealerid;
    String dbpasswords;
%>
<%
    String dealerid = request.getParameter("dealerid");
    String passwords = request.getParameter("passwords");
    
    try{
        Connection con = DBConnection.getConnection();
        String sql = "select * from dealer where dealerid = ? and passwords = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        
        ps.setString(1, dealerid);
        ps.setString(2, passwords);
        
        ResultSet rs = ps.executeQuery();
        
        if(rs.next())
        {
            dbdealerid = rs.getString("dealerid");
            dbpasswords = rs.getString("passwords");
            dealerid = rs.getString(1);
            String fname = rs.getString(2);
            
            if (dealerid.equals(dbdealerid) && passwords.equals(dbpasswords))
            {
                
                session.setAttribute("dealerid", dealerid);
                session.setAttribute("fname", fname);
                response.sendRedirect(request.getContextPath()+"/dealerPanel/dealerDashboard.jsp");
            }
        }
        else{
            response.sendRedirect("dealerError.jsp");
            rs.close();
            ps.close();
        }
        
        
    }
    catch(Exception e){
        
    }
%>
