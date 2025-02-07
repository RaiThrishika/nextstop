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
  final Completer<GoogleMapController> mapController = Completer<GoogleMapController>();
  String? _tripType; // To store the selected trip type (Pickup or Dropoff)

  String? get tripType => _tripType;

  // Marker for current location
  Set<Marker> _markers = {};

  // Getter for markers
  Set<Marker> get markers => _markers;

  // Initial camera position (will be updated to current location)
  CameraPosition get kGooglePlex {
    return CameraPosition(
      target: LatLng(
        _currentPosition?.latitude ?? 37.42796133580664,
        _currentPosition?.longitude ?? -122.085749655962,
      ),
      zoom: 14.4746,
    );
  }

  // Method to determine if it's the first half or second half of the day
  bool isFirstHalfOfDay() {
    final now = DateTime.now();
    final hour = now.hour;
    print(hour);

    // School timings: 9 AM to 5 PM
    if (hour >= 9 && hour < 12) {
      return true; // First half (Pickup)
    } else if (hour >= 12 && hour < 17) {
      return false; // Second half (Dropoff)
    } else {
      return true; // Default to Pickup if outside school timings
    }
  }

  // Method to show the alert dialog and set the trip type
  Future<void> confirmTripType(BuildContext context) async {
    final isFirstHalf = isFirstHalfOfDay();
    _tripType = isFirstHalf ? 'Pickup' : 'Dropoff'; // Set default based on time

    final result = await showDialog<String>(
      context: context,
      barrierDismissible: false, // Prevent closing the dialog by clicking outside
      builder: (context) {
        return AlertDialog(
          title: Text("Confirm Trip Type"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              RadioListTile<String>(
                title: Text("Pickup"),
                value: 'Pickup',
                groupValue: _tripType,
                onChanged: (value) {
                  _tripType = value;
                  Navigator.pop(context, value);
                },
              ),
              RadioListTile<String>(
                title: Text("Dropoff"),
                value: 'Dropoff',
                groupValue: _tripType,
                onChanged: (value) {
                  _tripType = value;
                  Navigator.pop(context, value);
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, null); // Cancel and return null
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, _tripType); // Confirm with selected trip type
              },
              child: Text("Confirm"),
            ),

          ],
        );
      },
    );

    if (result != null) {
      _tripType = result; // Update trip type based on user selection
      notifyListeners();
    } else {
      _tripType = null; // Reset trip type if canceled
      notifyListeners();
    }
  }

  // Modify startLocationUpdates to include trip type
  void startLocationUpdates(BuildContext context) async {
    await confirmTripType(context); // Show dialog to confirm trip type

    if (_tripType == null) {
      // If trip type is not selected (user canceled or clicked outside), do nothing
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Trip type not selected. Updates not started.")),
      );
      return;
    }

    hideStartButton = true;
    notifyListeners();
    _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      if (status.isGranted) {
        try {
          Position position = await Geolocator.getCurrentPosition(
              desiredAccuracy: LocationAccuracy.high);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    "Lat: ${position.latitude}, Long: ${position.longitude}")),
          );
          _currentPosition = position;
          _updateMarkers(position); // Update markers with new position
          _animateCameraToPosition(position); // Animate camera to new position
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
    });
  }

  Position? get currentPosition => _currentPosition;

  DriverHomeScreenModel(this._context) {
    handleLocationPermission(_context);
  }

  // Update markers with current location
  void _updateMarkers(Position position) {
    _markers.clear(); // Clear existing markers
    _markers.add(
      Marker(
        markerId: MarkerId('currentLocation'),
        position: LatLng(position.latitude, position.longitude),
        infoWindow: InfoWindow(
          title: 'Current Location',
          snippet: 'Lat: ${position.latitude}, Long: ${position.longitude}',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );
    notifyListeners();
  }

  // Animate camera to the current location
  Future<void> _animateCameraToPosition(Position position) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(position.latitude, position.longitude),
        14.0,
      ),
    );
  }

  // Modify sendLocationToApi to include trip type
  Future<void> sendLocationToApi(double lat, double long) async {
    String token = await LocalStorage().getJwtToken();
    counter++;
    print('===================  $counter  ========================');
    final url =
    Uri.parse('https://bluefort.in/nextstop/api/update-bus-location.php');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': token,
        },
        body: jsonEncode({
          'latitude': lat,
          'longitude': long,
          'bus_id': '101',
          'trip_type': _tripType, // Include trip type in the API request
        }),
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
      try {
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
        _currentPosition = position;
        _updateMarkers(position); // Update markers with initial position
        _animateCameraToPosition(position); // Animate camera to initial position
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
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "Location permission denied. Please grant it to proceed.")),
      );
    } else if (status.isPermanentlyDenied) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                "Location permission is permanently denied. Please enable it in settings.")),
      );
      await openAppSettings();
    }
  }
}
