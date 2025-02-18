import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'get_route_stops_response.freezed.dart';
part 'get_route_stops_response.g.dart';

GetRouteStopsResponse getRouteStopsResponseFromJson(String str) => GetRouteStopsResponse.fromJson(json.decode(str));

String getRouteStopsResponseToJson(GetRouteStopsResponse data) => json.encode(data.toJson());

@freezed
class GetRouteStopsResponse with _$GetRouteStopsResponse {
  const factory GetRouteStopsResponse({
    @JsonKey(name: "status")
    String? status,
    @JsonKey(name: "pickup_points")
    List<PickupPoint>? pickupPoints,
  }) = _GetRouteStopsResponse;

  factory GetRouteStopsResponse.fromJson(Map<String, dynamic> json) => _$GetRouteStopsResponseFromJson(json);
}

@freezed
class PickupPoint with _$PickupPoint {
  const factory PickupPoint({
    @JsonKey(name: "pickup_point")
    String? pickupPoint,
    @JsonKey(name: "student_name")
    String? studentName,
    @JsonKey(name: "class")
    String? pickupPointClass,
    @JsonKey(name: "section")
    String? section,
    @JsonKey(name: "address")
    String? address,
  }) = _PickupPoint;

  factory PickupPoint.fromJson(Map<String, dynamic> json) => _$PickupPointFromJson(json);
}
