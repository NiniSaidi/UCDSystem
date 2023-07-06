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
public class BuyerDAO {
    
    private final Connection connection;
    private int result;
    
    public BuyerDAO()
    {
        connection = DBConnection.getConnection();
    }
    
    public int addBuyer(Buyer buyer)
    {
        try{
            String mySqlQuey = "INSERT INTO buyer (buyerID, buyerFirstName, buyerLastName, buyerPhoneNo, buyerEmail, buyerAddress, buyerPw, userCode) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement myPS = connection.prepareStatement(mySqlQuey);
            myPS.setString(1, buyer.getBuyerID());
            myPS.setString(2, buyer.getBuyerFirstName());
            myPS.setString(3, buyer.getBuyerLastName());
            myPS.setString(4, buyer.getBuyerPhoneNo());
            myPS.setString(5, buyer.getBuyerEmail());
            myPS.setString(6, buyer.getBuyerAddress());
            myPS.setString(7, buyer.getBuyerPw());
            myPS.setInt(8, buyer.getUserCode());
            result = myPS.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public List<Buyer> retrieveAllBuyer()
    {
        List<Buyer> buyerAll = new ArrayList<Buyer>();
        Buyer buyer;
        
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from buyer";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()){
                buyer = new Buyer();
                buyer.setBuyerID(myRs.getString(1));
                buyer.setBuyerFirstName(myRs.getString(2));
                buyer.setBuyerLastName(myRs.getString(3));
                buyer.setBuyerPhoneNo(myRs.getString(4));
                buyer.setBuyerEmail(myRs.getString(5));
                buyer.setBuyerAddress(myRs.getString(6));
                buyer.setBuyerPw(myRs.getString(7));
                buyer.setUserCode(myRs.getInt(8));
                buyerAll.add(buyer);
            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return buyerAll;
    }
    
    public Buyer retrieveOneBuyer (String buyerID)
    {
        Buyer buyer = new Buyer();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from buyer where buyerID = " + buyerID;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next())
            {
                buyer.setBuyerID(myRs.getString(1));
                buyer.setBuyerFirstName(myRs.getString(2));
                buyer.setBuyerLastName(myRs.getString(3));
                buyer.setBuyerPhoneNo(myRs.getString(4));
                buyer.setBuyerEmail(myRs.getString(5));
                buyer.setBuyerAddress(myRs.getString(6));
                buyer.setBuyerPw(myRs.getString(7));
                buyer.setUserCode(myRs.getInt(8));
            }
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return buyer;
    }
    
    public int updateBuyer(Buyer buyer)
    {
        try {
            String mySqlQuery = "update buyer set buyerFirstName=?, buyerLastName=?, buyerPhoneNo=?, buyerEmail=?, buyerAddress=?, "
                    + "buyerPw=?, userCode=? where buyerID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            
            myPs.setString(1, buyer.getBuyerFirstName());
            myPs.setString(2, buyer.getBuyerLastName());
            myPs.setString(3, buyer.getBuyerPhoneNo());
            myPs.setString(4, buyer.getBuyerEmail());
            myPs.setString(5, buyer.getBuyerAddress());
            myPs.setString(6, buyer.getBuyerPw());
            myPs.setInt(7, buyer.getUserCode());
            myPs.setString(8, buyer.getBuyerID());
            
            result = myPs.executeUpdate();
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public int deleteBuyer (String buyerID) 
    {
        try {
            String mySqlQuery = "delete from buyer where buyerID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, buyerID);
            result = myPs.executeUpdate();
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public int buyerlogin (Buyer buyer)
    {
        try {
            String mySqlQuery = "select * from buyer where buyerID = ? and buyerPw = ?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, buyer.getBuyerID());
            myPs.setString(2, buyer.getBuyerFirstName());
            result = myPs.executeUpdate();
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
}
