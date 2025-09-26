// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************



_$RouteImpl _$$RouteImplFromJson(Map<String, dynamic> json) => _$RouteImpl(
  id: (json['id'] as num).toInt(),
  companyId: (json['company_id'] as num).toInt(),
  originCity: json['origin_city'] as String,
  originTerminal: json['origin_terminal'] as String,
  destinationCity: json['destination_city'] as String,
  destinationTerminal: json['destination_terminal'] as String,
  distanceKm: (json['distance_km'] as num).toInt(),
  estimatedDurationMinutes: (json['estimated_duration_minutes'] as num).toInt(),
  basePrice: (json['base_price'] as num?)?.toInt(),
  isActive: json['is_active'] as bool,
  createdAt: json['created_at'] as String,
  updatedAt: json['updated_at'] as String,
);

Map<String, dynamic> _$$RouteImplToJson(_$RouteImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'origin_city': instance.originCity,
      'origin_terminal': instance.originTerminal,
      'destination_city': instance.destinationCity,
      'destination_terminal': instance.destinationTerminal,
      'distance_km': instance.distanceKm,
      'estimated_duration_minutes': instance.estimatedDurationMinutes,
      'base_price': instance.basePrice,
      'is_active': instance.isActive,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
