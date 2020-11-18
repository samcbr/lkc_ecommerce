package com.lkc.lkc.models;

public class Login {
    private String userName;
    private String password;

    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Login(String userName, String password) {
        this.userName = userName;
        this.password = password;
    }

}
