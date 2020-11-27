import 'dart:convert';

class Product {
  String id;
  String brand;
  String color;
  String image;
  String model;
  double price;
  bool top;

  Product({
    this.id,
    this.brand,
    this.color,
    this.image,
    this.model,
    this.price,
    this.top,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brand': brand,
      'color': color,
      'image': image,
      'model': model,
      'price': price,
      'top': top,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Product(
      id: map['id'],
      brand: map['brand'],
      color: map['color'],
      image: map['image'],
      model: map['model'],
      price: map['price'],
      top: map['top'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}
