import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'update_trip_status_response.freezed.dart';
part 'update_trip_status_response.g.dart';

UpdateTripStatusResponse updateTripStatusResponseFromJson(String str) => UpdateTripStatusResponse.fromJson(json.decode(str));

String updateTripStatusResponseToJson(UpdateTripStatusResponse data) => json.encode(data.toJson());

@freezed
class UpdateTripStatusResponse with _$UpdateTripStatusResponse {
  const factory UpdateTripStatusResponse({
    @JsonKey(name: "status")
    String? status,
    @JsonKey(name: "message")
    String? message,
  }) = _UpdateTripStatusResponse;

  factory UpdateTripStatusResponse.fromJson(Map<String, dynamic> json) => _$UpdateTripStatusResponseFromJson(json);
}
