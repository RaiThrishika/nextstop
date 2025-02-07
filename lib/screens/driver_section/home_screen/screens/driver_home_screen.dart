import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:driver_app/screens/driver_section/home_screen/screens/driver_home_screen_model.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DriverHomeScreenModel(context)),
      ],
      child: Consumer<DriverHomeScreenModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                "Location Sender",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.blue.shade800,
              elevation: 10,
              actions: [
                IconButton(
                  onPressed: () {
                    model.logout();
                  },
                  icon: const Icon(Icons.logout, color: Colors.white),
                ),
              ],
            ),
            body: Center(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GoogleMap(
                        mapType: MapType.normal,
                        initialCameraPosition: model.kGooglePlex,
                        onMapCreated: (GoogleMapController controller) {
                          model.mapController.complete(controller);
                        },
                        markers: model.markers, // Add markers to the map
                        myLocationEnabled: true, // Show the user's location
                        myLocationButtonEnabled: true, // Show the location button
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: model.hideStartButton
                          ? ElevatedButton.icon(
                        onPressed: () {
                          model.stopLocationUpdates();
                        },
                        icon: const Icon(Icons.stop, size: 24),
                        label: const Text(
                          "Stop Updates",
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red.shade700,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      )
                          : ElevatedButton.icon(
                        onPressed: () {
                          model.startLocationUpdates(context);
                        },
                        icon: const Icon(Icons.play_arrow, size: 24),
                        label: const Text(
                          "Start Updates",
                          style: TextStyle(fontSize: 16),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}