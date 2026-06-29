package com.lnt.model;

import java.time.LocalDateTime;

public class Employer {
    private Long employerId;
    private String companyName;
    private String email;
    private String passwordHash;
    private String industry;
    private String website;
    private LocalDateTime createdAt;

    public Employer() {}

    public Long getEmployerId() { return employerId; }
    public void setEmployerId(Long employerId) { this.employerId = employerId; }
    public String getCompanyName() { return companyName; }
    public void setCompanyName(String companyName) { this.companyName = companyName; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPasswordHash() { return passwordHash; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }
    public String getIndustry() { return industry; }
    public void setIndustry(String industry) { this.industry = industry; }
    public String getWebsite() { return website; }
    public void setWebsite(String website) { this.website = website; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
