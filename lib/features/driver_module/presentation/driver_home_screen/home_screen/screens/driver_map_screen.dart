import 'package:driver_app/core/utils/common_error_loading_widget.dart';
import 'package:driver_app/core/utils/date_time_formatter.dart';
import 'package:driver_app/features/driver_module/domain/entities/get_route_stops_response.dart';
import 'package:driver_app/features/driver_module/presentation/driver_home_screen/blocs/route_stops_list_bloc/route_stops_list_bloc.dart';
import 'package:driver_app/features/driver_module/presentation/driver_home_screen/home_screen/screens/driver_home_screen_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:provider/provider.dart';

class DriverMapScreen extends StatefulWidget {
  @override
  _DriverMapScreenState createState() => _DriverMapScreenState();
}

class _DriverMapScreenState extends State<DriverMapScreen> {
  GoogleMapController? mapController;
  final LatLng school = LatLng(12.569427622703314, 74.95536864281762);

  // List<LatLng> pickupLocations = [
  //   LatLng(12.570545875959832, 74.95639316775612),
  //   LatLng(12.571952741671996, 74.95540693151224),
  //   LatLng(12.571686178249271, 74.95336618109873),
  //   LatLng(12.573139953563794, 74.96015230714907),
  //   LatLng(12.575167659750795, 74.95934029544017),
  //   LatLng(12.571388212896496, 74.96107830374781),
  //   LatLng(12.5665391292505, 74.95454155120441),
  //   LatLng(12.56784975638267, 74.95039177266275),
  //   LatLng(12.570042204492102, 74.95118851854622),
  //   LatLng(12.569664570073106, 74.94995951649183),
  // ];

  List<PickupPoint>? pickupLocations;

  Set<Marker> markers = {};
  Set<Polyline> polylines = {};

  @override
  void initState() {
    super.initState();
    context.read<GetRouteStopsListBloc>()
        .add(const GetRouteStopsListEvent.fetch());
  }

  void _addMarkers() {
    setState(() {
      markers.add(
        Marker(
          markerId: MarkerId("school"),
          position: school,
          infoWindow: InfoWindow(title: "School (Mogral)"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        ),
      );

      for (int i = 0; i < pickupLocations!.length; i++) {
        markers.add(
          Marker(
            markerId: MarkerId("location_$i"),
            position: convertToLatLng(pickupLocations![i].pickupPoint!),
            infoWindow: InfoWindow(title: "Location ${i + 1}"),
            icon:
                BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          ),
        );
      }
    });
    _getPolyline();
  }

  LatLng? convertAddressToLatLng(String? address) {
    if (address != null) {
      return LatLng(12.9716, 77.5946); // Example LatLng
    }
    return null;
  }

  void _getPolyline() async {
    PolylinePoints polylinePoints = PolylinePoints();
    List<LatLng> routeCoords = [
      school,
      if (pickupLocations != null)
        ...pickupLocations!
            .map((pickup) => convertAddressToLatLng(pickup.address))
            .whereType<LatLng>(),
      school
    ];
    setState(() {
      polylines.add(
        Polyline(
          polylineId: PolylineId("route"),
          visible: false,
          points: routeCoords,
          color: Colors.blue,
          width: 5,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DriverHomeScreenModel(context)),
      ],
      child: Consumer<DriverHomeScreenModel>(builder: (context, model, child) {
        return LayoutBuilder(builder: (context, box) {
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
              body: BlocBuilder<GetRouteStopsListBloc, GetRouteStopsListState>(
                builder: (context, state) {
                  return state.when(
                      initial: () => CommonErrorLoadingWidget(
                          height: box.maxHeight, error: "Failed to Call API"),
                      loading: () => CommonErrorLoadingWidget(
                            height: box.maxHeight,
                            isLoading: true,
                            error: null,
                          ),
                      failed: (error) => CommonErrorLoadingWidget(
                            error: error,
                            height: box.maxHeight,
                          ),
                      success: (data) {
                        pickupLocations = data.pickupPoints ?? [];
                        _addMarkers();
                        return Center(
                          child: Stack(
                            children: [
                              GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: school,
                                  zoom: 14,
                                ),
                                markers: markers,
                                polylines: polylines,
                                onMapCreated: (GoogleMapController controller) {
                                  setState(() {
                                    mapController = controller;
                                  });
                                },
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
                        );
                      });
                },
              ));
        });
      }),
    );
  }
}

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }
//
// class _MapScreenState extends State<MapScreen> {
//   GoogleMapController? mapController;
//   final LatLng school = LatLng(12.569427622703314, 74.95536864281762);
//
//   List<LatLng> pickupLocations = [
//     LatLng(12.570545875959832, 74.95639316775612),
//     LatLng(12.571952741671996, 74.95540693151224),
//     LatLng(12.571686178249271, 74.95336618109873),
//     LatLng(12.573139953563794, 74.96015230714907),
//     LatLng(12.575167659750795, 74.95934029544017),
//     LatLng(12.571388212896496, 74.96107830374781),
//     LatLng(12.5665391292505, 74.95454155120441),
//     LatLng(12.56784975638267, 74.95039177266275),
//     LatLng(12.570042204492102, 74.95118851854622),
//     LatLng(12.569664570073106, 74.94995951649183),
//   ];
//
//   Set<Marker> markers = {};
//   Set<Polyline> polylines = {};
//
//   @override
//   void initState() {
//     super.initState();
//     _addMarkers();
//     _getPolyline();
//   }
//
//   void _addMarkers() {
//     setState(() {
//       markers.add(
//         Marker(
//           markerId: MarkerId("school"),
//           position: school,
//           infoWindow: InfoWindow(title: "School (Mogral)"),
//           icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
//         ),
//       );
//
//       for (int i = 0; i < pickupLocations.length; i++) {
//         markers.add(
//           Marker(
//             markerId: MarkerId("location_$i"),
//             position: pickupLocations[i],
//             infoWindow: InfoWindow(title: "Location ${i + 1}"),
//             icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
//           ),
//         );
//       }
//     });
//   }
//
//   void _getPolyline() async {
//     PolylinePoints polylinePoints = PolylinePoints();
//     List<LatLng> routeCoords = [school, ...pickupLocations, school];
//
//     setState(() {
//       polylines.add(
//         Polyline(
//           polylineId: PolylineId("route"),
//           visible: false,
//           points: routeCoords,
//           color: Colors.blue,
//           width: 5,
//         ),
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("School Pickup Locations")),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: school,
//           zoom: 14,
//         ),
//         markers: markers,
//         polylines: polylines,
//         onMapCreated: (GoogleMapController controller) {
//           setState(() {
//             mapController = controller;
//           });
//         },
//       ),
//     );
//   }
// }
