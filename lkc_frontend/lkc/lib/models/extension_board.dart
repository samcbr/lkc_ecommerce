import 'package:lkc/models/product.dart';

class ExtensionBoard extends Product {
  ExtensionBoard(
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
            color: color,
            image: image,
            model: model,
            price: price,
            top: top);

  factory ExtensionBoard.fromJson(Map<String, dynamic> map) {
    return ExtensionBoard(
      id: map['id'],
      brand: map['brand'],
      color: map['color'],
      image: map['image'],
      model: map['model'],
      price: map['price'],
      top: map['top']
    );
  }
}
