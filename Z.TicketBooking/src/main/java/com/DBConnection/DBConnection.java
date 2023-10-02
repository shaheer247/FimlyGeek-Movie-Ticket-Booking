package com.DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static Connection connection;
    private static final String jdbcUrl = "jdbc:mysql://localhost:3306/filmygeek";
    private static final String dbUser = "root";
    private static final String dbPassword = "root";

    public static Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) {
                // Create a new connection if it doesn't exist or is closed
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcUrl, dbUser, dbPassword);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public static void closeConnection() {
        try {
            if (connection != null && !connection.isClosed()) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
