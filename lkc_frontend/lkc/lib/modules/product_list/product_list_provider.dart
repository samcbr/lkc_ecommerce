import 'package:flutter/widgets.dart';
import 'package:lkc/models/adapter.dart';
import 'package:lkc/models/alarm.dart';
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
import 'package:lkc/models/stand.dart';
import 'package:lkc/modules/home/home_provider.dart';
import 'package:lkc/repository/apiBaseHelper.dart';

class ProductListProvider extends ChangeNotifier {
  ApiBaseHelper apiBaseHelper = ApiBaseHelper();
  NotifierState notifierState = NotifierState.initial;
  
  Future<List<ExtensionBoard>> getExtensionBoards() async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/extensionBoards');
      notifierState = NotifierState.loaded;
      notifyListeners();
      List<ExtensionBoard> extensionBoards = List.from(responseLKC.data)
          .map((e) => ExtensionBoard.fromJson(e))
          .toList();
      return extensionBoards;
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  
  Future<List<Adapter>> getAdapters() async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/adapters');
      notifierState = NotifierState.loaded;
      notifyListeners();
      List<Adapter> adapters = List.from(responseLKC.data)
          .map((e) => Adapter.fromJson(e))
          .toList();
      return adapters;
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  
  Future<List<Battery>> getBatteries() async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/batteries');
      notifierState = NotifierState.loaded;
      notifyListeners();
      List<Battery> batteries = List.from(responseLKC.data)
          .map((e) => Battery.fromJson(e))
          .toList();
      return batteries;
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  
  Future<List<Cable>> getCables() async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/cables');
      notifierState = NotifierState.loaded;
      notifyListeners();
      List<Cable> cables = List.from(responseLKC.data)
          .map((e) => Cable.fromJson(e))
          .toList();
      return cables;
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  
  Future<List<DoorBell>> getDoorBells() async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/doorBells');
      notifierState = NotifierState.loaded;
      notifyListeners();
      List<DoorBell> doorBells = List.from(responseLKC.data)
          .map((e) => DoorBell.fromJson(e))
          .toList();
      return doorBells;
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  Future<List<ImmunoBooster>> getImmunoBoosters() async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/immunoBoosters');
      notifierState = NotifierState.loaded;
      notifyListeners();
      List<ImmunoBooster> immunoBoosters = List.from(responseLKC.data)
          .map((e) => ImmunoBooster.fromJson(e))
          .toList();
      return immunoBoosters;
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  Future<List<Led>> getLeds() async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/leds');
      notifierState = NotifierState.loaded;
      notifyListeners();
      List<Led> leds = List.from(responseLKC.data)
          .map((e) => Led.fromJson(e))
          .toList();
      return leds;
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  Future<List<Mask>> getMasks() async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/masks');
      notifierState = NotifierState.loaded;
      notifyListeners();
      List<Mask> masks = List.from(responseLKC.data)
          .map((e) => Mask.fromJson(e))
          .toList();
      return masks;
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  Future<List<MultiPlug>> getMultiPlugs() async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/multiPlugs');
      notifierState = NotifierState.loaded;
      notifyListeners();
      List<MultiPlug> multiPlugs = List.from(responseLKC.data)
          .map((e) => MultiPlug.fromJson(e))
          .toList();
      return multiPlugs;
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  Future<List<Sanitizer>> getSanitizers() async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/sanitizers');
      notifierState = NotifierState.loaded;
      notifyListeners();
      List<Sanitizer> sanitizers = List.from(responseLKC.data)
          .map((e) => Sanitizer.fromJson(e))
          .toList();
      return sanitizers;
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  Future<List<Stand>> getStands() async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/stands');
      notifierState = NotifierState.loaded;
      notifyListeners();
      List<Stand> stands = List.from(responseLKC.data)
          .map((e) => Stand.fromJson(e))
          .toList();
      return stands;
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

  Future<List<Alarm>> getAlarms() async {
    try {
      ResponseLKC responseLKC = await apiBaseHelper.get('/alarms');
      notifierState = NotifierState.loaded;
      notifyListeners();
      List<Alarm> alarms = List.from(responseLKC.data)
          .map((e) => Alarm.fromJson(e))
          .toList();
      return alarms;
    } catch (e) {
      notifierState = NotifierState.error;
      notifyListeners();
      return null;
    }
  }

}
