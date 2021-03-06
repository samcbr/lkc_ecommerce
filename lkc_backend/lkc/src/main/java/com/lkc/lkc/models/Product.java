package com.lkc.lkc.models;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "product")
public class Product {
    @Id
    private String id;
    private String brand;
    private String color;
    private String image;
    private String model;
    private double price;
    private boolean top;
    private String type;
    private double quantity;
    private int numberOfRatings;
    private int rating;

    public Product(String brand, String color, String id, String image, String model, double price, boolean top,
            String type, double quantity, int numberOfRatings, int rating) {
        this.brand = brand;
        this.color = color;
        this.id = id;
        this.image = image;
        this.model = model;
        this.price = price;
        this.top = top;
        this.type = type;
        this.quantity = quantity;
        this.numberOfRatings = numberOfRatings;
        this.rating = rating;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getBrand() {
        return this.brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getColor() {
        return this.color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getImage() {
        return this.image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getModel() {
        return this.model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public double getPrice() {
        return this.price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public boolean isTop() {
        return this.top;
    }

    public boolean getTop() {
        return this.top;
    }

    public void setTop(boolean top) {
        this.top = top;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public double getQuantity() {
        return this.quantity;
    }

    public void setQuantity(double quantity) {
        this.quantity = quantity;
    }

    public int getNumberOfRatings() {
        return this.numberOfRatings;
    }

    public void setNumberOfRatings(int numberOfRatings) {
        this.numberOfRatings = numberOfRatings;
    }

    public int getRating() {
        return this.rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public Product id(String id) {
        this.id = id;
        return this;
    }

    public Product brand(String brand) {
        this.brand = brand;
        return this;
    }

    public Product color(String color) {
        this.color = color;
        return this;
    }

    public Product image(String image) {
        this.image = image;
        return this;
    }

    public Product model(String model) {
        this.model = model;
        return this;
    }

    public Product price(double price) {
        this.price = price;
        return this;
    }

    public Product top(boolean top) {
        this.top = top;
        return this;
    }

    public Product type(String type) {
        this.type = type;
        return this;
    }

    public Product quantity(double quantity) {
        this.quantity = quantity;
        return this;
    }

    public Product numberOfRatings(int numberOfRatings) {
        this.numberOfRatings = numberOfRatings;
        return this;
    }

    public Product rating(int rating) {
        this.rating = rating;
        return this;
    }

    @Override
    public String toString() {
        return "{" + " id='" + getId() + "'" + ", brand='" + getBrand() + "'" + ", color='" + getColor() + "'"
                + ", image='" + getImage() + "'" + ", model='" + getModel() + "'" + ", price='" + getPrice() + "'"
                + ", top='" + isTop() + "'" + ", type='" + getType() + "'" + ", quantity='" + getQuantity() + "'"
                + ", numberOfRatings='" + getNumberOfRatings() + "'" + ", rating='" + getRating() + "'" + "}";
    }

}
