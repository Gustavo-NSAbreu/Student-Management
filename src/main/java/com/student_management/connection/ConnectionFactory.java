package com.student_management.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionFactory {

    private ConnectionFactory() {}

    public static Connection connect() {
        
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            return DriverManager.getConnection("jdbc:postgresql://postgresql:5432/postgres", "postgres", "1234");
        } catch (SQLException exception) {
            exception.printStackTrace();
            return null;
        }
    }
}
