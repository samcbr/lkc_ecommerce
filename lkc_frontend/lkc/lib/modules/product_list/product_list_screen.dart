import 'package:after_init/after_init.dart';
import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:lkc/models/product.dart';
import 'package:lkc/models/sanitizer.dart';
import 'package:lkc/models/stand.dart';
import 'package:lkc/modules/home/home_provider.dart';
import 'package:lkc/modules/product_detail/product_detail_screen.dart';
import 'package:lkc/modules/product_list/product_list_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class ProductListScreen extends StatefulWidget {
  final Type type;

  ProductListScreen(this.type);
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen>
    with AfterInitMixin<ProductListScreen> {
  List<dynamic> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () {},
          )
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
          color: Colors.black,
        ),
      ),
      body: Consumer<ProductListProvider>(
        builder: (context, value, child) {
          return value.notifierState == NotifierState.loaded
              ? products.length == 0
                  ? Container(
                      child: Center(
                        child: Text('No items of this type are available!!!'),
                      ),
                    )
                  : GridView.builder(
                      physics: BouncingScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: products.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return productCard(products[index], index);
                      },
                    )
              : GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: 20,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[500],
                        highlightColor: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 9,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                child: Image.asset('assets/icons/stand.png'),
                              ),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: SizedBox(
                                  width: 60,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }

  @override
  void didInitState() async {
    // TODO: implement didInitState
    Type type = widget.type;
    ProductListProvider productListProvider =
        Provider.of<ProductListProvider>(context);
    switch (type) {
      case Alarm:
        products = await productListProvider.getAlarms();
        break;
      case Adapter:
        products = await productListProvider.getAdapters();
        break;
      case Battery:
        products = await productListProvider.getBatteries();
        break;
      case Cable:
        products = await productListProvider.getCables();
        break;
      case DoorBell:
        products = await productListProvider.getDoorBells();
        break;
      case ExtensionBoard:
        products = await productListProvider.getExtensionBoards();
        break;
      case ImmunoBooster:
        products = await productListProvider.getImmunoBoosters();
        break;
      case Led:
        products = await productListProvider.getLeds();
        break;
      case Mask:
        products = await productListProvider.getMasks();
        break;
      case Sanitizer:
        products = await productListProvider.getSanitizers();
        break;
      case Stand:
        products = await productListProvider.getStands();
        break;
      default:
    }
  }

  Widget productCard(dynamic product, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(widget.type, product),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Image.network(product.image),
                color: HexColor(product.color),
              ),
              flex: 9,
            ),
            SizedBox(
              height: 4,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: AutoSizeText(
                  product.brand + ' ' + product.model,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                  maxLines: 2,
                  minFontSize: 9,
                ),
              ),
              flex: 1,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 8),
                child: AutoSizeText(
                  '₹' + product.price.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                ),
              ),
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
