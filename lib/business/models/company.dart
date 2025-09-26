import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';
part 'company.g.dart';

@freezed
@JsonSerializable(
  createFactory: false,
  explicitToJson: true,
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class Company with _$Company {
  const factory Company({
    required int id,
    required String name,
    required String cuit,
    required String phone,
    required String email,
    required String address,
    required String icon,
    required bool isActive,
    required String createdAt,
    required String updatedAt,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) => _$CompanyFromJson(json);
}