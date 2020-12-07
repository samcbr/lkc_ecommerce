package com.lkc.lkc.models;

import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "product")
@TypeAlias("multiPlug")
public class MultiPlug extends Product {
    public MultiPlug(String brand, String color, String id, String image, String model, double price, boolean top,
            String type, double quantity, int numberOfRatings, int rating) {
        super(brand, color, id, image, model, price, top, type, quantity, numberOfRatings, rating);
    }
}
