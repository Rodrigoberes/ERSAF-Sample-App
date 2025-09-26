// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Route _$RouteFromJson(Map<String, dynamic> json) {
  return _Route.fromJson(json);
}

/// @nodoc
mixin _$Route {
  int get id => throw _privateConstructorUsedError;
  int get companyId => throw _privateConstructorUsedError;
  String get originCity => throw _privateConstructorUsedError;
  String get originTerminal => throw _privateConstructorUsedError;
  String get destinationCity => throw _privateConstructorUsedError;
  String get destinationTerminal => throw _privateConstructorUsedError;
  int get distanceKm => throw _privateConstructorUsedError;
  int get estimatedDurationMinutes => throw _privateConstructorUsedError;
  int? get basePrice => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Route to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Route
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RouteCopyWith<Route> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteCopyWith<$Res> {
  factory $RouteCopyWith(Route value, $Res Function(Route) then) =
      _$RouteCopyWithImpl<$Res, Route>;
  @useResult
  $Res call({
    int id,
    int companyId,
    String originCity,
    String originTerminal,
    String destinationCity,
    String destinationTerminal,
    int distanceKm,
    int estimatedDurationMinutes,
    int? basePrice,
    bool isActive,
    String createdAt,
    String updatedAt,
  });
}

/// @nodoc
class _$RouteCopyWithImpl<$Res, $Val extends Route>
    implements $RouteCopyWith<$Res> {
  _$RouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Route
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? originCity = null,
    Object? originTerminal = null,
    Object? destinationCity = null,
    Object? destinationTerminal = null,
    Object? distanceKm = null,
    Object? estimatedDurationMinutes = null,
    Object? basePrice = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            companyId: null == companyId
                ? _value.companyId
                : companyId // ignore: cast_nullable_to_non_nullable
                      as int,
            originCity: null == originCity
                ? _value.originCity
                : originCity // ignore: cast_nullable_to_non_nullable
                      as String,
            originTerminal: null == originTerminal
                ? _value.originTerminal
                : originTerminal // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationCity: null == destinationCity
                ? _value.destinationCity
                : destinationCity // ignore: cast_nullable_to_non_nullable
                      as String,
            destinationTerminal: null == destinationTerminal
                ? _value.destinationTerminal
                : destinationTerminal // ignore: cast_nullable_to_non_nullable
                      as String,
            distanceKm: null == distanceKm
                ? _value.distanceKm
                : distanceKm // ignore: cast_nullable_to_non_nullable
                      as int,
            estimatedDurationMinutes: null == estimatedDurationMinutes
                ? _value.estimatedDurationMinutes
                : estimatedDurationMinutes // ignore: cast_nullable_to_non_nullable
                      as int,
            basePrice: freezed == basePrice
                ? _value.basePrice
                : basePrice // ignore: cast_nullable_to_non_nullable
                      as int?,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RouteImplCopyWith<$Res> implements $RouteCopyWith<$Res> {
  factory _$$RouteImplCopyWith(
    _$RouteImpl value,
    $Res Function(_$RouteImpl) then,
  ) = __$$RouteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int companyId,
    String originCity,
    String originTerminal,
    String destinationCity,
    String destinationTerminal,
    int distanceKm,
    int estimatedDurationMinutes,
    int? basePrice,
    bool isActive,
    String createdAt,
    String updatedAt,
  });
}

/// @nodoc
class __$$RouteImplCopyWithImpl<$Res>
    extends _$RouteCopyWithImpl<$Res, _$RouteImpl>
    implements _$$RouteImplCopyWith<$Res> {
  __$$RouteImplCopyWithImpl(
    _$RouteImpl _value,
    $Res Function(_$RouteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Route
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? originCity = null,
    Object? originTerminal = null,
    Object? destinationCity = null,
    Object? destinationTerminal = null,
    Object? distanceKm = null,
    Object? estimatedDurationMinutes = null,
    Object? basePrice = freezed,
    Object? isActive = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$RouteImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        companyId: null == companyId
            ? _value.companyId
            : companyId // ignore: cast_nullable_to_non_nullable
                  as int,
        originCity: null == originCity
            ? _value.originCity
            : originCity // ignore: cast_nullable_to_non_nullable
                  as String,
        originTerminal: null == originTerminal
            ? _value.originTerminal
            : originTerminal // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationCity: null == destinationCity
            ? _value.destinationCity
            : destinationCity // ignore: cast_nullable_to_non_nullable
                  as String,
        destinationTerminal: null == destinationTerminal
            ? _value.destinationTerminal
            : destinationTerminal // ignore: cast_nullable_to_non_nullable
                  as String,
        distanceKm: null == distanceKm
            ? _value.distanceKm
            : distanceKm // ignore: cast_nullable_to_non_nullable
                  as int,
        estimatedDurationMinutes: null == estimatedDurationMinutes
            ? _value.estimatedDurationMinutes
            : estimatedDurationMinutes // ignore: cast_nullable_to_non_nullable
                  as int,
        basePrice: freezed == basePrice
            ? _value.basePrice
            : basePrice // ignore: cast_nullable_to_non_nullable
                  as int?,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(
  explicitToJson: true,
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class _$RouteImpl implements _Route {
  const _$RouteImpl({
    required this.id,
    required this.companyId,
    required this.originCity,
    required this.originTerminal,
    required this.destinationCity,
    required this.destinationTerminal,
    required this.distanceKm,
    required this.estimatedDurationMinutes,
    this.basePrice,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$RouteImpl.fromJson(Map<String, dynamic> json) =>
      _$$RouteImplFromJson(json);

  @override
  final int id;
  @override
  final int companyId;
  @override
  final String originCity;
  @override
  final String originTerminal;
  @override
  final String destinationCity;
  @override
  final String destinationTerminal;
  @override
  final int distanceKm;
  @override
  final int estimatedDurationMinutes;
  @override
  final int? basePrice;
  @override
  final bool isActive;
  @override
  final String createdAt;
  @override
  final String updatedAt;

  @override
  String toString() {
    return 'Route(id: $id, companyId: $companyId, originCity: $originCity, originTerminal: $originTerminal, destinationCity: $destinationCity, destinationTerminal: $destinationTerminal, distanceKm: $distanceKm, estimatedDurationMinutes: $estimatedDurationMinutes, basePrice: $basePrice, isActive: $isActive, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RouteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.originCity, originCity) ||
                other.originCity == originCity) &&
            (identical(other.originTerminal, originTerminal) ||
                other.originTerminal == originTerminal) &&
            (identical(other.destinationCity, destinationCity) ||
                other.destinationCity == destinationCity) &&
            (identical(other.destinationTerminal, destinationTerminal) ||
                other.destinationTerminal == destinationTerminal) &&
            (identical(other.distanceKm, distanceKm) ||
                other.distanceKm == distanceKm) &&
            (identical(
                  other.estimatedDurationMinutes,
                  estimatedDurationMinutes,
                ) ||
                other.estimatedDurationMinutes == estimatedDurationMinutes) &&
            (identical(other.basePrice, basePrice) ||
                other.basePrice == basePrice) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    companyId,
    originCity,
    originTerminal,
    destinationCity,
    destinationTerminal,
    distanceKm,
    estimatedDurationMinutes,
    basePrice,
    isActive,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Route
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RouteImplCopyWith<_$RouteImpl> get copyWith =>
      __$$RouteImplCopyWithImpl<_$RouteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RouteImplToJson(this);
  }
}

abstract class _Route implements Route {
  const factory _Route({
    required final int id,
    required final int companyId,
    required final String originCity,
    required final String originTerminal,
    required final String destinationCity,
    required final String destinationTerminal,
    required final int distanceKm,
    required final int estimatedDurationMinutes,
    final int? basePrice,
    required final bool isActive,
    required final String createdAt,
    required final String updatedAt,
  }) = _$RouteImpl;

  factory _Route.fromJson(Map<String, dynamic> json) = _$RouteImpl.fromJson;

  @override
  int get id;
  @override
  int get companyId;
  @override
  String get originCity;
  @override
  String get originTerminal;
  @override
  String get destinationCity;
  @override
  String get destinationTerminal;
  @override
  int get distanceKm;
  @override
  int get estimatedDurationMinutes;
  @override
  int? get basePrice;
  @override
  bool get isActive;
  @override
  String get createdAt;
  @override
  String get updatedAt;

  /// Create a copy of Route
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RouteImplCopyWith<_$RouteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
