import 'package:driver_app/screens/driver_section/home_screen/screens/driver_home_screen.dart';
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
    if (jwtToken == '') {
      Navigator.pushReplacement(
          _context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      Navigator.pushReplacement(_context,
          MaterialPageRoute(builder: (context) => DriverHomeScreen()));
    }
  }
}
