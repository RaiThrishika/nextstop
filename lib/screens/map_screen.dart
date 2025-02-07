import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController _mapController;

  // Initial camera position (latitude, longitude, and zoom level)
  final CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.7749, -122.4194), // Example: San Francisco
    zoom: 10,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Maps Example'),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        onMapCreated: (controller) {
          _mapController = controller;
        },
        myLocationEnabled: true, // Show the user's location
        myLocationButtonEnabled: true,
      ),
    );
  }
}
