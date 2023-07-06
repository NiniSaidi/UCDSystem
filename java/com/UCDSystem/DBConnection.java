/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.UCDSystem;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author User
 */
public class DBConnection implements java.io.Serializable {
    
    public static Connection connection;
    
    public static Connection getConnection() 
    {
        try {
            //Step 1: Load the JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            //Step 2: Establish a connection to mySql database
            String myUrl = "jdbc:mysql://localhost:3306/usedcardealersystem";
            connection = DriverManager.getConnection(myUrl, "root", "admin");
        } catch (ClassNotFoundException | SQLException e) {
            e.getMessage();
        }
        return connection;
    }
    
    public void closeConnection() 
    {
        try {
            connection.close();
        } catch (SQLException e) {
            e.getMessage();
        }
    }
    
}
