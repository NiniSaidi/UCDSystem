<%-- 
    Document   : doLoginClient
    Created on : Jan 21, 2022, 10:04:14 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <%! 
            String dbClientID;
            String dbClientPw;
        %>
        <%
            Connection myConnection;
            PreparedStatement ps;
            ResultSet rs;
            
            String clientID = request.getParameter("clientID");
            String clientPw = request.getParameter("clientPw");
            
            if((!(clientID.equals(null) || clientID.equals("")) && !(clientPw.equals(null) || clientPw.equals(""))))
            {
                try
                {
                    Class.forName("com.mysql.jdbc.Driver");
                    String myURL = "jdbc:mysql://localhost/usedcardealersystem";
                    myConnection = DriverManager.getConnection(myURL,"root","admin");
                    
                    ps = myConnection.prepareStatement("select * from client where clientID = ? and clientPw = ?");
                    ps.setString(1, clientID);
                    ps.setString(2, clientPw);
                    rs = ps.executeQuery();
                    
                    if (rs.next())
                    {
                        dbClientID = rs.getString("clientID");
                        dbClientPw = rs.getString("clientPw");
                        
                        if (clientID.toUpperCase().equals(dbClientID) && clientPw.equals(dbClientPw))
                        {
                            out.println("<script type=\"text/javascript\">");
                            out.println("alert(\"Login Successfully\")");
                            out.println("</script>");
                            session.setAttribute("clientID", dbClientID);
                            response.sendRedirect(request.getContextPath()+"/clientPanel/clientDashboard.jsp");
                        }
                    }
                    else
                    {
                        response.sendRedirect("cashierError.jsp");
                        rs.close();
                        ps.close();
                        }
                }
                catch (SQLException sqe)
                {
                    out.println(sqe);
                }
            }
            else
            {
        %>
                <p style="color: red">Invalid username or password..!</p>
        <% 
                getServletContext().getRequestDispatcher("/clientLogin.jsp").include(request, response);
            }
        %>
    </body>
</html>
