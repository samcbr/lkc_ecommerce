import 'package:flutter/material.dart';
import 'package:lkc/modules/authenticator/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Container(
      child: Center(
        child: RaisedButton(
          onPressed: () => authProvider.doLogout(),
        ),
      ),
    );
  }
}
