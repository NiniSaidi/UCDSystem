<%-- 
    Document   : process-update-account2
    Created on : Jun 24, 2022, 11:35:05 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.BuyerDAO" %>
<%@page import="com.UCDSystem.Buyer" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Buyer Profile</title>
    </head>
    <body>
        <%
            String buyerID = request.getParameter("buyerID");
            String buyerFirstName = request.getParameter("buyerFirstName");
            String buyerLastName = request.getParameter("buyerLastName");
            String buyerPhoneNo = request.getParameter("buyerPhoneNo");
            String buyerEmail = request.getParameter("buyerEmail");
            String buyerAddress = request.getParameter("buyerAddress");
            String buyerPw = request.getParameter("buyerPw");
            int userCode = Integer.parseInt(request.getParameter("userCode"));
            
            DBConnection database = new DBConnection();
            BuyerDAO buyerDao = new BuyerDAO();
            Buyer buyer = new Buyer();
            
            buyer.setBuyerID(buyerID);
            buyer.setBuyerFirstName(buyerFirstName);
            buyer.setBuyerLastName(buyerLastName);
            buyer.setBuyerPhoneNo(buyerPhoneNo);
            buyer.setBuyerEmail(buyerEmail);
            buyer.setBuyerAddress(buyerAddress);
            buyer.setBuyerPw(buyerPw);
            buyer.setUserCode(userCode);
            
            int result = buyerDao.updateBuyer(buyer);
            if (result > 0)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Updating Profile\")");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("buyer-view-profile.jsp");
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
