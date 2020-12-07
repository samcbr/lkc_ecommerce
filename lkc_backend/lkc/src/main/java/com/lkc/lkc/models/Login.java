package com.lkc.lkc.models;

public class Login {
    private String email;
    private String password;

    public String getEmail() {
        return this.email;
    }

    public void setUserName(String email) {
        this.email = email;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Login(String email, String password) {
        this.email = email;
        this.password = password;
    }

}
