import 'package:flutter/material.dart';
import 'package:lkc/interceptors/base_api_interceptor.dart';
import 'package:lkc/modules/authenticator/auth_provider.dart';
import 'package:lkc/modules/authenticator/authenticator.dart';
import 'package:lkc/modules/home/home_provider.dart';
import 'package:lkc/repository/ApiBaseHelper.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthProvider.init(); //Initializing shared preference instance
  await ApiBaseHelper.init();
  await BaseApiInterceptor.init();
  runApp(
    MultiProvider(
      //create: (context) => AuthProvider(),
      providers: [
        ChangeNotifierProvider<AuthProvider>(
            create: (context) => AuthProvider()),
        ChangeNotifierProvider<HomeProvider>(
            create: (context) => HomeProvider())
      ],
      child: MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}

//to do create my app widget
//splash screen with timer
//postframecallback
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BannerProvider>(
          create: (context) => BannerProvider(),
        )
      ],
      child: Authenticator(),
    );
  }
}
