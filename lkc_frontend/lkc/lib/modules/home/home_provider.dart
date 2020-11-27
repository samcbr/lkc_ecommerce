import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:lkc/models/extension_board.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lkc/models/response.dart';
import 'package:lkc/repository/ApiBaseHelper.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum NotifierState { initial, loaded, error }

class HomeProvider extends ChangeNotifier {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  NotifierState extensionBoardState = NotifierState.initial;
  NotifierState multiPlugState = NotifierState.initial;
  NotifierState bannerState = NotifierState.initial;

  Future<List<ExtensionBoard>> getExtensionBoards(String url) async {
    try {
      ResponseLKC response = await apiBaseHelper.get(url);
      extensionBoardState = NotifierState.loaded;
      notifyListeners();
      List<ExtensionBoard> extensionBoards = List.from(response.data)
          .map((e) => ExtensionBoard.fromJson(e))
          .toList();
      return extensionBoards;
    } catch (e) {
      extensionBoardState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  Future<dynamic> getMultiplugs(String url) async {
    try {
      ResponseLKC response = await apiBaseHelper.get(url);
      extensionBoardState = NotifierState.loaded;
      notifyListeners();
      return response.data;
    } catch (e) {
      extensionBoardState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  Future<dynamic> getBanners(String url) async {
    try {
      ResponseLKC response = await apiBaseHelper.get(url);
      bannerState = NotifierState.loaded;
      notifyListeners();
      List<String> banners =
          List.from(response.data).map((e) => e.toString()).toList();
      print(banners);
      return banners;
    } catch (e) {
      bannerState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    extensionBoardState = NotifierState.initial;
    multiPlugState = NotifierState.initial;
    super.dispose();
  }
}

class BannerProvider extends ChangeNotifier {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  NotifierState notifierState = NotifierState.initial;
  Future<dynamic> get(String url) async {
    await ApiBaseHelper.init();
    try {
      ResponseLKC response = await apiBaseHelper.get(url);
      notifierState = NotifierState.loaded;
      print(response.data.runtimeType);

      notifyListeners();
      return response.data;
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    notifierState = NotifierState.initial;
    super.dispose();
  }
}
