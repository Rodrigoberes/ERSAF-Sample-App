// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookingImpl _$$BookingImplFromJson(Map<String, dynamic> json) =>
    _$BookingImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      scheduleId: (json['scheduleId'] as num).toInt(),
      bookingCode: json['bookingCode'] as String,
      travelDate: DateTime.parse(json['travelDate'] as String),
      departureDatetime: DateTime.parse(json['departureDatetime'] as String),
      passengerName: json['passengerName'] as String,
      passengerDocument: json['passengerDocument'] as String,
      passengerPhone: json['passengerPhone'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      paymentStatus: json['paymentStatus'] as String,
      bookingStatus: json['bookingStatus'] as String,
      paymentMethod: json['paymentMethod'] as String,
      notes: json['notes'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BookingImplToJson(_$BookingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'scheduleId': instance.scheduleId,
      'bookingCode': instance.bookingCode,
      'travelDate': instance.travelDate.toIso8601String(),
      'departureDatetime': instance.departureDatetime.toIso8601String(),
      'passengerName': instance.passengerName,
      'passengerDocument': instance.passengerDocument,
      'passengerPhone': instance.passengerPhone,
      'totalAmount': instance.totalAmount,
      'paymentStatus': instance.paymentStatus,
      'bookingStatus': instance.bookingStatus,
      'paymentMethod': instance.paymentMethod,
      'notes': instance.notes,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
