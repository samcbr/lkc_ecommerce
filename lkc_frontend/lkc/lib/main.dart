import 'package:flutter/material.dart';
import 'package:lkc/modules/authenticator/provider/auth_provider.dart';
import 'package:lkc/modules/authenticator/screen/authenticator.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthProvider.init(); //Initializing shared preference instance
  runApp(
    ChangeNotifierProvider<AuthProvider>(
      create: (context) => AuthProvider(),
      child: MaterialApp(
        home: Authenticator(),
      ),
    ),
  );
}
//to do create my app widget
//splash screen with timer
//postframecallback 
