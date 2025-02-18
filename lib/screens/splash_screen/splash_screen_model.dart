import 'package:driver_app/core/base_constants.dart';
import 'package:driver_app/features/driver_module/presentation/intro_screen/intro_screen.dart';
import 'package:driver_app/screens/driver_section/home_screen/screens/driver_home_screen.dart';
import 'package:driver_app/screens/driver_section/home_screen/screens/driver_map_screen.dart';
import 'package:driver_app/screens/login_screen/login_screen.dart';
import 'package:driver_app/services/local_storage.dart';
import 'package:flutter/material.dart';

class SplashScreenModel with ChangeNotifier {
  late BuildContext _context;
  SplashScreenModel(this._context) {
    init();
  }

  void init() async {
    String jwtToken = await LocalStorage().getJwtToken();
    if (!SharedPrefs.isSkipped()) {
      Navigator.pushReplacement(
          _context, MaterialPageRoute(builder: (context) => IntroScreen()));
    } else {
    if (jwtToken == '') {
      Navigator.pushReplacement(
          _context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      Navigator.pushReplacement(_context,
          MaterialPageRoute(builder: (context) => DriverMapScreen()));
          // MaterialPageRoute(builder: (context) => DriverHomeScreen()));
    } }
  }

}
