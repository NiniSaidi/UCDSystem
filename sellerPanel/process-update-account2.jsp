<%-- 
    Document   : process-update-account2
    Created on : Jun 24, 2022, 12:09:02 PM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*, com.UCDSystem.DBConnection, com.UCDSystem.SellerDAO" %>
<%@page import="com.UCDSystem.Seller" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Seller Profile</title>
    </head>
    <body>
        <%
            String sellerID = request.getParameter("sellerID");
            String sellerFirstName = request.getParameter("sellerFirstName");
            String sellerLastName = request.getParameter("sellerLastName");
            String sellerPhoneNo = request.getParameter("sellerPhoneNo");
            String sellerEmail = request.getParameter("sellerEmail");
            String sellerAddress = request.getParameter("sellerAddress");
            String sellerPw = request.getParameter("sellerPw");
            int userCode = Integer.parseInt(request.getParameter("userCode"));
            
            DBConnection database = new DBConnection();
            SellerDAO sellerDao = new SellerDAO();
            Seller seller = new Seller();
            
            seller.setSellerID(sellerID);
            seller.setSellerFirstName(sellerFirstName);
            seller.setSellerLastName(sellerLastName);
            seller.setSellerPhoneNo(sellerPhoneNo);
            seller.setSellerEmail(sellerEmail);
            seller.setSellerAddress(sellerAddress);
            seller.setSellerPw(sellerPw);
            seller.setUserCode(userCode);
            
            int result = sellerDao.updateSeller(seller);
            if (result > 0)
            {
                out.println("<script type=\"text/javascript\">");
                out.println("alert(\"Success Updating Profile\")");
                out.println("</script>");
                RequestDispatcher rd = request.getRequestDispatcher("seller-view-profile.jsp");
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
