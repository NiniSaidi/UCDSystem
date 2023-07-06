/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.UCDSystem;

/**
 *
 * @author User
 */
public class TestDriveBooking {
    
    private int formID;
    private String buyerID;
    private String carID;
    private String bookingDate;
    private String description;
    private String bookingStatus;

    public int getFormID() {
        return formID;
    }

    public String getBuyerID() {
        return buyerID;
    }

    public String getCarID() {
        return carID;
    }

    public String getBookingDate() {
        return bookingDate;
    }

    public String getDescription() {
        return description;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public void setFormID(int formID) {
        this.formID = formID;
    }

    public void setBuyerID(String buyerID) {
        this.buyerID = buyerID;
    }

    public void setCarID(String carID) {
        this.carID = carID;
    }

    public void setBookingDate(String bookingDate) {
        this.bookingDate = bookingDate;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }
    
    
}
