part of 'update_trip_status_bloc.dart';

@freezed
class UpdateTripStatusState with _$UpdateTripStatusState {
  const factory UpdateTripStatusState.initial() = _Initial;
  const factory UpdateTripStatusState.loading() = _Loading;
  const factory UpdateTripStatusState.failed({required String error}) = _Failed;
  const factory UpdateTripStatusState.success({required UpdateTripStatusResponse response}) =
  _Success;
}



