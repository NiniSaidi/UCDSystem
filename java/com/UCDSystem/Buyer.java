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
public class Buyer {
    
    private String buyerID;
    private String buyerFirstName;
    private String buyerLastName;
    private String buyerPhoneNo;
    private String buyerEmail;
    private String buyerAddress;
    private String buyerPw;
    private int userCode;

    public String getBuyerID() {
        return buyerID;
    }

    public String getBuyerFirstName() {
        return buyerFirstName;
    }

    public String getBuyerLastName() {
        return buyerLastName;
    }

    public String getBuyerPhoneNo() {
        return buyerPhoneNo;
    }

    public String getBuyerEmail() {
        return buyerEmail;
    }

    public String getBuyerAddress() {
        return buyerAddress;
    }

    public String getBuyerPw() {
        return buyerPw;
    }

    public int getUserCode() {
        return userCode;
    }

    public void setBuyerID(String buyerID) {
        this.buyerID = buyerID;
    }
    
    public void setBuyerFirstName(String buyerFirstName) {
        this.buyerFirstName = buyerFirstName;
    }

    public void setBuyerLastName(String buyerLastName) {
        this.buyerLastName = buyerLastName;
    }

    public void setBuyerPhoneNo(String buyerPhoneNo) {
        this.buyerPhoneNo = buyerPhoneNo;
    }

    public void setBuyerEmail(String buyerEmail) {
        this.buyerEmail = buyerEmail;
    }

    public void setBuyerAddress(String buyerAddress) {
        this.buyerAddress = buyerAddress;
    }

    public void setBuyerPw(String buyerPw) {
        this.buyerPw = buyerPw;
    }

    public void setUserCode(int userCode) {
        this.userCode = userCode;
    }
    
}
