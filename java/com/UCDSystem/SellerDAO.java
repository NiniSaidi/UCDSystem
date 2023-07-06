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
public class SellerDAO {
    
    private final Connection connection;
    private int result;
    
    public SellerDAO()
    {
        connection = DBConnection.getConnection();
    }
    
    public int addSeller(Seller seller)
    {
        try{
            String mySqlQuey = "INSERT INTO seller (sellerID, sellerFirstName, sellerLastName, sellerPhoneNo, sellerEmail, sellerAddress, sellerPw, userCode) VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement myPS = connection.prepareStatement(mySqlQuey);
            myPS.setString(1, seller.getSellerID());
            myPS.setString(2, seller.getSellerFirstName());
            myPS.setString(3, seller.getSellerLastName());
            myPS.setString(4, seller.getSellerPhoneNo());
            myPS.setString(5, seller.getSellerEmail());
            myPS.setString(6, seller.getSellerAddress());
            myPS.setString(7, seller.getSellerPw());
            myPS.setInt(8, seller.getUserCode());
            result = myPS.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public List<Seller> retrieveAllSeller()
    {
        List<Seller> sellerAll = new ArrayList<Seller>();
        Seller seller;
        
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from seller";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()){
                seller = new Seller();
                seller.setSellerID(myRs.getString(1));
                seller.setSellerFirstName(myRs.getString(2));
                seller.setSellerLastName(myRs.getString(3));
                seller.setSellerPhoneNo(myRs.getString(4));
                seller.setSellerEmail(myRs.getString(5));
                seller.setSellerAddress(myRs.getString(6));
                seller.setSellerPw(myRs.getString(7));
                seller.setUserCode(myRs.getInt(8));
                sellerAll.add(seller);
            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return sellerAll;
    }
    
    public Seller retrieveOneSeller (int sellerID)
    {
        Seller seller = new Seller();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from seller where sellerID = " + sellerID;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next())
            {
                seller.setSellerID(myRs.getString(1));
                seller.setSellerFirstName(myRs.getString(2));
                seller.setSellerLastName(myRs.getString(3));
                seller.setSellerPhoneNo(myRs.getString(4));
                seller.setSellerEmail(myRs.getString(5));
                seller.setSellerAddress(myRs.getString(6));
                seller.setSellerPw(myRs.getString(7));
                seller.setUserCode(myRs.getInt(8));
            }
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return seller;
    }
    
    public int updateSeller(Seller seller)
    {
        try {
            String mySqlQuery = "update seller set sellerFirstName=?, sellerLastName=?, sellerPhoneNo=?, sellerEmail=?, sellerAddress=?, "
                    + "sellerPw=?, userCode=? where sellerID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            
            myPs.setString(1, seller.getSellerFirstName());
            myPs.setString(2, seller.getSellerLastName());
            myPs.setString(3, seller.getSellerPhoneNo());
            myPs.setString(4, seller.getSellerEmail());
            myPs.setString(5, seller.getSellerAddress());
            myPs.setString(6, seller.getSellerPw());
            myPs.setInt(7, seller.getUserCode());
            myPs.setString(8, seller.getSellerID());
            
            result = myPs.executeUpdate();
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public int deleteSeller (String sellerID) 
    {
        try {
            String mySqlQuery = "delete from seller where sellerID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, sellerID);
            result = myPs.executeUpdate();
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public int sellerlogin (Seller seller)
    {
        try {
            String mySqlQuery = "select * from seller where sellerID = ? and sellerPw = ?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, seller.getSellerID());
            myPs.setString(2, seller.getSellerFirstName());
            result = myPs.executeUpdate();
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
}
