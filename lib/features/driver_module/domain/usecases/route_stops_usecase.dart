import 'package:driver_app/features/driver_module/domain/entities/get_route_stops_response.dart';
import 'package:driver_app/features/driver_module/domain/repositories/driver_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class RouteStopsUseCase {
  final DriverRepository driverRepository;

  RouteStopsUseCase(this.driverRepository);

  Future<Either<String, GetRouteStopsResponse>> execute() {
    return driverRepository.getRouteStopsData();
  }
}