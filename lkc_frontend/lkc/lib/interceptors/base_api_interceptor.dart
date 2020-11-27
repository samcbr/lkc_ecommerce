import 'dart:io';

import 'package:http_interceptor/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseApiInterceptor implements InterceptorContract {
  static SharedPreferences sharedPreference;
  static init() async {
    sharedPreference = await SharedPreferences.getInstance();
  }

  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    try {
      data.headers[HttpHeaders.contentTypeHeader] =
          "application/json; charset=UTF-8";
      data.headers[HttpHeaders.authorizationHeader] =
          sharedPreference.getString("authToken");
    } catch (e) {
      print(e);
    }
    print(data);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    print(data.body);
    return data;
  }
}
