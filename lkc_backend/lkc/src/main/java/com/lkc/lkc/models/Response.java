package com.lkc.lkc.models;

import java.util.HashMap;

//This application is following JSend
//JSend is a specification for a simple, no-frills, JSON based format for application-level communication.
//github url - https://github.com/omniti-labs/jsend
public class Response {
    private String status;
    private Object data;

    public Response() {
    }

    public Response(String status, Object data) {
        this.status = status;
        this.data = data;
    }

    public String getStatus() {
        return this.status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Object getData() {
        return this.data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public Response status(String status) {
        this.status = status;
        return this;
    }

    public Response data(Object data) {
        this.data = data;
        return this;
    }

   
    @Override
    public String toString() {
        return "{" +
            " status='" + getStatus() + "'" +
            ", data='" + getData() + "'" +
            "}";
    }

}
