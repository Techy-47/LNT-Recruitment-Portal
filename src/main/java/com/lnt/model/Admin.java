package com.lnt.model;

public class Admin {
    private Long adminId;
    private String username;
    private String passwordHash;

    public Long getAdminId() { return adminId; }
    public void setAdminId(Long adminId) { this.adminId = adminId; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPasswordHash() { return passwordHash; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }
}
