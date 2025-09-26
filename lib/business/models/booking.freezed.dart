// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Booking _$BookingFromJson(Map<String, dynamic> json) {
  return _Booking.fromJson(json);
}

/// @nodoc
mixin _$Booking {
  int get id => throw _privateConstructorUsedError;
  int get userId => throw _privateConstructorUsedError;
  int get scheduleId => throw _privateConstructorUsedError;
  String get bookingCode => throw _privateConstructorUsedError;
  DateTime get travelDate => throw _privateConstructorUsedError;
  DateTime get departureDatetime => throw _privateConstructorUsedError;
  String get passengerName => throw _privateConstructorUsedError;
  String get passengerDocument => throw _privateConstructorUsedError;
  String get passengerPhone => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  String get paymentStatus => throw _privateConstructorUsedError;
  String get bookingStatus => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this Booking to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BookingCopyWith<Booking> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookingCopyWith<$Res> {
  factory $BookingCopyWith(Booking value, $Res Function(Booking) then) =
      _$BookingCopyWithImpl<$Res, Booking>;
  @useResult
  $Res call({
    int id,
    int userId,
    int scheduleId,
    String bookingCode,
    DateTime travelDate,
    DateTime departureDatetime,
    String passengerName,
    String passengerDocument,
    String passengerPhone,
    double totalAmount,
    String paymentStatus,
    String bookingStatus,
    String paymentMethod,
    String? notes,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class _$BookingCopyWithImpl<$Res, $Val extends Booking>
    implements $BookingCopyWith<$Res> {
  _$BookingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? scheduleId = null,
    Object? bookingCode = null,
    Object? travelDate = null,
    Object? departureDatetime = null,
    Object? passengerName = null,
    Object? passengerDocument = null,
    Object? passengerPhone = null,
    Object? totalAmount = null,
    Object? paymentStatus = null,
    Object? bookingStatus = null,
    Object? paymentMethod = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            userId: null == userId
                ? _value.userId
                : userId // ignore: cast_nullable_to_non_nullable
                      as int,
            scheduleId: null == scheduleId
                ? _value.scheduleId
                : scheduleId // ignore: cast_nullable_to_non_nullable
                      as int,
            bookingCode: null == bookingCode
                ? _value.bookingCode
                : bookingCode // ignore: cast_nullable_to_non_nullable
                      as String,
            travelDate: null == travelDate
                ? _value.travelDate
                : travelDate // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            departureDatetime: null == departureDatetime
                ? _value.departureDatetime
                : departureDatetime // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            passengerName: null == passengerName
                ? _value.passengerName
                : passengerName // ignore: cast_nullable_to_non_nullable
                      as String,
            passengerDocument: null == passengerDocument
                ? _value.passengerDocument
                : passengerDocument // ignore: cast_nullable_to_non_nullable
                      as String,
            passengerPhone: null == passengerPhone
                ? _value.passengerPhone
                : passengerPhone // ignore: cast_nullable_to_non_nullable
                      as String,
            totalAmount: null == totalAmount
                ? _value.totalAmount
                : totalAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            paymentStatus: null == paymentStatus
                ? _value.paymentStatus
                : paymentStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            bookingStatus: null == bookingStatus
                ? _value.bookingStatus
                : bookingStatus // ignore: cast_nullable_to_non_nullable
                      as String,
            paymentMethod: null == paymentMethod
                ? _value.paymentMethod
                : paymentMethod // ignore: cast_nullable_to_non_nullable
                      as String,
            notes: freezed == notes
                ? _value.notes
                : notes // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            updatedAt: null == updatedAt
                ? _value.updatedAt
                : updatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookingImplCopyWith<$Res> implements $BookingCopyWith<$Res> {
  factory _$$BookingImplCopyWith(
    _$BookingImpl value,
    $Res Function(_$BookingImpl) then,
  ) = __$$BookingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    int userId,
    int scheduleId,
    String bookingCode,
    DateTime travelDate,
    DateTime departureDatetime,
    String passengerName,
    String passengerDocument,
    String passengerPhone,
    double totalAmount,
    String paymentStatus,
    String bookingStatus,
    String paymentMethod,
    String? notes,
    DateTime createdAt,
    DateTime updatedAt,
  });
}

/// @nodoc
class __$$BookingImplCopyWithImpl<$Res>
    extends _$BookingCopyWithImpl<$Res, _$BookingImpl>
    implements _$$BookingImplCopyWith<$Res> {
  __$$BookingImplCopyWithImpl(
    _$BookingImpl _value,
    $Res Function(_$BookingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? scheduleId = null,
    Object? bookingCode = null,
    Object? travelDate = null,
    Object? departureDatetime = null,
    Object? passengerName = null,
    Object? passengerDocument = null,
    Object? passengerPhone = null,
    Object? totalAmount = null,
    Object? paymentStatus = null,
    Object? bookingStatus = null,
    Object? paymentMethod = null,
    Object? notes = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(
      _$BookingImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        userId: null == userId
            ? _value.userId
            : userId // ignore: cast_nullable_to_non_nullable
                  as int,
        scheduleId: null == scheduleId
            ? _value.scheduleId
            : scheduleId // ignore: cast_nullable_to_non_nullable
                  as int,
        bookingCode: null == bookingCode
            ? _value.bookingCode
            : bookingCode // ignore: cast_nullable_to_non_nullable
                  as String,
        travelDate: null == travelDate
            ? _value.travelDate
            : travelDate // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        departureDatetime: null == departureDatetime
            ? _value.departureDatetime
            : departureDatetime // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        passengerName: null == passengerName
            ? _value.passengerName
            : passengerName // ignore: cast_nullable_to_non_nullable
                  as String,
        passengerDocument: null == passengerDocument
            ? _value.passengerDocument
            : passengerDocument // ignore: cast_nullable_to_non_nullable
                  as String,
        passengerPhone: null == passengerPhone
            ? _value.passengerPhone
            : passengerPhone // ignore: cast_nullable_to_non_nullable
                  as String,
        totalAmount: null == totalAmount
            ? _value.totalAmount
            : totalAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        paymentStatus: null == paymentStatus
            ? _value.paymentStatus
            : paymentStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        bookingStatus: null == bookingStatus
            ? _value.bookingStatus
            : bookingStatus // ignore: cast_nullable_to_non_nullable
                  as String,
        paymentMethod: null == paymentMethod
            ? _value.paymentMethod
            : paymentMethod // ignore: cast_nullable_to_non_nullable
                  as String,
        notes: freezed == notes
            ? _value.notes
            : notes // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        updatedAt: null == updatedAt
            ? _value.updatedAt
            : updatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BookingImpl implements _Booking {
  const _$BookingImpl({
    required this.id,
    required this.userId,
    required this.scheduleId,
    required this.bookingCode,
    required this.travelDate,
    required this.departureDatetime,
    required this.passengerName,
    required this.passengerDocument,
    required this.passengerPhone,
    required this.totalAmount,
    required this.paymentStatus,
    required this.bookingStatus,
    required this.paymentMethod,
    this.notes,
    required this.createdAt,
    required this.updatedAt,
  });

  factory _$BookingImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookingImplFromJson(json);

  @override
  final int id;
  @override
  final int userId;
  @override
  final int scheduleId;
  @override
  final String bookingCode;
  @override
  final DateTime travelDate;
  @override
  final DateTime departureDatetime;
  @override
  final String passengerName;
  @override
  final String passengerDocument;
  @override
  final String passengerPhone;
  @override
  final double totalAmount;
  @override
  final String paymentStatus;
  @override
  final String bookingStatus;
  @override
  final String paymentMethod;
  @override
  final String? notes;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'Booking(id: $id, userId: $userId, scheduleId: $scheduleId, bookingCode: $bookingCode, travelDate: $travelDate, departureDatetime: $departureDatetime, passengerName: $passengerName, passengerDocument: $passengerDocument, passengerPhone: $passengerPhone, totalAmount: $totalAmount, paymentStatus: $paymentStatus, bookingStatus: $bookingStatus, paymentMethod: $paymentMethod, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.scheduleId, scheduleId) ||
                other.scheduleId == scheduleId) &&
            (identical(other.bookingCode, bookingCode) ||
                other.bookingCode == bookingCode) &&
            (identical(other.travelDate, travelDate) ||
                other.travelDate == travelDate) &&
            (identical(other.departureDatetime, departureDatetime) ||
                other.departureDatetime == departureDatetime) &&
            (identical(other.passengerName, passengerName) ||
                other.passengerName == passengerName) &&
            (identical(other.passengerDocument, passengerDocument) ||
                other.passengerDocument == passengerDocument) &&
            (identical(other.passengerPhone, passengerPhone) ||
                other.passengerPhone == passengerPhone) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.paymentStatus, paymentStatus) ||
                other.paymentStatus == paymentStatus) &&
            (identical(other.bookingStatus, bookingStatus) ||
                other.bookingStatus == bookingStatus) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.notes, notes) || other.notes == notes) &&
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
    userId,
    scheduleId,
    bookingCode,
    travelDate,
    departureDatetime,
    passengerName,
    passengerDocument,
    passengerPhone,
    totalAmount,
    paymentStatus,
    bookingStatus,
    paymentMethod,
    notes,
    createdAt,
    updatedAt,
  );

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      __$$BookingImplCopyWithImpl<_$BookingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookingImplToJson(this);
  }
}

abstract class _Booking implements Booking {
  const factory _Booking({
    required final int id,
    required final int userId,
    required final int scheduleId,
    required final String bookingCode,
    required final DateTime travelDate,
    required final DateTime departureDatetime,
    required final String passengerName,
    required final String passengerDocument,
    required final String passengerPhone,
    required final double totalAmount,
    required final String paymentStatus,
    required final String bookingStatus,
    required final String paymentMethod,
    final String? notes,
    required final DateTime createdAt,
    required final DateTime updatedAt,
  }) = _$BookingImpl;

  factory _Booking.fromJson(Map<String, dynamic> json) = _$BookingImpl.fromJson;

  @override
  int get id;
  @override
  int get userId;
  @override
  int get scheduleId;
  @override
  String get bookingCode;
  @override
  DateTime get travelDate;
  @override
  DateTime get departureDatetime;
  @override
  String get passengerName;
  @override
  String get passengerDocument;
  @override
  String get passengerPhone;
  @override
  double get totalAmount;
  @override
  String get paymentStatus;
  @override
  String get bookingStatus;
  @override
  String get paymentMethod;
  @override
  String? get notes;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of Booking
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookingImplCopyWith<_$BookingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
