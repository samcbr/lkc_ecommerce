import 'dart:io';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import 'package:lkc/interceptors/base_api_interceptor.dart';
import 'package:lkc/models/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiBaseHelper {
  static SharedPreferences sharedPreference;
  static const String BASE_URL="https://fathomless-eyrie-36491.herokuapp.com";
  static init() async {
       sharedPreference = await SharedPreferences.getInstance();
  }

  HttpClientWithInterceptor client =
      HttpClientWithInterceptor.build(interceptors: [
    BaseApiInterceptor(),
  ]);

  Future<ResponseLKC> get(String url) async {
    try {
      Response response = await client.get(
        BASE_URL+url,
      );
      if (response.statusCode == 200) {
        ResponseLKC responseLKC = ResponseLKC.fromJson(response.body);

        return responseLKC;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
