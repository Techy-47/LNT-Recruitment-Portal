package com.lnt.util;

import java.sql.Connection;
import java.sql.SQLException;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

public class DBConnection {

    private static final String HOST = System.getenv().getOrDefault("DB_HOST", "localhost");
    private static final String PORT = System.getenv().getOrDefault("DB_PORT", "3306");
    private static final String DATABASE = System.getenv().getOrDefault("DB_NAME", "recruitment_portal");

    private static final String USER = System.getenv().getOrDefault("DB_USER", "root");

    private static final String PASS = System.getenv().getOrDefault("DB_PASS", "root123");

    private static final String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE
            + "?sslMode=REQUIRED&serverTimezone=UTC"
            + "&allowPublicKeyRetrieval=true"
            + "&serverTimezone=UTC";

    private static final int MAX_POOL_SIZE = Integer.parseInt(System.getenv().getOrDefault("DB_POOL_SIZE", "10"));

    private static final long CONNECTION_TIMEOUT_MS = Long
            .parseLong(System.getenv().getOrDefault("DB_CONNECTION_TIMEOUT_MS", "30000"));

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