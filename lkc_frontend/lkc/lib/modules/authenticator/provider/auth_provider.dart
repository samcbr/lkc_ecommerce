import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:lkc/models/response.dart';
import 'package:lkc/models/result.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lkc/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

//freezed,superenum
class AuthProvider extends ChangeNotifier {
  static SharedPreferences sharedPreferences;
  User user;

  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<User> doLogin(String userId, String password) async {
    try {
      Response response = await http.post(
        'https://salty-garden-74113.herokuapp.com/login',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          <String, String>{"userName": "hhh", "password": "hhh"},
        ),
      );
      print(response.body);
      if (response.statusCode == 200) {
        ResponseLKC responseLKC =
            ResponseLKC.fromJson(jsonDecode(response.body));

        user = User.fromJson(responseLKC.data);
        print(user.authToken);
        await sharedPreferences.setString('authToken', user.authToken);
        await sharedPreferences.setString('firstName', user.firstName);
        await sharedPreferences.setString('lastName', user.lastName);
        await sharedPreferences.setString('userId', user.userId);
        notifyListeners();
      }
      print(user);
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<bool> doLogout() async {
    try {
      await sharedPreferences.clear();
      notifyListeners();
      return true;
    } catch (e) {
      notifyListeners();
      return false;
    }
  }
}
