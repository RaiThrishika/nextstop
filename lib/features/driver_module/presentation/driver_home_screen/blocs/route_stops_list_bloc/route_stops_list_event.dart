part of 'route_stops_list_bloc.dart';

@freezed
class GetRouteStopsListEvent with _$GetRouteStopsListEvent {
  const factory GetRouteStopsListEvent.fetch() = _Fetch;
}
