package com.lnt.model;

import java.time.LocalDateTime;

public class Candidate {
    private Long candidateId;
    private String fullName;
    private String email;
    private String passwordHash;
    private String phone;
    private String education;
    private String skills;
    private String resumePath;
    private LocalDateTime createdAt;

    public Candidate() {}

    public Long getCandidateId() { return candidateId; }
    public void setCandidateId(Long candidateId) { this.candidateId = candidateId; }
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    public String getPasswordHash() { return passwordHash; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }
    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }
    public String getEducation() { return education; }
    public void setEducation(String education) { this.education = education; }
    public String getSkills() { return skills; }
    public void setSkills(String skills) { this.skills = skills; }
    public String getResumePath() { return resumePath; }
    public void setResumePath(String resumePath) { this.resumePath = resumePath; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
}
