import 'package:firebase_messaging/firebase_messaging.dart';

class FCMTokenService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String?> getToken() async {
    try {
      String? token = await _firebaseMessaging.getToken();
      print("FCM Token: $token");
      return token;
    } catch (e) {
      print("Error retrieving FCM token: $e");
      return null;
    }
  }
}
