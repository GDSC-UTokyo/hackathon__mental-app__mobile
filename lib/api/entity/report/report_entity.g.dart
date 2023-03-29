// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportEntity _$$_ReportEntityFromJson(Map<String, dynamic> json) =>
    _$_ReportEntity(
      mentalPointId: json['mentalPointId'] as String,
      point: json['point'] as int,
      reasonIdList: (json['reasonIdList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ReportEntityToJson(_$_ReportEntity instance) =>
    <String, dynamic>{
      'mentalPointId': instance.mentalPointId,
      'point': instance.point,
      'reasonIdList': instance.reasonIdList,
    };
