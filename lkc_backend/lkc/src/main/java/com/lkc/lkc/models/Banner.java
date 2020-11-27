package com.lkc.lkc.models;

import org.springframework.data.annotation.Id;

public class Banner {
    @Id
    public String url;

    public Banner(String url)
    {
        this.url=url;
    }
}
