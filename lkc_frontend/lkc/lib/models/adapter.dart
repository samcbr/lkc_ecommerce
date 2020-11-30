import 'package:lkc/models/product.dart';

class Adapter extends Product {
  Adapter(
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

  factory Adapter.fromJson(Map<String, dynamic> map) {
    return Adapter(
        brand: map['brand'],
        id: map['id'],
        image: map['image'],
        model: map['model'],
        price: map['price'],
        color: map['color'],
        top: map['top']);
  }
}
