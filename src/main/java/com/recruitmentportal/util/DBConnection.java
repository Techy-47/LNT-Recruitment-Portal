/**
 * Utility class used during development
 * to generate BCrypt password hashes.
 */

package com.recruitmentportal.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    private static final String URL =
            "jdbc:mysql://localhost:3306/recruitment_portal";

    private static final String USERNAME = "root";

    private static final String PASSWORD = "root123";

    public static Connection getConnection() {

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection connection =
                    DriverManager.getConnection(
                            URL,
                            USERNAME,
                            PASSWORD
                    );

            return connection;

        } catch (Exception e) {

            e.printStackTrace();

        }

        return null;
    }
}