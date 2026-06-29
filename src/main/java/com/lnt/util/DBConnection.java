package com.lnt.util;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

import java.sql.Connection;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/recruitment_portal?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
    private static final String USER = System.getenv().getOrDefault("DB_USER", "root");
    private static final String PASS = System.getenv().getOrDefault("DB_PASS", "root123");
    private static final int MAX_POOL_SIZE = Integer.parseInt(System.getenv().getOrDefault("DB_POOL_SIZE", "10"));
    private static final long CONNECTION_TIMEOUT_MS = Long.parseLong(System.getenv().getOrDefault("DB_CONNECTION_TIMEOUT_MS", "30000"));

    private static final HikariDataSource DATA_SOURCE = buildDataSource();

    private static HikariDataSource buildDataSource() {
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl(URL);
        config.setUsername(USER);
        config.setPassword(PASS);
        config.setDriverClassName("com.mysql.cj.jdbc.Driver");
        config.setMaximumPoolSize(MAX_POOL_SIZE);
        config.setConnectionTimeout(CONNECTION_TIMEOUT_MS);
        config.setPoolName("recruitment-portal-pool");
        config.setLeakDetectionThreshold(60000);
        return new HikariDataSource(config);
    }

    public static Connection getConnection() throws SQLException {
        return DATA_SOURCE.getConnection();
    }

    public static void shutdown() {
        if (!DATA_SOURCE.isClosed()) {
            DATA_SOURCE.close();
        }
    }
}
