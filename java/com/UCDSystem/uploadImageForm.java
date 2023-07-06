/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.UCDSystem;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author User
 */
@WebServlet(name = "uploadImageForm", urlPatterns = {"/uploadImageForm"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class uploadImageForm extends HttpServlet {
    
    PrintWriter out;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet uploadImageForm</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet uploadImageForm at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        out = response.getWriter();
        int result = 0;
        String sellerID = request.getParameter("sellerID");
        String inspectDate = request.getParameter("inspectDate");
        String carID = request.getParameter("carID");
        String carName = request.getParameter("carName");
        String color = request.getParameter("color");
        String sellingPrice = request.getParameter("sellingPrice");
        String conditions = request.getParameter("conditions");
        String id = request.getParameter("id");
        String ownerName = request.getParameter("ownerName");
        String ownerAddress = request.getParameter("ownerAddress");
        String engineNo = request.getParameter("engineNo");
        String chassisNo = request.getParameter("chassisNo");
        String madeBy = request.getParameter("madeBy");
        String model = request.getParameter("model");
        int engineCapacity = Integer.parseInt(request.getParameter("engineCapacity"));
        String fuelType = request.getParameter("fuelType");
        String originStatus = request.getParameter("originStatus");
        String useClass = request.getParameter("useClass");
        String bodyType = request.getParameter("bodyType");
        int yearMade = Integer.parseInt(request.getParameter("yearMade"));
        String regDate = request.getParameter("regDate");
        String bdm_bgk = request.getParameter("bdm_bgk");
        String btm = request.getParameter("btm");
        String description = request.getParameter("description");
        String bookingStatus = request.getParameter("bookingStatus");
        
        Part part1 = request.getPart("grantImage1");
        Part part2 = request.getPart("grantImage2");
        Part part3 = request.getPart("carImage1");
        Part part4 = request.getPart("carImage2");
        Part part5 = request.getPart("carImage3");
        Part part6 = request.getPart("carImage4");
        Part part7 = request.getPart("carImage5");

        if (part1 != null) {
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("insert into inspectionbooking(sellerID, inspectDate, carID, carName, color, sellingPrice, conditions, id, ownerName, ownerAddress, "
                    + "engineNo, chassisNo, madeBy, model, engineCapacity, fuelType, originStatus, useClass, bodyType, yearMade, regDate, bdm_bgk, "
                    + "btm, description, grantImage1, grantImage2, carImage1, carImage2, carImage3, carImage4, carImage5, bookingStatus) "
                    + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

                ps.setString(1, sellerID);
                ps.setString(2, inspectDate);
                ps.setString(3, carID);
                ps.setString(4, carName);
                ps.setString(5, color);
                ps.setString(6, sellingPrice);
                ps.setString(7, conditions);
                ps.setString(8, id);
                ps.setString(9, ownerName);
                ps.setString(10, ownerAddress);
                ps.setString(11, engineNo);
                ps.setString(12, chassisNo);
                ps.setString(13, madeBy);
                ps.setString(14, model);
                ps.setInt(15, engineCapacity);
                ps.setString(16, fuelType);
                ps.setString(17, originStatus);
                ps.setString(18, useClass);
                ps.setString(19, bodyType);
                ps.setInt(20, yearMade);
                ps.setString(21, regDate);
                ps.setString(22, bdm_bgk);
                ps.setString(23, btm);
                ps.setString(24, description);
                
                InputStream is8 = part1.getInputStream();
                ps.setBlob(25, is8);
                InputStream is9 = part2.getInputStream();
                ps.setBlob(26, is9);
                InputStream is10 = part3.getInputStream();
                ps.setBlob(27, is10);
                InputStream is11 = part4.getInputStream();
                ps.setBlob(28, is11);
                InputStream is12 = part5.getInputStream();
                ps.setBlob(29, is12);
                InputStream is13 = part6.getInputStream();
                ps.setBlob(30, is13);
                InputStream is14 = part7.getInputStream();
                ps.setBlob(31, is14);
                
                ps.setString(32, bookingStatus);
                
                result = ps.executeUpdate();
                if (result > 0) {
                    response.sendRedirect(request.getContextPath()+"/sellerPanel/process-view-booking.jsp");
                } else {
                    response.sendRedirect(request.getContextPath()+"/sellerPanel/ibooking-form.jsp?message=Some+Error+Occurred");
                }
            } catch (Exception e) {
                out.println(e);
            }
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
