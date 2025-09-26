import 'package:freezed_annotation/freezed_annotation.dart';

part 'route.freezed.dart';
part 'route.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class Route with _$Route {
  const factory Route({
    required int id,
    required int companyId,
    required String originCity,
    required String originTerminal,
    required String destinationCity,
    required String destinationTerminal,
    required int distanceKm,
    required int estimatedDurationMinutes,
    int? basePrice,
    required bool isActive,
    required String createdAt,
    required String updatedAt,
  }) = _Route;

  factory Route.fromJson(Map<String, dynamic> json) => _$RouteFromJson(json);
}