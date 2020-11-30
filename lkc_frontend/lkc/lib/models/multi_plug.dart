import 'package:lkc/models/product.dart';

class MultiPlug extends Product {
  MultiPlug(
      {String id,
      String brand,
      String color,
      String image,
      String model,
      double price,
      bool top})
      : super(
          brand: brand,
          id: id,
          model: model,
          price: price,
          image: image,
          color: color,
          top: top,
        );

  factory MultiPlug.fromJson(Map<String, dynamic> map) {
    return MultiPlug(
        brand: map['brand'],
        id: map['id'],
        image: map['image'],
        model: map['model'],
        price: map['price'],
        color: map['color'],
        top: map['top']);
  }
}
