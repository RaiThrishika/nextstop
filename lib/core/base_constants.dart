import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';


@injectable
class BaseConstants {
  String get baseUrl => "https://bluefort.in/nextstop/api";
  var apiKey = 'AIzaSyDooSUGSf63Ghq02_iIhtnmwMDs4HlWS6c';
}


class SharedPrefs {
  static late SharedPreferences shared;

  static bool isSkipped() {
    return shared.getBool('isSkipped') ?? false;
  }

  static void setIsSkipped(bool status) {
    shared.setBool('isSkipped', status);
  }
}