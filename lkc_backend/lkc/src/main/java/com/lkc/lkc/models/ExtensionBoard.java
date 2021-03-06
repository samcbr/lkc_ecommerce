package com.lkc.lkc.models;

import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "product")
@TypeAlias("extensionBoard")
public class ExtensionBoard extends Product {

    public ExtensionBoard(String brand, String color, String id, String image, String model, double price, boolean top,
            String type, double quantity, int numberOfRatings, int rating) {
        super(brand, color, id, image, model, price, top, type, quantity, numberOfRatings, rating);
    }

}
