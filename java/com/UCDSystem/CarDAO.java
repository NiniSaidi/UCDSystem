/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.UCDSystem;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author User
 */
public class CarDAO {
    
    private final Connection connection;
    private int result;
    
    public CarDAO()
    {
        connection = DBConnection.getConnection();
    }
    
    public int addCar(Car car)
    {
        try{
            String mySqlQuery = "insert into car (carID, carName, carStatus, color, sellingPrice, conditions, id, ownerName, ownerAddress, "
                    + "engineNo, chassisNo, madeBy, model, engineCapacity, fuelType, originStatus, useClass, bodyType, yearMade, regDate, bdm_bgk, "
                    + "btm, description, grantImage1, grantImage2, image1, image2, image3, image4, image5) "
                    + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            
            myPs.setString(1, car.getCarID());
            myPs.setString(2, car.getCarName());
            myPs.setString(3, car.getCarStatus());
            myPs.setString(4, car.getColor());
            myPs.setString(5, car.getSellingPrice());
            myPs.setString(6, car.getConditions());
            myPs.setString(7, car.getId());
            myPs.setString(8, car.getOwnerName());
            myPs.setString(9, car.getOwnerAddress());
            myPs.setString(10, car.getEngineNo());
            myPs.setString(11, car.getChassisNo());
            myPs.setString(12, car.getMadeBy());
            myPs.setString(13, car.getModel());
            myPs.setString(14, car.getEngineCapacity());
            myPs.setString(15, car.getFuelType());
            myPs.setString(16, car.getOriginStatus());
            myPs.setString(17, car.getUseClass());
            myPs.setString(18, car.getBodyType());
            myPs.setInt(19, car.getYearMade());
            myPs.setString(20, car.getRegDate());
            myPs.setString(21, car.getBdm_bgk());
            myPs.setString(22, car.getBtm());
            myPs.setString(23, car.getDescription());
            myPs.setString(24, car.getGrant1());
            myPs.setString(25, car.getGrant2());
            myPs.setString(26, car.getImage1());
            myPs.setString(27, car.getImage2());
            myPs.setString(28, car.getImage3());
            myPs.setString(29, car.getImage4());
            myPs.setString(30, car.getImage5());
            result = myPs.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public List<Car> retrieveAllCar()
    {
        List<Car> carAll = new ArrayList<Car>();
        Car car;

        
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from car";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            
            while (myRs.next()){
                car = new Car();
                car.setCarID(myRs.getString(1));
                car.setCarName(myRs.getString(2));
                car.setCarStatus(myRs.getString(3));
                car.setColor(myRs.getString(4));
                car.setSellingPrice(myRs.getString(5));
                car.setConditions(myRs.getString(6));
                car.setId(myRs.getString(7));
                car.setOwnerName(myRs.getString(8));
                car.setOwnerAddress(myRs.getString(9));
                car.setEngineNo(myRs.getString(10));
                car.setChassisNo(myRs.getString(11));
                car.setMadeBy(myRs.getString(12));
                car.setModel(myRs.getString(13));
                car.setEngineCapacity(myRs.getString(14));
                car.setFuelType(myRs.getString(15));
                car.setOriginStatus(myRs.getString(16));
                car.setUseClass(myRs.getString(17));
                car.setBodyType(myRs.getString(18));
                car.setYearMade(myRs.getInt(19));
                car.setRegDate(myRs.getString(20));
                car.setBdm_bgk(myRs.getString(21));
                car.setBtm(myRs.getString(22));
                car.setDescription(myRs.getString(23));
                car.setGrant1(myRs.getString(24));
                car.setGrant2(myRs.getString(25));
                car.setImage1(myRs.getString(26));
                car.setImage2(myRs.getString(27));
                car.setImage3(myRs.getString(28));
                car.setImage4(myRs.getString(29));
                car.setImage5(myRs.getString(30));
                carAll.add(car);
            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return carAll;
    }
    
    public Car retrieveOneCar (String carID)
    {
        Car car = new Car();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from car where carID = " + carID;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            
            while (myRs.next())
            {
                car.setCarID(myRs.getString(1));
                car.setCarName(myRs.getString(2));
                car.setCarStatus(myRs.getString(3));
                car.setColor(myRs.getString(4));
                car.setSellingPrice(myRs.getString(5));
                car.setConditions(myRs.getString(6));
                car.setId(myRs.getString(7));
                car.setOwnerName(myRs.getString(8));
                car.setOwnerAddress(myRs.getString(9));
                car.setEngineNo(myRs.getString(10));
                car.setChassisNo(myRs.getString(11));
                car.setMadeBy(myRs.getString(12));
                car.setModel(myRs.getString(13));
                car.setEngineCapacity(myRs.getString(14));
                car.setFuelType(myRs.getString(15));
                car.setOriginStatus(myRs.getString(16));
                car.setUseClass(myRs.getString(17));
                car.setBodyType(myRs.getString(18));
                car.setYearMade(myRs.getInt(19));
                car.setRegDate(myRs.getString(20));
                car.setBdm_bgk(myRs.getString(21));
                car.setBtm(myRs.getString(22));
                car.setDescription(myRs.getString(23));
                car.setGrant1(myRs.getString(24));
                car.setGrant2(myRs.getString(25));
                car.setImage1(myRs.getString(26));
                car.setImage2(myRs.getString(27));
                car.setImage3(myRs.getString(28));
                car.setImage4(myRs.getString(29));
                car.setImage5(myRs.getString(30));
            }
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return car;
    }
    
    public int updateCar(Car car)
    {
        try {
            String mySqlQuery = "update car set carName=?, carStatus=?, color=?, sellingPrice=?, conditions=?, description=? where carID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            
            myPs.setString(1, car.getCarName());
            myPs.setString(2, car.getCarStatus());
            myPs.setString(3, car.getColor());
            myPs.setString(4, car.getSellingPrice());
            myPs.setString(5, car.getConditions());
            myPs.setString(6, car.getDescription());
            myPs.setString(7, car.getCarID());
            
            result = myPs.executeUpdate();
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public int deleteCar (String carID) 
    {
        try {
            String mySqlQuery = "delete from car where carID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, carID);
            result = myPs.executeUpdate();
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public List<Car> retrieveLoc() {
        List<Car> carAll = new ArrayList<Car>();
        Car loc;

        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from car";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()) {
                loc = new Car();
                loc.setCarID(myRs.getString(1));
                loc.setCarName(myRs.getString(2));
                loc.setCarStatus(myRs.getString(3));
                loc.setColor(myRs.getString(4));
                loc.setSellingPrice(myRs.getString(5));
                loc.setConditions(myRs.getString(6));
                loc.setId(myRs.getString(7));
                loc.setOwnerName(myRs.getString(8));
                loc.setOwnerAddress(myRs.getString(9));
                loc.setEngineNo(myRs.getString(10));
                loc.setChassisNo(myRs.getString(11));
                loc.setMadeBy(myRs.getString(12));
                loc.setModel(myRs.getString(13));
                loc.setEngineCapacity(myRs.getString(14));
                loc.setFuelType(myRs.getString(15));
                loc.setOriginStatus(myRs.getString(16));
                loc.setUseClass(myRs.getString(17));
                loc.setBodyType(myRs.getString(18));
                loc.setYearMade(myRs.getInt(19));
                loc.setRegDate(myRs.getString(20));
                loc.setBdm_bgk(myRs.getString(21));
                loc.setBtm(myRs.getString(22));
                loc.setDescription(myRs.getString(23));
                loc.setGrant1(myRs.getString(24));
                loc.setGrant2(myRs.getString(25));
                loc.setImage1(myRs.getString(26));
                loc.setImage2(myRs.getString(27));
                loc.setImage3(myRs.getString(28));
                loc.setImage4(myRs.getString(29));
                loc.setImage5(myRs.getString(30));
                
                carAll.add(loc);
            }

        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }

        return carAll;
    }
    
}
