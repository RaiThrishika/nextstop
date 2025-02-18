// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_route_stops_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetRouteStopsResponseImpl _$$GetRouteStopsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetRouteStopsResponseImpl(
      status: json['status'] as String?,
      pickupPoints: (json['pickup_points'] as List<dynamic>?)
          ?.map((e) => PickupPoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetRouteStopsResponseImplToJson(
        _$GetRouteStopsResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'pickup_points': instance.pickupPoints,
    };

_$PickupPointImpl _$$PickupPointImplFromJson(Map<String, dynamic> json) =>
    _$PickupPointImpl(
      pickupPoint: json['pickup_point'] as String?,
      studentName: json['student_name'] as String?,
      pickupPointClass: json['class'] as String?,
      section: json['section'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$$PickupPointImplToJson(_$PickupPointImpl instance) =>
    <String, dynamic>{
      'pickup_point': instance.pickupPoint,
      'student_name': instance.studentName,
      'class': instance.pickupPointClass,
      'section': instance.section,
      'address': instance.address,
    };
