import 'package:freezed_annotation/freezed_annotation.dart';

part 'reason_entity.freezed.dart';
part 'reason_entity.g.dart';

@freezed
abstract class ReasonEntity with _$ReasonEntity {
  const factory ReasonEntity({
    required final String id,
    required final String reason,
  }) = _ReasonEntity;

  factory ReasonEntity.fromJson(Map<String, dynamic> json) =>
    _$ReasonEntityFromJson(json);
}