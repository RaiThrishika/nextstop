part of 'update_trip_status_bloc.dart';

@freezed
class UpdateTripStatusEvent with _$UpdateTripStatusEvent {
  const factory UpdateTripStatusEvent.fetch({required String tripType,
    required String tripStatus}) = _Fetch;
}
