import 'package:after_init/after_init.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:lkc/models/adapter.dart';
import 'package:lkc/models/alarm.dart';
import 'package:lkc/models/battery.dart';
import 'package:lkc/models/cable.dart';
import 'package:lkc/models/door_bell.dart';
import 'package:lkc/models/extension_board.dart';
import 'package:lkc/models/immuno_booster.dart';
import 'package:lkc/models/led.dart';
import 'package:lkc/models/mask.dart';
import 'package:lkc/models/multi_plug.dart';
import 'package:lkc/models/sanitizer.dart';
import 'package:lkc/models/stand.dart';

class ProductDetailScreen extends StatefulWidget {
  final Type type;
  final dynamic product;
  ProductDetailScreen(this.type, this.product);
  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen>
    with AfterInitMixin<ProductDetailScreen> {
  dynamic product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    padding: EdgeInsets.all(32),
                    color: HexColor(product.color),
                    child: Image.network(
                      product.image,
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                  Container(
                    color: HexColor(product.color),
                    child: Card(
                      color: Colors.grey[50],
                      elevation: 0,
                      margin: EdgeInsets.all(0),
                      child: Container(
                        height: 300,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(32),
                        topRight: Radius.circular(32),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.white,
                      child: Text(
                        'ADD TO CART',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.red[400],
                      child: Text(
                        'BUY NOW',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didInitState() {
    // TODO: implement didInitState
    product = widget.product;
  }
}
