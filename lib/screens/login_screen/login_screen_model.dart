import 'package:driver_app/screens/otp_screen/otp_screen.dart';
import 'package:driver_app/services/otp_services.dart';
import 'package:flutter/material.dart';

class LoginScreenModel with ChangeNotifier {
  bool loading = false;
  late BuildContext context;
  TextEditingController mobilenoController =
      TextEditingController(text: '8891923101');
  // TextEditingController mobilenoController = TextEditingController(text: '8891923101');
  LoginScreenModel(this.context);

  generateOtp() async {
    loading = true;
    notifyListeners();
    bool result = await OtpServices()
        .generateOtp(mobileNumber: mobilenoController.text, schoolId: 2);
    if (result) {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OtpScreen()));
    } else {
      print('error occured');
    }
    loading = false;
    notifyListeners();
  }
}   
