import 'package:driver_app/features/driver_module/domain/entities/get_route_stops_response.dart';
import 'package:driver_app/features/driver_module/domain/entities/update_trip_status_response.dart';
import 'package:fpdart/fpdart.dart';

abstract class DriverRepository {
  Future<Either<String, GetRouteStopsResponse>> getRouteStopsData();
  Future<Either<String, UpdateTripStatusResponse>> updateTripStatusData({required String tripType,
    required String tripStatus});
}

