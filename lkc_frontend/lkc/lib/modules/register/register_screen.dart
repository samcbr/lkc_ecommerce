import 'package:flutter/material.dart';
import 'package:lkc/modules/authenticator/provider/auth_provider.dart';

class RegisterScreen extends StatelessWidget {
  Function toggle;
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String confirmPassword;
  String passwordStr;
  String name;
  RegisterScreen(this.toggle);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Form(
            key: _formKey,
            child: ListView(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 200,
                  width: 200,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter an Email";
                    } else
                      return null;
                  },
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Email', hintText: 'Enter your Email'),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter your Name";
                    } else
                      return null;
                  },
                  onChanged: (value) {
                    name = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Name', hintText: 'Enter your Name'),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter a Password";
                    } else if (value.length < 5) {
                      return "Password must be atleast 5 characters long";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                      labelText: 'Password', hintText: 'Enter a Password'),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscureText: true,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please enter a Password";
                    } else if (passwordStr != value) {
                      return "Password and confirm password do not match";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    confirmPassword = value;
                    
                  },
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Confirm your Password',
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                ElevatedButton(//wrap with row
                    onPressed: () {

                    },
                    child: Text(
                      'Register',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)))),
                GestureDetector(
                  onTap: () {
                    toggle();
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Already have an account? Login',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
