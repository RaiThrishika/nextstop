// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_route_stops_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetRouteStopsResponse _$GetRouteStopsResponseFromJson(
    Map<String, dynamic> json) {
  return _GetRouteStopsResponse.fromJson(json);
}

/// @nodoc
mixin _$GetRouteStopsResponse {
  @JsonKey(name: "status")
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: "pickup_points")
  List<PickupPoint>? get pickupPoints => throw _privateConstructorUsedError;

  /// Serializes this GetRouteStopsResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetRouteStopsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetRouteStopsResponseCopyWith<GetRouteStopsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRouteStopsResponseCopyWith<$Res> {
  factory $GetRouteStopsResponseCopyWith(GetRouteStopsResponse value,
          $Res Function(GetRouteStopsResponse) then) =
      _$GetRouteStopsResponseCopyWithImpl<$Res, GetRouteStopsResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "status") String? status,
      @JsonKey(name: "pickup_points") List<PickupPoint>? pickupPoints});
}

/// @nodoc
class _$GetRouteStopsResponseCopyWithImpl<$Res,
        $Val extends GetRouteStopsResponse>
    implements $GetRouteStopsResponseCopyWith<$Res> {
  _$GetRouteStopsResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetRouteStopsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? pickupPoints = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupPoints: freezed == pickupPoints
          ? _value.pickupPoints
          : pickupPoints // ignore: cast_nullable_to_non_nullable
              as List<PickupPoint>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetRouteStopsResponseImplCopyWith<$Res>
    implements $GetRouteStopsResponseCopyWith<$Res> {
  factory _$$GetRouteStopsResponseImplCopyWith(
          _$GetRouteStopsResponseImpl value,
          $Res Function(_$GetRouteStopsResponseImpl) then) =
      __$$GetRouteStopsResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "status") String? status,
      @JsonKey(name: "pickup_points") List<PickupPoint>? pickupPoints});
}

/// @nodoc
class __$$GetRouteStopsResponseImplCopyWithImpl<$Res>
    extends _$GetRouteStopsResponseCopyWithImpl<$Res,
        _$GetRouteStopsResponseImpl>
    implements _$$GetRouteStopsResponseImplCopyWith<$Res> {
  __$$GetRouteStopsResponseImplCopyWithImpl(_$GetRouteStopsResponseImpl _value,
      $Res Function(_$GetRouteStopsResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetRouteStopsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? pickupPoints = freezed,
  }) {
    return _then(_$GetRouteStopsResponseImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupPoints: freezed == pickupPoints
          ? _value._pickupPoints
          : pickupPoints // ignore: cast_nullable_to_non_nullable
              as List<PickupPoint>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetRouteStopsResponseImpl implements _GetRouteStopsResponse {
  const _$GetRouteStopsResponseImpl(
      {@JsonKey(name: "status") this.status,
      @JsonKey(name: "pickup_points") final List<PickupPoint>? pickupPoints})
      : _pickupPoints = pickupPoints;

  factory _$GetRouteStopsResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetRouteStopsResponseImplFromJson(json);

  @override
  @JsonKey(name: "status")
  final String? status;
  final List<PickupPoint>? _pickupPoints;
  @override
  @JsonKey(name: "pickup_points")
  List<PickupPoint>? get pickupPoints {
    final value = _pickupPoints;
    if (value == null) return null;
    if (_pickupPoints is EqualUnmodifiableListView) return _pickupPoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GetRouteStopsResponse(status: $status, pickupPoints: $pickupPoints)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRouteStopsResponseImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._pickupPoints, _pickupPoints));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_pickupPoints));

  /// Create a copy of GetRouteStopsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRouteStopsResponseImplCopyWith<_$GetRouteStopsResponseImpl>
      get copyWith => __$$GetRouteStopsResponseImplCopyWithImpl<
          _$GetRouteStopsResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetRouteStopsResponseImplToJson(
      this,
    );
  }
}

abstract class _GetRouteStopsResponse implements GetRouteStopsResponse {
  const factory _GetRouteStopsResponse(
      {@JsonKey(name: "status") final String? status,
      @JsonKey(name: "pickup_points")
      final List<PickupPoint>? pickupPoints}) = _$GetRouteStopsResponseImpl;

  factory _GetRouteStopsResponse.fromJson(Map<String, dynamic> json) =
      _$GetRouteStopsResponseImpl.fromJson;

  @override
  @JsonKey(name: "status")
  String? get status;
  @override
  @JsonKey(name: "pickup_points")
  List<PickupPoint>? get pickupPoints;

  /// Create a copy of GetRouteStopsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetRouteStopsResponseImplCopyWith<_$GetRouteStopsResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PickupPoint _$PickupPointFromJson(Map<String, dynamic> json) {
  return _PickupPoint.fromJson(json);
}

/// @nodoc
mixin _$PickupPoint {
  @JsonKey(name: "pickup_point")
  String? get pickupPoint => throw _privateConstructorUsedError;
  @JsonKey(name: "student_name")
  String? get studentName => throw _privateConstructorUsedError;
  @JsonKey(name: "class")
  String? get pickupPointClass => throw _privateConstructorUsedError;
  @JsonKey(name: "section")
  String? get section => throw _privateConstructorUsedError;
  @JsonKey(name: "address")
  String? get address => throw _privateConstructorUsedError;

  /// Serializes this PickupPoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PickupPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PickupPointCopyWith<PickupPoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PickupPointCopyWith<$Res> {
  factory $PickupPointCopyWith(
          PickupPoint value, $Res Function(PickupPoint) then) =
      _$PickupPointCopyWithImpl<$Res, PickupPoint>;
  @useResult
  $Res call(
      {@JsonKey(name: "pickup_point") String? pickupPoint,
      @JsonKey(name: "student_name") String? studentName,
      @JsonKey(name: "class") String? pickupPointClass,
      @JsonKey(name: "section") String? section,
      @JsonKey(name: "address") String? address});
}

/// @nodoc
class _$PickupPointCopyWithImpl<$Res, $Val extends PickupPoint>
    implements $PickupPointCopyWith<$Res> {
  _$PickupPointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PickupPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickupPoint = freezed,
    Object? studentName = freezed,
    Object? pickupPointClass = freezed,
    Object? section = freezed,
    Object? address = freezed,
  }) {
    return _then(_value.copyWith(
      pickupPoint: freezed == pickupPoint
          ? _value.pickupPoint
          : pickupPoint // ignore: cast_nullable_to_non_nullable
              as String?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupPointClass: freezed == pickupPointClass
          ? _value.pickupPointClass
          : pickupPointClass // ignore: cast_nullable_to_non_nullable
              as String?,
      section: freezed == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PickupPointImplCopyWith<$Res>
    implements $PickupPointCopyWith<$Res> {
  factory _$$PickupPointImplCopyWith(
          _$PickupPointImpl value, $Res Function(_$PickupPointImpl) then) =
      __$$PickupPointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "pickup_point") String? pickupPoint,
      @JsonKey(name: "student_name") String? studentName,
      @JsonKey(name: "class") String? pickupPointClass,
      @JsonKey(name: "section") String? section,
      @JsonKey(name: "address") String? address});
}

/// @nodoc
class __$$PickupPointImplCopyWithImpl<$Res>
    extends _$PickupPointCopyWithImpl<$Res, _$PickupPointImpl>
    implements _$$PickupPointImplCopyWith<$Res> {
  __$$PickupPointImplCopyWithImpl(
      _$PickupPointImpl _value, $Res Function(_$PickupPointImpl) _then)
      : super(_value, _then);

  /// Create a copy of PickupPoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pickupPoint = freezed,
    Object? studentName = freezed,
    Object? pickupPointClass = freezed,
    Object? section = freezed,
    Object? address = freezed,
  }) {
    return _then(_$PickupPointImpl(
      pickupPoint: freezed == pickupPoint
          ? _value.pickupPoint
          : pickupPoint // ignore: cast_nullable_to_non_nullable
              as String?,
      studentName: freezed == studentName
          ? _value.studentName
          : studentName // ignore: cast_nullable_to_non_nullable
              as String?,
      pickupPointClass: freezed == pickupPointClass
          ? _value.pickupPointClass
          : pickupPointClass // ignore: cast_nullable_to_non_nullable
              as String?,
      section: freezed == section
          ? _value.section
          : section // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PickupPointImpl implements _PickupPoint {
  const _$PickupPointImpl(
      {@JsonKey(name: "pickup_point") this.pickupPoint,
      @JsonKey(name: "student_name") this.studentName,
      @JsonKey(name: "class") this.pickupPointClass,
      @JsonKey(name: "section") this.section,
      @JsonKey(name: "address") this.address});

  factory _$PickupPointImpl.fromJson(Map<String, dynamic> json) =>
      _$$PickupPointImplFromJson(json);

  @override
  @JsonKey(name: "pickup_point")
  final String? pickupPoint;
  @override
  @JsonKey(name: "student_name")
  final String? studentName;
  @override
  @JsonKey(name: "class")
  final String? pickupPointClass;
  @override
  @JsonKey(name: "section")
  final String? section;
  @override
  @JsonKey(name: "address")
  final String? address;

  @override
  String toString() {
    return 'PickupPoint(pickupPoint: $pickupPoint, studentName: $studentName, pickupPointClass: $pickupPointClass, section: $section, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PickupPointImpl &&
            (identical(other.pickupPoint, pickupPoint) ||
                other.pickupPoint == pickupPoint) &&
            (identical(other.studentName, studentName) ||
                other.studentName == studentName) &&
            (identical(other.pickupPointClass, pickupPointClass) ||
                other.pickupPointClass == pickupPointClass) &&
            (identical(other.section, section) || other.section == section) &&
            (identical(other.address, address) || other.address == address));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pickupPoint, studentName,
      pickupPointClass, section, address);

  /// Create a copy of PickupPoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PickupPointImplCopyWith<_$PickupPointImpl> get copyWith =>
      __$$PickupPointImplCopyWithImpl<_$PickupPointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PickupPointImplToJson(
      this,
    );
  }
}

abstract class _PickupPoint implements PickupPoint {
  const factory _PickupPoint(
      {@JsonKey(name: "pickup_point") final String? pickupPoint,
      @JsonKey(name: "student_name") final String? studentName,
      @JsonKey(name: "class") final String? pickupPointClass,
      @JsonKey(name: "section") final String? section,
      @JsonKey(name: "address") final String? address}) = _$PickupPointImpl;

  factory _PickupPoint.fromJson(Map<String, dynamic> json) =
      _$PickupPointImpl.fromJson;

  @override
  @JsonKey(name: "pickup_point")
  String? get pickupPoint;
  @override
  @JsonKey(name: "student_name")
  String? get studentName;
  @override
  @JsonKey(name: "class")
  String? get pickupPointClass;
  @override
  @JsonKey(name: "section")
  String? get section;
  @override
  @JsonKey(name: "address")
  String? get address;

  /// Create a copy of PickupPoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PickupPointImplCopyWith<_$PickupPointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
