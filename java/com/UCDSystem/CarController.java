/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.UCDSystem;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Part;

/**
 *
 * @author User
 */
public class CarController extends HttpServlet {
    
    private String dbURL = "jdbc:mysql://localhost:3306/usedcardealersystem";
    private String dbUser = "root";
    private String dbPass = "admin";

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
        response.setContentType("text/html;charset=UTF-8");
        try {
            //read the "command" parameter
            String theCommand = request.getParameter("command");
            //if the command is missing, then default to listing students
            if (theCommand == null) {
                theCommand = "LIST";
            }
            
            switch (theCommand) {
                case "LIST":
                    listCar (request, response);
                    break;
                case "ADD":
                    addCar (request, response);
                    break;
                case "LOAD":
                    loadCar (request, response);
                    break;
                case "UPDATE":
                    updateCar (request, response);
                    break;
                case "SAVEUPDATE":
                    saveUpdateCar (request, response);
                    break;
                case "DELETE":
                    deleteCar (request, response);
                    break;
                case "SEARCH":
                    searchCar (request, response);
                    break;
                default:
                    listCar (request, response);
            }
        } catch (Exception ex) {
            
        }
    }
    
    private void addCar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        
        
    }
    
    private void listCar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        
    }
    
    private void loadCar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        
    }
    
    
    private void updateCar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        //read product info from form data
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
        
        //create a new product object
        Car car = new Car();
        car.setCarID(carID);
        car.setCarName(carName);
        car.setCarStatus(carStatus);
        car.setColor(color);
        car.setSellingPrice(sellingPrice);
        car.setConditions(conditions);
        car.setId(id);
        car.setOwnerName(ownerName);
        car.setOwnerAddress(ownerAddress);
        car.setEngineNo(engineNo);
        car.setChassisNo(chassisNo);
        car.setMadeBy(madeBy);
        car.setModel(model);
        car.setEngineCapacity(engineCapacity);
        car.setFuelType(fuelType);
        car.setOriginStatus(originStatus);
        car.setUseClass(useClass);
        car.setBodyType(bodyType);
        car.setYearMade(yearMade);
        car.setRegDate(regDate);
        car.setBdm_bgk(bdm_bgk);
        car.setBtm(btm);
        car.setDescription(description);
        
/*        InputStream inputStream = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("image1");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
        */
        
        CarDAO carDao = new CarDAO();
        int result = carDao.updateCar(car);
        
        //perform update on database
        if (result > 0) {
            
            request.setAttribute("updateCar", car);
            RequestDispatcher dispatcher = request.getRequestDispatcher("dealerPanel/process-update-car3.jsp");
            dispatcher.forward(request, response);
        }
    }
    
    private void saveUpdateCar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        
    }
    
    private void searchCar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        
    }
    
    private void deleteCar(HttpServletRequest request, HttpServletResponse response) throws Exception {
        
        
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
        
        // gets values of text fields
        String carID = request.getParameter("carID");
        String carName = request.getParameter("carName");
        String carStatus = request.getParameter("carStatus");
        String model = request.getParameter("model");
        String openingPrice = request.getParameter("openingPrice");
        String conditions = request.getParameter("conditions");
        int manufactureyear = Integer.parseInt(request.getParameter("manufactureyear"));
        String color = request.getParameter("color");
        String description = request.getParameter("description");
        
        InputStream inputStream1 = null; // input stream of the upload file
        InputStream inputStream2 = null;
        InputStream inputStream3 = null;
        InputStream inputStream4 = null;
        InputStream inputStream5 = null;

        // obtains the upload file part in this multipart request
        Part filePart1 = request.getPart("image1");
        if (filePart1 != null) {
            // prints out some information for debugging
            System.out.println(filePart1.getName());
            System.out.println(filePart1.getSize());
            System.out.println(filePart1.getContentType());

            // obtains input stream of the upload file
            inputStream1 = filePart1.getInputStream();
        }
        
        Part filePart2 = request.getPart("image2");
        if (filePart2 != null) {
            // prints out some information for debugging
            System.out.println(filePart2.getName());
            System.out.println(filePart2.getSize());
            System.out.println(filePart2.getContentType());

            // obtains input stream of the upload file
            inputStream2 = filePart2.getInputStream();
        }
        
        Part filePart3 = request.getPart("image3");
        if (filePart3 != null) {
            // prints out some information for debugging
            System.out.println(filePart3.getName());
            System.out.println(filePart3.getSize());
            System.out.println(filePart3.getContentType());

            // obtains input stream of the upload file
            inputStream3 = filePart3.getInputStream();
        }
        
        Part filePart4 = request.getPart("image4");
        if (filePart4 != null) {
            // prints out some information for debugging
            System.out.println(filePart4.getName());
            System.out.println(filePart4.getSize());
            System.out.println(filePart4.getContentType());

            // obtains input stream of the upload file
            inputStream4 = filePart4.getInputStream();
        }
        
        Part filePart5 = request.getPart("image5");
        if (filePart5 != null) {
            // prints out some information for debugging
            System.out.println(filePart5.getName());
            System.out.println(filePart5.getSize());
            System.out.println(filePart5.getContentType());

            // obtains input stream of the upload file
            inputStream5 = filePart5.getInputStream();
        }

        Connection conn = null; // connection to the database
        String message = null;  // message will be sent back to client

        try {
            // connects to the database
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            // constructs SQL statement
            String sql = "INSERT INTO car (carID, carName, carStatus, model, openingPrice, conditions, manufactureyear, color, description) "
                    + "values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, carID);
            statement.setString(2, carName);
            statement.setString(3, carStatus);
            statement.setString(4, model);
            statement.setString(5, openingPrice);
            statement.setString(6, conditions);
            statement.setInt(7, manufactureyear);
            statement.setString(8, color);
            statement.setString(9, description);
            
            if (inputStream1 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(10, inputStream1);
            }
            
            if (inputStream2 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(11, inputStream2);
            }
            
            if (inputStream3 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(12, inputStream3);
            }
            
            if (inputStream4 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(13, inputStream4);
            }
            
            if (inputStream5 != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(14, inputStream5);
            }

            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
                message = "Data successfully added";
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (conn != null) {
                // closes the database connection
                try {
                    conn.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            // sets the message in request scope
            request.setAttribute("Message", message);

            // forwards to the message page
            getServletContext().getRequestDispatcher("/dealerPanel/process-view-car.jsp").forward(request, response);
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
