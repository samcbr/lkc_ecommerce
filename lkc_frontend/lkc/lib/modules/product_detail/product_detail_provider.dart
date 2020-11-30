import 'package:flutter/widgets.dart';
import 'package:lkc/models/adapter.dart';
import 'package:lkc/models/battery.dart';
import 'package:lkc/models/cable.dart';
import 'package:lkc/models/door_bell.dart';
import 'package:lkc/models/extension_board.dart';
import 'package:lkc/models/immuno_booster.dart';
import 'package:lkc/models/led.dart';
import 'package:lkc/models/mask.dart';
import 'package:lkc/models/multi_plug.dart';
import 'package:lkc/models/response.dart';
import 'package:lkc/models/sanitizer.dart';
import 'package:lkc/modules/home/home_provider.dart';
import 'package:lkc/repository/apiBaseHelper.dart';

class ProductDetailProvider extends ChangeNotifier {
  NotifierState notifierState = NotifierState.initial;
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  Future<ExtensionBoard> getExtensionBoardById(String id) async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/extensionBoards/$id');
      notifierState = NotifierState.loaded;
      notifyListeners();
      return ExtensionBoard.fromJson(responseLKC.data);
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }
  Future<Adapter> getAdapterById(String id) async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/adapters/$id');
      notifierState = NotifierState.loaded;
      notifyListeners();
      return Adapter.fromJson(responseLKC.data);
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }
  Future<Battery> getBatteryById(String id) async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/batteries/$id');
      notifierState = NotifierState.loaded;
      notifyListeners();
      return Battery.fromJson(responseLKC.data);
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }
  Future<Cable> getCableById(String id) async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/cables/$id');
      notifierState = NotifierState.loaded;
      notifyListeners();
      return Cable.fromJson(responseLKC.data);
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }
  Future<DoorBell> getDoorBellById(String id) async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/doorBells/$id');
      notifierState = NotifierState.loaded;
      notifyListeners();
      return DoorBell.fromJson(responseLKC.data);
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }
  Future<ImmunoBooster> getImmunoBoosterById(String id) async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/immunoBoosters/$id');
      notifierState = NotifierState.loaded;
      notifyListeners();
      return ImmunoBooster.fromJson(responseLKC.data);
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }
  Future<Led> getLedById(String id) async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/leds/$id');
      notifierState = NotifierState.loaded;
      notifyListeners();
      return Led.fromJson(responseLKC.data);
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }
  Future<Mask> getMaskById(String id) async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/masks/$id');
      notifierState = NotifierState.loaded;
      notifyListeners();
      return Mask.fromJson(responseLKC.data);
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }
  Future<MultiPlug> getMultiPlugById(String id) async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/multiPlugs/$id');
      notifierState = NotifierState.loaded;
      notifyListeners();
      return MultiPlug.fromJson(responseLKC.data);
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }
  Future<Sanitizer> getSanitizerById(String id) async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/sanitizers/$id');
      notifierState = NotifierState.loaded;
      notifyListeners();
      return Sanitizer.fromJson(responseLKC.data);
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }
}
