import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lkc/models/user.dart';
import 'package:lkc/modules/authenticator/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  Function toggle;
  LoginScreen(Function f) {
    this.toggle = f;
  }
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: Container(
        color: Colors.amber,
        height: double.infinity,
        padding: EdgeInsets.all(20),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter your Email', labelText: 'Email'),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          hintText: 'Enter your Password',
                          labelText: 'Password'),
                      obscureText: true,
                    ),
                    SizedBox(
                      height: 64,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        User user = await authProvider.doLogin("", "");
                        print(user.authToken);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    GestureDetector(
                      onTap: () => toggle(),
                      child: Align(
                        child: Text(
                          'Not registered yet? Register',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
