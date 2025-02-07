import 'dart:async';
import 'dart:convert';
import 'package:driver_app/screens/login_screen/login_screen.dart';
import 'package:driver_app/services/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

class DriverHomeScreenModel with ChangeNotifier {
  Timer? _timer;
  Position? _currentPosition;
  late PermissionStatus status;
  int counter = 0;
  bool hideStartButton = false;
  late BuildContext _context;
   final Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();

    final CameraPosition kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  Position? get currentPosition => _currentPosition;

  DriverHomeScreenModel(this._context) {
    handleLocationPermission(_context);
  }

  void startLocationUpdates(context) {
    hideStartButton = true;
    notifyListeners();
    _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      if (status.isGranted) {
        // Fetch the location
        try {
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    "Lat: ${position.latitude}, Long: ${position.longitude}")),
          );
          _currentPosition = position;
          notifyListeners();
          await sendLocationToApi(position.latitude, position.longitude);
        } catch (e) {
          hideStartButton = false;
          notifyListeners();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Error fetching location: $e")),
          );
        }
      }

      // Get current location
      // Position position = await Geolocator.getCurrentPosition(
      //     desiredAccuracy: LocationAccuracy.high);

      // Notify listeners if needed
      notifyListeners();

      // Send location to API
    });
  }

  Future<void> sendLocationToApi(double lat, double long) async {
    counter++;
    print('===================  $counter  ========================');
    final url =
        Uri.parse('https://bluefort.in/nextstop/api/update-bus-location.php');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(
            {'latitude': lat, 'longitude': long, 'bus_id': '786543'}),
      );
      debugPrint("API Response: ${response.statusCode}");
    } catch (e) {
      debugPrint("Error sending location: $e");
    }
  }

  void logout() async {
    String result = await LocalStorage().getJwtToken();
   
      await LocalStorage().deleteJwtToken();
      Navigator.pushReplacement(
          _context, MaterialPageRoute(builder: (context) => LoginScreen()));
    
  }

  void stopLocationUpdates() {
    hideStartButton = false;
    notifyListeners();
    _timer?.cancel();
  }

  Future<void> handleLocationPermission(BuildContext context) async {
    // Check if location services are enabled
    if (!await Geolocator.isLocationServiceEnabled()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content:
                Text("Location services are disabled. Please enable them.")),
      );
      return;
    }

    // Request permission
    status = await Permission.location.request();

    if (status.isGranted) {
      // Fetch the location
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        _currentPosition = position;
        notifyListeners();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                  "Lat: ${position.latitude}, Long: ${position.longitude}")),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error fetching location: $e")),
        );
      }
    } else if (status.isDenied) {
      // Show a message if denied
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "Location permission denied. Please grant it to proceed.")),
      );
    } else if (status.isPermanentlyDenied) {
      // Redirect to app settings
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "Location permission is permanently denied. Please enable it in settings.")),
      );
      await openAppSettings();
    }
  }
}
