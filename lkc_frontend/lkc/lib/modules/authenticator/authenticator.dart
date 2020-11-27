import 'package:flutter/material.dart';
import 'package:lkc/modules/authenticator/auth_provider.dart';
import 'package:lkc/modules/home/home_screen.dart';
import 'package:lkc/modules/login/login_screen.dart';
import 'package:lkc/modules/register/register_screen.dart';
import 'package:provider/provider.dart';

class Authenticator extends StatefulWidget {
  @override
  _AuthenticatorState createState() => _AuthenticatorState();
}

class _AuthenticatorState extends State<Authenticator> {
  bool toggle = true;
  togglef() {
    setState(() {
      toggle = !toggle;
      print(toggle);
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    print(authProvider.user);
    print(AuthProvider.sharedPreferences.getString('authToken'));
    return Scaffold(
      body: AuthProvider.sharedPreferences.getString('authToken') == null
          ? toggle
              ? LoginScreen(togglef)
              : RegisterScreen(togglef)
          : HomeScreen(),
    );
  }
}
