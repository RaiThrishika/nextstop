import 'package:driver_app/features/driver_module/data/data_sources/data_source.dart';
import 'package:driver_app/features/driver_module/domain/entities/get_route_stops_response.dart';
import 'package:driver_app/features/driver_module/domain/entities/update_trip_status_response.dart';
import 'package:driver_app/features/driver_module/domain/repositories/driver_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: DriverRepository)
class DriverRepositoryImpl extends DriverRepository {
  final DataSource driverDataSource;

  DriverRepositoryImpl(this.driverDataSource);

  @override
  Future<Either<String, GetRouteStopsResponse>> getRouteStopsData() async {
    return await driverDataSource.getRouteStopsData();
  }

  @override
  Future<Either<String, UpdateTripStatusResponse>> updateTripStatusData({required String tripType,
    required String tripStatus}) async {
    return await driverDataSource.updateTripStatusData(tripType: tripType, tripStatus: tripStatus);
  }



}