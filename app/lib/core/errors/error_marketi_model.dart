import 'package:json_annotation/json_annotation.dart';
import 'package:app/core/api/end_points.dart';

part 'error_marketi_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ErrorMarketiModel {
  @JsonKey(name: ApiKey.message, includeIfNull: true)
  final String? message;
  ErrorMarketiModel(this.message);

  factory ErrorMarketiModel.fromJson(Map<String, dynamic> json) => _$ErrorMarketiModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorMarketiModelToJson(this);
}
