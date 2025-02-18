import 'package:dio/dio.dart';
import 'package:driver_app/features/driver_module/domain/entities/get_route_stops_response.dart';
import 'package:driver_app/features/driver_module/domain/entities/update_trip_status_response.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

import 'data_source.dart';

@Injectable(as: DataSource)
class RemoteDataSource extends DataSource {
  @injectable
  final Dio dio;

  RemoteDataSource(this.dio);

  @override
  Future<Either<String, GetRouteStopsResponse>> getRouteStopsData() async {
    try {
      final response = await dio.get("/get-route-stops?driver_id=101");
      // final response = await dio.get("/get-route-stops?driver_id=1");

      if (response.statusCode == 200 && response.data != null) {
        return Right(GetRouteStopsResponse.fromJson(response.data));
      } else {
        return const Left("Received Error response");
      }
    } catch (e) {
      return const Left("Exception Occurred while fetching users");
    }
  }

  @override
  Future<Either<String, UpdateTripStatusResponse>> updateTripStatusData(
      {required String tripType,
        required String tripStatus}) async {
    try {
      var formData = FormData.fromMap(
          {"driver_id": 101,
            "trip_type": tripType,
            "trip_status": tripStatus});
      final response = await dio.post("/update-trip-status", data: formData);

      if (response.statusCode == 200 && response.data != null) {
        return Right(UpdateTripStatusResponse.fromJson(response.data));
      } else {
        return const Left("Received Error response");
      }
    } catch (e) {
      return const Left("Exception Occurred while fetching users");
    }
  }

}
