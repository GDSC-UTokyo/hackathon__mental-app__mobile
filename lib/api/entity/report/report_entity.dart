import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_entity.freezed.dart';
part 'report_entity.g.dart';

@freezed
abstract class ReportEntity with _$ReportEntity {
  const factory ReportEntity({
    required final String mentalPointId,
    required final int point,
    required final List<String> reasonIdList,
  }) = _ReportEntity;

  factory ReportEntity.fromJson(Map<String, dynamic> json) =>
    _$ReportEntityFromJson(json);
}