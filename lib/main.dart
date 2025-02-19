import 'dart:async';
import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:driver_app/core/base_constants.dart';
import 'package:driver_app/core/di/injectable.dart';
import 'package:driver_app/core/utils/app_bloc_observer.dart';
import 'package:driver_app/features/driver_module/data/services/api_service.dart';
import 'package:driver_app/features/driver_module/presentation/driver_home_screen/blocs/route_stops_list_bloc/route_stops_list_bloc.dart';
import 'package:driver_app/features/driver_module/presentation/driver_home_screen/blocs/update_trip_status_bloc/update_trip_status_bloc.dart';
import 'package:driver_app/screens/driver_section/home_screen/screens/driver_map_screen.dart';
import 'package:driver_app/features/driver_module/presentation/parent_section/parent_home_screen/parent_home_screen.dart';
import 'package:driver_app/screens/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await NotificationService.instance.initialize();
  configureDependencies();
  SharedPrefs.shared = await SharedPreferences.getInstance();
  Bloc.observer = AppBlocObserver();
  final dio = getIt.get<Dio>();
  dio.interceptors.add(
    AwesomeDioInterceptor(
      logRequestTimeout: false,
      logRequestHeaders: true,
      logResponseHeaders: true,
    ),
  );
  addDioHeader();
  runApp(MultiBlocProvider(
      providers: [
  BlocProvider<GetRouteStopsListBloc>(
  create: (context) => getIt.get<GetRouteStopsListBloc>(),
  ),
  BlocProvider<UpdateTripStatusBloc>(
  create: (context) => getIt.get<UpdateTripStatusBloc>(),
  ),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ParentHomeScreen(),
      // home: SplashScreen(),
      // home: DriverMapScreen(),
    );
  }
}
// class MapSample extends StatefulWidget {
//   const MapSample({super.key});

//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(37.42796133580664, -122.085749655962),
//     zoom: 14.4746,
//   );

//   static const CameraPosition _kLake = CameraPosition(
//       bearing: 192.8334901395799,
//       target: LatLng(37.43296265331129, -122.08832357078792),
//       tilt: 59.440717697143555,
//       zoom: 19.151926040649414);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GoogleMap(
//         mapType: MapType.normal,
//         initialCameraPosition: _kGooglePlex,
//         onMapCreated: (GoogleMapController controller) {
//           _controller.complete(controller);
//         },
//       ),
//       // floatingActionButton: FloatingActionButton.extended(
//       //   onPressed: _goToTheLake,
//       //   label: const Text('To the lake!'),
//       //   icon: const Icon(Icons.directions_boat),
//       // ),
//     );
//   }

//   // Future<void> _goToTheLake() async {
//   //   final GoogleMapController controller = await _controller.future;
//   //   await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//   // }
// }
