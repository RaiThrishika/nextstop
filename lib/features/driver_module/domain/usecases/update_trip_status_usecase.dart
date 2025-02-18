import 'package:driver_app/features/driver_module/domain/entities/update_trip_status_response.dart';
import 'package:driver_app/features/driver_module/domain/repositories/driver_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateTripStatusUseCase {
  final DriverRepository driverRepository;

  UpdateTripStatusUseCase(this.driverRepository);

  Future<Either<String, UpdateTripStatusResponse>> execute({required String tripType,
    required String tripStatus}) {
    return driverRepository.updateTripStatusData(tripType: tripType, tripStatus: tripStatus);
  }
}