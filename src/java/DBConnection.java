package com.myapp;
import java.sql.*;

public class DBConnection {

    public static Connection getConnection() {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            return DriverManager.getConnection(
                "jdbc:derby://localhost:1527/student_profiles",
                "app",
                "app"
            );
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
