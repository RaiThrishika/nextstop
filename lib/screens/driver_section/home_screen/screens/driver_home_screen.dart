import 'package:driver_app/screens/driver_section/home_screen/screens/driver_home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class DriverHomeScreen extends StatelessWidget {
  const DriverHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DriverHomeScreenModel(context)),
      ],
      child: Consumer<DriverHomeScreenModel>(builder: (context, model, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Location Sender"),
              actions: [
                IconButton(
                    onPressed: () {
                      model.logout();
                    },
                    icon: Icon(Icons.logout))
              ],
            ),
            body: Center(
              child: Stack(
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: model.kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      model.mapController.complete(controller);
                    },
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   model.currentPosition != null
                      //       ? "Lat: ${model.currentPosition!.latitude}, "
                      //           "Long: ${model.currentPosition!.longitude}"
                      //       : "Fetching location...",
                      // ),
                      SizedBox(height: 20),
                      Visibility(
                        visible: !model.hideStartButton,
                        child: ElevatedButton(
                          onPressed: () {
                            model.startLocationUpdates(context);
                          },
                          child: Text("Start Updates"),
                        ),
                      ),
                      SizedBox(height: 10),
                      Visibility(
                        visible: model.hideStartButton,
                        child: ElevatedButton(
                          onPressed: () {
                            model.stopLocationUpdates();
                          },
                          child: Text("Stop Updates"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
      }),
    );
  }
}
