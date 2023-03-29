import 'package:freezed_annotation/freezed_annotation.dart';

part 'report_detail_entity.freezed.dart';
part 'report_detail_entity.g.dart';

@freezed
abstract class ReportDetailEntity with _$ReportDetailEntity {
  const factory ReportDetailEntity({
    required final String mentalPointId,
    required final String createdDate,
    required final int point,
    required final List<String> reasonIdList,
  }) = _ReportDetailEntity;

  factory ReportDetailEntity.fromJson(Map<String, dynamic> json) =>
    _$ReportDetailEntityFromJson(json);
}