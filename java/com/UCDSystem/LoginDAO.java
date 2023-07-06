/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.UCDSystem;

import java.sql.Connection;

/**
 *
 * @author User
 */
public class LoginDAO {
    
    private final Connection connection;
    private int result;
    
    public LoginDAO()
    {
        connection = DBConnection.getConnection();
    }
    
}
