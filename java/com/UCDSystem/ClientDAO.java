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
public class ClientDAO {
    
    private final Connection connection;
    private int result;
    
    public ClientDAO()
    {
        connection = DBConnection.getConnection();
    }
    
    public int addClient(Client client)
    {
        try{
            String mySqlQuey = "INSERT INTO client (clientID, clientFirstName, clientLastName, clientPhoneNo, clientEmail, clientAddress, clientPw) VALUES(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement myPS = connection.prepareStatement(mySqlQuey);
            myPS.setString(1, client.getClientID());
            myPS.setString(2, client.getClientFirstName());
            myPS.setString(3, client.getClientLastName());
            myPS.setString(4, client.getClientPhoneNo());
            myPS.setString(5, client.getClientEmail());
            myPS.setString(6, client.getClientAddress());
            myPS.setString(7, client.getClientPw());
            result = myPS.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public List<Client> retrieveAllClient()
    {
        List<Client> clientAll = new ArrayList<Client>();
        Client client;
        
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from client";
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next()){
                client = new Client();
                client.setClientID(myRs.getString(1));
                client.setClientFirstName(myRs.getString(2));
                client.setClientLastName(myRs.getString(3));
                client.setClientPhoneNo(myRs.getString(4));
                client.setClientEmail(myRs.getString(5));
                client.setClientAddress(myRs.getString(6));
                client.setClientPw(myRs.getString(7));
                clientAll.add(client);
            }
        } catch (Exception e) {
            System.out.println("Exception is ;" + e);
        }
        return clientAll;
    }
    
    public Client retrieveOneClient (int clientID)
    {
        Client client = new Client();
        try {
            Statement myStatement = connection.createStatement();
            String myQuery = "select * from client where clientID = " + clientID;
            ResultSet myRs = myStatement.executeQuery(myQuery);
            while (myRs.next())
            {
                client.setClientID(myRs.getString(1));
                client.setClientFirstName(myRs.getString(2));
                client.setClientLastName(myRs.getString(3));
                client.setClientPhoneNo(myRs.getString(4));
                client.setClientEmail(myRs.getString(5));
                client.setClientAddress(myRs.getString(6));
                client.setClientPw(myRs.getString(7));
            }
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return client;
    }
    
    public int deleteClient (String clientID) 
    {
        try {
            String mySqlQuery = "delete from client where clientID=?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, clientID);
            result = myPs.executeUpdate();
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
    
    public int clientlogin (Client client)
    {
        try {
            String mySqlQuery = "select * from client where clientID = ? and clientPw = ?";
            PreparedStatement myPs = connection.prepareStatement(mySqlQuery);
            myPs.setString(1, client.getClientID());
            myPs.setString(2, client.getClientFirstName());
            result = myPs.executeUpdate();
        } catch (Exception e){
            System.out.println("Exception is ;" + e);
        }
        return result;
    }
}
