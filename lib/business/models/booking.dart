import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking.freezed.dart';
part 'booking.g.dart';

@freezed
class Booking with _$Booking {
  const factory Booking({
    required int id,
    required int userId,
    required int scheduleId,
    required String bookingCode,
    required DateTime travelDate,
    required DateTime departureDatetime,
    required String passengerName,
    required String passengerDocument,
    required String passengerPhone,
    required double totalAmount,
    required String paymentStatus,
    required String bookingStatus,
    required String paymentMethod,
    String? notes,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _Booking;

  factory Booking.fromJson(Map<String, dynamic> json) => _$BookingFromJson(json);
}