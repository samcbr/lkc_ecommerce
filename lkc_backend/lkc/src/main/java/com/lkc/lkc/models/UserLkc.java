package com.lkc.lkc.models;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

@Document(collection = "userLkc")
@TypeAlias("user")
public class UserLkc {

    private String userName;
    @Id
    private String email;

    private String password;
    private String phoneNumber;
    private List<Product> cart;
    private String address;

    public UserLkc(String email, String password, String userName, String phoneNumber) {
        // TODO Auto-generated constructor stub
        this.userName = userName;
        this.email = email;
        this.password = password;
        this.phoneNumber = phoneNumber;
        address="";
        cart=new ArrayList<Product>();
    }



    public List<Product> getCart() {
        return this.cart;
    }

    public void setCart(List<Product> cart) {
        this.cart = cart;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getUserName() {
        return this.userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return this.email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return this.phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getPassword() {
        return this.password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    /**
     *
     */
    private static final long serialVersionUID = -8037798663593625823L;

}
