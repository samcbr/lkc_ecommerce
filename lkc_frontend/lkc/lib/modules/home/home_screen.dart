import 'package:after_init/after_init.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/flutter_placeholder_textlines.dart';
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
import 'package:lkc/modules/authenticator/auth_provider.dart';
import 'package:lkc/modules/home/home_provider.dart';
import 'package:lkc/modules/product_detail/product_detail_screen.dart';
import 'package:lkc/modules/product_list/product_list_provider.dart';
import 'package:lkc/modules/product_list/product_list_screen.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AfterInitMixin<HomeScreen> {
  AuthProvider authProvider;
  HomeProvider homeProvider;
  BannerProvider bannerProvider;
  List<ExtensionBoard> topExtensionBoards;
  List<String> banners;

  ExtensionBoard extensionBoard;
  Adapter adapter;
  Alarm alarm;
  Battery battery;
  Cable cable;
  DoorBell doorBell;
  ImmunoBooster immunoBooster;
  Led led;
  Mask mask;
  MultiPlug multiPlug;
  Sanitizer sanitizer;
  Stand stand;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(
          Icons.menu,
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.black,
            ),
            onPressed: () {
              //homeProvider.dispose(); Check if this works out
              authProvider.doLogout();
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[200],
        padding: EdgeInsets.only(
          top: 8,
          left: 8,
          right: 8,
        ),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            banner(),
            SizedBox(
              height: 32,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Our Products',
                  style: TextStyle(
                      color: Colors.black,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
            ourProducts(),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Top Extension Boards',
                  style: TextStyle(
                    color: Colors.black,
                    fontStyle: FontStyle.italic,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            getTopExtensionBoards(topExtensionBoards, ExtensionBoard),
          ],
        ),
      ),
    );
  }

  @override
  void didInitState() async {
    // TODO: implement didInitState
    authProvider = Provider.of<AuthProvider>(context);
    homeProvider = Provider.of<HomeProvider>(context);

    banners = await homeProvider.getBanners("/banners");
    topExtensionBoards =
        await homeProvider.getExtensionBoards("/extensionBoards");
  }

  Widget banner() {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        return provider.bannerState == NotifierState.loaded
            ? CarouselSlider.builder(
                itemCount: banners.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      color: Colors.white,
                      width: double.infinity,
                      child: Image.network(banners[index]),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
              )
            : CarouselSlider.builder(
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    baseColor: Colors.blue[50],
                    highlightColor: Colors.white,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      clipBehavior: Clip.antiAlias,
                      child: Container(
                        color: Colors.white,
                        width: double.infinity,
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ));
      },
    );
  }

  Widget ourProducts() {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 3 / 2,
      shrinkWrap: true,
      children: [
        menuItem('Masks', 'mask.png', Mask),
        menuItem('Sanitizers', 'sanitizer.png', Sanitizer),
        menuItem('ImmunoBoosters', 'immune.jpg', ImmunoBooster),
        menuItem('Alarms', 'alarm.png', Alarm),
        menuItem('Extension boards', 'extensionboard.png', ExtensionBoard),
        menuItem('Batteries', 'ledfan.png', Battery),
        menuItem('LED Lights', 'led.png', Led),
        menuItem('Multi Plugs', 'multiplug.png', MultiPlug),
        menuItem('Cables', 'cable.png', Cable),
        menuItem('Door Bells', 'doorbell.png', DoorBell),
        menuItem('Adapters', 'adapter.png', Adapter),
        menuItem('Stands', 'stand.png', Stand),
      ],
    );
  }

  Widget menuItem(String title, String icon, Type type) {
    //function for creating menu item
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ChangeNotifierProvider(
                create: (context) => ProductListProvider(),
                child: ProductListScreen(type),
              );
            },
          ),
        );
      },
      child: Card(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset(
              'assets/icons/' + icon,
              height: 40,
              width: 40,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '$title',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topItem(item, Type type) {
    return GestureDetector(
      
      onTap: () {
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailScreen(type,item),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        margin: EdgeInsets.all(8),
        borderOnForeground: true,
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.network(
                item.image,
                height: 100,
                fit: BoxFit.contain,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                '${item.brand} ${item.model}',
                style: TextStyle(
                    fontSize: 15,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                '₹ ${item.price}',
                style: TextStyle(
                  fontSize: 15,
                  fontStyle: FontStyle.italic,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getTopExtensionBoards(List<ExtensionBoard> products, Type type) {
    return homeProvider.extensionBoardState == NotifierState.loaded
        ? GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            children: [
              topItem(products[0], type),
              topItem(products[1], type),
              topItem(products[2], type),
              topItem(products[3], type),
            ],
          )
        : Card(
            child: PlaceholderLines(
              count: 8,
              align: TextAlign.center,
              color: Colors.blue[50],
              animate: true,
            ),
          );
  }
}
