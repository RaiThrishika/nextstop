part of 'route_stops_list_bloc.dart';

@freezed
class GetRouteStopsListState with _$GetRouteStopsListState {
  const factory GetRouteStopsListState.initial() = _Initial;
  const factory GetRouteStopsListState.loading() = _Loading;
  const factory GetRouteStopsListState.failed({required String error}) = _Failed;
  const factory GetRouteStopsListState.success({required GetRouteStopsResponse response}) =
  _Success;
}



