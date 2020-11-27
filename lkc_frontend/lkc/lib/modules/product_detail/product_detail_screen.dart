import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final String productId;
  final String type;
  ProductDetailScreen(this.type,this.productId);
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
