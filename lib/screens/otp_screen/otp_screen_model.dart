import 'package:driver_app/screens/driver_section/home_screen/screens/driver_home_screen.dart';
import 'package:driver_app/model/user_type.dart';
import 'package:driver_app/screens/driver_section/home_screen/screens/driver_map_screen.dart';
import 'package:driver_app/features/driver_module/presentation/parent_section/parent_home_screen/parent_home_screen.dart';
import 'package:driver_app/services/common_memory.dart';
import 'package:driver_app/services/otp_services.dart';
import 'package:flutter/material.dart';

class OtpScreenModel with ChangeNotifier {
  bool loading = false;
  late BuildContext context;
  TextEditingController otpController = TextEditingController(text: '1234');
  OtpScreenModel(this.context);

  verifyOtp() async {
    // var test = await OtpServices().testNetworkRequest();
    bool result = await OtpServices()
        .verifyOtp(mobileNumber: '8891923101', otp: otpController.text);
    if (result) {
      print('------------');
      print(UserType.driver.name);
      print('------------');

      if (CommonMemory.userType == UserType.driver.name) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => DriverMapScreen()));
      }
      if (CommonMemory.userType == UserType.parent.toString())
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => ParentHomeScreen()));
    }
  }
}
