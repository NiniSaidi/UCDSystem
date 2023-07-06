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
@WebServlet(name = "uploadImage", urlPatterns = {"/uploadImage"})
@MultipartConfig(maxFileSize = 16177216)//1.5mb
public class uploadImage extends HttpServlet {

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
            out.println("<title>Servlet uploadImage</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet uploadImage at " + request.getContextPath() + "</h1>");
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
        String carID = request.getParameter("carID");
        String carName = request.getParameter("carName");
        String carStatus = request.getParameter("carStatus");
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
        String engineCapacity = request.getParameter("engineCapacity");
        String fuelType = request.getParameter("fuelType");
        String originStatus = request.getParameter("originStatus");
        String useClass = request.getParameter("useClass");
        String bodyType = request.getParameter("bodyType");
        int yearMade = Integer.parseInt(request.getParameter("yearMade"));
        String regDate = request.getParameter("regDate");
        String bdm_bgk = request.getParameter("bdm_bgk");
        String btm = request.getParameter("btm");
        String description = request.getParameter("description");
        
        Part part1 = request.getPart("grantImage1");
        Part part2 = request.getPart("grantImage2");
        Part part3 = request.getPart("image1");
        Part part4 = request.getPart("image2");
        Part part5 = request.getPart("image3");
        Part part6 = request.getPart("image4");
        Part part7 = request.getPart("image5");
        
        if (part1 != null) {
            try {
                Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("insert into car(carID, carName, carStatus, color, sellingPrice, conditions, id, ownerName, ownerAddress, "
                    + "engineNo, chassisNo, madeBy, model, engineCapacity, fuelType, originStatus, useClass, bodyType, yearMade, regDate, bdm_bgk, "
                    + "btm, description, grantImage1, grantImage2, image1, image2, image3, image4, image5) "
                    + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

                
                ps.setString(1, carID);
                ps.setString(2, carName);
                ps.setString(3, carStatus);
                ps.setString(4, color);
                ps.setString(5, sellingPrice);
                ps.setString(6, conditions);
                ps.setString(7, id);
                ps.setString(8, ownerName);
                ps.setString(9, ownerAddress);
                ps.setString(10, engineNo);
                ps.setString(11, chassisNo);
                ps.setString(12, madeBy);
                ps.setString(13, model);
                ps.setString(14, engineCapacity);
                ps.setString(15, fuelType);
                ps.setString(16, originStatus);
                ps.setString(17, useClass);
                ps.setString(18, bodyType);
                ps.setInt(19, yearMade);
                ps.setString(20, regDate);
                ps.setString(21, bdm_bgk);
                ps.setString(22, btm);
                ps.setString(23, description);
                
                InputStream is1 = part1.getInputStream();
                ps.setBlob(24, is1);
                InputStream is2 = part2.getInputStream();
                ps.setBlob(25, is2);
                InputStream is3 = part3.getInputStream();
                ps.setBlob(26, is3);
                InputStream is4 = part4.getInputStream();
                ps.setBlob(27, is4);
                InputStream is5 = part5.getInputStream();
                ps.setBlob(28, is5);
                InputStream is6 = part6.getInputStream();
                ps.setBlob(29, is6);
                InputStream is7 = part7.getInputStream();
                ps.setBlob(30, is7);
                
                result = ps.executeUpdate();
                if (result > 0) {
                    response.sendRedirect(request.getContextPath()+"/dealerPanel/process-view-car.jsp");
                } else {
                    response.sendRedirect(request.getContextPath()+"/dealerPanel/add-car-form.jsp?message=Some+Error+Occurred");
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
