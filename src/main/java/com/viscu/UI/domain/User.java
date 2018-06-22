package com.viscu.UI.domain;

import java.sql.Timestamp;
import java.util.Date;

public class User {
    private Integer userId;

    private String username;

    private String password;

    private String email;

    private Timestamp createTime;

    private Timestamp lastLoginTime;

    private String userHp;

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Timestamp lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public void setUserHp(String userHp) {
        this.userHp = userHp == null ? null : userHp.trim();
    }

    public String getUserHp() {
        return userHp;
    }

    @Override
    public String toString() {
        return "user"+userId+": "
                +" username: "+username
                +" password: "+password;
    }
}