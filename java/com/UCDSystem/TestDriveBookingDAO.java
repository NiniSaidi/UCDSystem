/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.UCDSystem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author User
 */
public class TestDriveBookingDAO {
    
    private final Connection connection;
    private int result;
    
    public TestDriveBookingDAO()
    {
        connection = DBConnection.getConnection();
    }
    
    public int addTestDriveBooking(TestDriveBooking testdrivebooking)
    {
        try{
            String mySqlQuey = "INSERT INTO testdrivebooking (formID, buyerID, carID, bookingDate, description, bookingStatus) VALUES(?, ?, ?, ?, ?, ?)";
            PreparedStatement myPS = connection.prepareStatement(mySqlQuey);
            myPS.setInt(1, testdrivebooking.getFormID());
            myPS.setString(2, testdrivebooking.getBuyerID());
            myPS.setString(3, testdrivebooking.getCarID());
            myPS.setString(4, testdrivebooking.getBookingDate());
            myPS.setString(5, testdrivebooking.getDescription());
            myPS.setString(6, testdrivebooking.getBookingStatus());
            result = myPS.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public List<TestDriveBooking> retrieveAllTestDriveBooking()
    {
        List<TestDriveBooking> testdrivebookingAll = new ArrayList<TestDriveBooking>();
        TestDriveBooking testdrivebooking;
        
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from testdrivebooking";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()){
                testdrivebooking = new TestDriveBooking();
                testdrivebooking.setFormID(myRs.getInt(1));
                testdrivebooking.setBuyerID(myRs.getString(2));
                testdrivebooking.setCarID(myRs.getString(3));
                testdrivebooking.setBookingDate(myRs.getString(4));
                testdrivebooking.setDescription(myRs.getString(5));
                testdrivebooking.setBookingStatus(myRs.getString(6));
                testdrivebookingAll.add(testdrivebooking);
            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return testdrivebookingAll;
    }
    
    public TestDriveBooking retrieveOneTestDriveBooking (int formID)
    {
        TestDriveBooking testdrivebooking = new TestDriveBooking();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from testdrivebooking where formID = " + formID;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next())
            {
                testdrivebooking.setFormID(myRs.getInt(1));
                testdrivebooking.setBuyerID(myRs.getString(2));
                testdrivebooking.setCarID(myRs.getString(3));
                testdrivebooking.setBookingDate(myRs.getString(4));
                testdrivebooking.setDescription(myRs.getString(5));
                testdrivebooking.setBookingStatus(myRs.getString(6));
            }
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return testdrivebooking;
    }
    
    public List<TestDriveBooking> retrieveTestDriveBooking(String buyerID)
    {
        List<TestDriveBooking> testdrivebookingAll = new ArrayList<TestDriveBooking>();
        TestDriveBooking testdrivebooking;
        
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from testdrivebooking where buyerID = " + buyerID;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()){
                testdrivebooking = new TestDriveBooking();
                testdrivebooking.setFormID(myRs.getInt(1));
                testdrivebooking.setBuyerID(myRs.getString(2));
                testdrivebooking.setCarID(myRs.getString(3));
                testdrivebooking.setBookingDate(myRs.getString(4));
                testdrivebooking.setDescription(myRs.getString(5));
                testdrivebooking.setBookingStatus(myRs.getString(6));
                testdrivebookingAll.add(testdrivebooking);
            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return testdrivebookingAll;
    }
    
    public TestDriveBooking retrieveBookingOneUser (String buyerID)
    {
        TestDriveBooking testdrivebooking = new TestDriveBooking();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from testdrivebooking where buyerID = " + buyerID;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next())
            {
                testdrivebooking.setFormID(myRs.getInt(1));
                testdrivebooking.setBuyerID(myRs.getString(2));
                testdrivebooking.setCarID(myRs.getString(3));
                testdrivebooking.setBookingDate(myRs.getString(4));
                testdrivebooking.setDescription(myRs.getString(5));
                testdrivebooking.setBookingStatus(myRs.getString(6));
            }
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return testdrivebooking;
    }
    
    public int updateBooking(TestDriveBooking testdrivebooking)
    {
        try {
            String mySqlQuery = "update testdrivebooking set buyerID=?, carID=?, bookingDate=?, description=?, bookingStatus=? where formID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            
            myPs.setString(1, testdrivebooking.getBuyerID());
            myPs.setString(2, testdrivebooking.getCarID());
            myPs.setString(3, testdrivebooking.getBookingDate());
            myPs.setString(4, testdrivebooking.getDescription());
            myPs.setString(5, testdrivebooking.getBookingStatus());
            myPs.setInt(6, testdrivebooking.getFormID());
            
            result = myPs.executeUpdate();
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public int deleteTestDriveBooking (int formID) 
    {
        try {
            String mySqlQuery = "delete from testdrivebooking where formID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setInt(1, formID);
            result = myPs.executeUpdate();
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
}
