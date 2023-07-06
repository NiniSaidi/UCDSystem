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
public class InspectionBookingDAO {
    
    private final Connection connection;
    private int result;
    
    public InspectionBookingDAO()
    {
        connection = DBConnection.getConnection();
    }
    
    public int addInspectionBooking(InspectionBooking inspectionbooking)
    {
        try{
            String mySqlQuey = "INSERT INTO inspectionbooking (inspectID, sellerID, inspectDate, carID, carName, color, sellingPrice, conditions, id, ownerName, ownerAddress, "
                    + "engineNo, chassisNo, madeBy, model, engineCapacity, fuelType, originStatus, useClass, bodyType, yearMade, regDate, bdm_bgk, "
                    + "btm, description, grantImage1, grantImage2, carImage1, carImage2, carImage3, carImage4, carImage5, bookingStatus) "
                    + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            
            PreparedStatement myPs = connection.prepareStatement(mySqlQuey);
            myPs.setInt(1, inspectionbooking.getInspectID());
            myPs.setString(2, inspectionbooking.getSellerID());
            myPs.setString(3, inspectionbooking.getInspectDate());
            myPs.setString(4, inspectionbooking.getCarID());
            myPs.setString(5, inspectionbooking.getCarName());
            myPs.setString(6, inspectionbooking.getCarStatus());
            myPs.setString(7, inspectionbooking.getColor());
            myPs.setString(8, inspectionbooking.getSellingPrice());
            myPs.setString(9, inspectionbooking.getConditions());
            myPs.setString(10, inspectionbooking.getId());
            myPs.setString(11, inspectionbooking.getOwnerName());
            myPs.setString(12, inspectionbooking.getOwnerAddress());
            myPs.setString(13, inspectionbooking.getEngineNo());
            myPs.setString(14, inspectionbooking.getChassisNo());
            myPs.setString(15, inspectionbooking.getMadeBy());
            myPs.setString(16, inspectionbooking.getModel());
            myPs.setInt(17, inspectionbooking.getEngineCapacity());
            myPs.setString(18, inspectionbooking.getFuelType());
            myPs.setString(19, inspectionbooking.getOriginStatus());
            myPs.setString(20, inspectionbooking.getUseClass());
            myPs.setString(21, inspectionbooking.getBodyType());
            myPs.setInt(22, inspectionbooking.getYearMade());
            myPs.setString(23, inspectionbooking.getRegDate());
            myPs.setString(24, inspectionbooking.getBdm_bgk());
            myPs.setString(25, inspectionbooking.getBtm());
            myPs.setString(26, inspectionbooking.getDescription());
            myPs.setString(27, inspectionbooking.getGrant1());
            myPs.setString(28, inspectionbooking.getGrant2());
            myPs.setString(29, inspectionbooking.getImage1());
            myPs.setString(30, inspectionbooking.getImage2());
            myPs.setString(31, inspectionbooking.getImage3());
            myPs.setString(32, inspectionbooking.getImage4());
            myPs.setString(33, inspectionbooking.getImage5());
            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public List<InspectionBooking> retrieveAllInspectionBooking()
    {
        List<InspectionBooking> inspectionbookingAll = new ArrayList<InspectionBooking>();
        InspectionBooking inspectionbooking;
        
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from inspectionbooking";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()){
                inspectionbooking = new InspectionBooking();
                inspectionbooking.setInspectID(myRs.getInt(1));
                inspectionbooking.setSellerID(myRs.getString(2));
                inspectionbooking.setInspectDate(myRs.getString(3));
                inspectionbooking.setCarID(myRs.getString(4));
                inspectionbooking.setCarName(myRs.getString(5));
                inspectionbooking.setCarStatus(myRs.getString(6));
                inspectionbooking.setColor(myRs.getString(7));
                inspectionbooking.setSellingPrice(myRs.getString(8));
                inspectionbooking.setConditions(myRs.getString(9));
                inspectionbooking.setId(myRs.getString(10));
                inspectionbooking.setOwnerName(myRs.getString(11));
                inspectionbooking.setOwnerAddress(myRs.getString(12));
                inspectionbooking.setEngineNo(myRs.getString(13));
                inspectionbooking.setChassisNo(myRs.getString(14));
                inspectionbooking.setMadeBy(myRs.getString(15));
                inspectionbooking.setModel(myRs.getString(16));
                inspectionbooking.setEngineCapacity(myRs.getInt(17));
                inspectionbooking.setFuelType(myRs.getString(18));
                inspectionbooking.setOriginStatus(myRs.getString(19));
                inspectionbooking.setUseClass(myRs.getString(20));
                inspectionbooking.setBodyType(myRs.getString(21));
                inspectionbooking.setYearMade(myRs.getInt(22));
                inspectionbooking.setRegDate(myRs.getString(23));
                inspectionbooking.setBdm_bgk(myRs.getString(24));
                inspectionbooking.setBtm(myRs.getString(25));
                inspectionbooking.setDescription(myRs.getString(26));
                inspectionbooking.setGrant1(myRs.getString(27));
                inspectionbooking.setGrant2(myRs.getString(28));
                inspectionbooking.setImage1(myRs.getString(29));
                inspectionbooking.setImage2(myRs.getString(30));
                inspectionbooking.setImage3(myRs.getString(31));
                inspectionbooking.setImage4(myRs.getString(32));
                inspectionbooking.setImage5(myRs.getString(33));
                inspectionbookingAll.add(inspectionbooking);
            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return inspectionbookingAll;
    }
    
    public InspectionBooking retrieveOneInspectionBooking (int inspectID)
    {
        InspectionBooking inspectionbooking = new InspectionBooking();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from inspectionbooking where inspectID = " + inspectID;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next())
            {
                inspectionbooking.setInspectID(myRs.getInt(1));
                inspectionbooking.setSellerID(myRs.getString(2));
                inspectionbooking.setInspectDate(myRs.getString(3));
                inspectionbooking.setCarID(myRs.getString(4));
                inspectionbooking.setCarName(myRs.getString(5));
                inspectionbooking.setCarStatus(myRs.getString(6));
                inspectionbooking.setColor(myRs.getString(7));
                inspectionbooking.setSellingPrice(myRs.getString(8));
                inspectionbooking.setConditions(myRs.getString(9));
                inspectionbooking.setId(myRs.getString(10));
                inspectionbooking.setOwnerName(myRs.getString(11));
                inspectionbooking.setOwnerAddress(myRs.getString(12));
                inspectionbooking.setEngineNo(myRs.getString(13));
                inspectionbooking.setChassisNo(myRs.getString(14));
                inspectionbooking.setMadeBy(myRs.getString(15));
                inspectionbooking.setModel(myRs.getString(16));
                inspectionbooking.setEngineCapacity(myRs.getInt(17));
                inspectionbooking.setFuelType(myRs.getString(18));
                inspectionbooking.setOriginStatus(myRs.getString(19));
                inspectionbooking.setUseClass(myRs.getString(20));
                inspectionbooking.setBodyType(myRs.getString(21));
                inspectionbooking.setYearMade(myRs.getInt(22));
                inspectionbooking.setRegDate(myRs.getString(23));
                inspectionbooking.setBdm_bgk(myRs.getString(24));
                inspectionbooking.setBtm(myRs.getString(25));
                inspectionbooking.setDescription(myRs.getString(26));
                inspectionbooking.setGrant1(myRs.getString(27));
                inspectionbooking.setGrant2(myRs.getString(28));
                inspectionbooking.setImage1(myRs.getString(29));
                inspectionbooking.setImage2(myRs.getString(30));
                inspectionbooking.setImage3(myRs.getString(31));
                inspectionbooking.setImage4(myRs.getString(32));
                inspectionbooking.setImage5(myRs.getString(33));
            }
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return inspectionbooking;
    }
    
    public int updateBooking(InspectionBooking inspectionbooking)
    {
        try {
            String mySqlQuery = "UPDATE inspectionbooking set bookingStatus=? where inspectID=?";
            
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            
            myPs.setString(1, inspectionbooking.getBookingStatus());
            myPs.setInt(2, inspectionbooking.getInspectID());
            
            result = myPs.executeUpdate();
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public int deleteInspectionBooking (String inspectID) 
    {
        try {
            String mySqlQuery = "delete from inspectionbooking where inspectID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, inspectID);
            result = myPs.executeUpdate();
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
}
