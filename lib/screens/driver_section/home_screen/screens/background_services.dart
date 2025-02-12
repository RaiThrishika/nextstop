import 'dart:async';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:geolocator/geolocator.dart';

Future<void> startBackgroundService() async {
  final service = FlutterBackgroundService();

  // Configure background service
  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
      notificationChannelId: "location_service",
      initialNotificationTitle: "Tracking Location",
      initialNotificationContent: "Location tracking is running in the background",
      foregroundServiceNotificationId: 888,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onBackground,
    ),
  );

  service.startService();
}

// Function runs in the background
void onStart(ServiceInstance service) async {
  Timer.periodic(Duration(seconds: 10), (timer) async {
    if (service is AndroidServiceInstance) {
      if (!(await service.isForegroundService())) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    print("Location: ${position.latitude}, ${position.longitude}");

    // Send location to API or database
    sendLocationToServer(position.latitude, position.longitude);
  });
}

// Background execution for iOS
Future<bool> onBackground(ServiceInstance service) async {
  return true;
}

// Dummy function to send location to server
void sendLocationToServer(double lat, double lon) {
  print("Sent to Server: $lat, $lon");
}
