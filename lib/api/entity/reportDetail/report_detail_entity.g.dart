// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_detail_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReportDetailEntity _$$_ReportDetailEntityFromJson(
        Map<String, dynamic> json) =>
    _$_ReportDetailEntity(
      mentalPointId: json['mentalPointId'] as String,
      createdDate: json['createdDate'] as String,
      point: json['point'] as int,
      reasonIdList: (json['reasonIdList'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$_ReportDetailEntityToJson(
        _$_ReportDetailEntity instance) =>
    <String, dynamic>{
      'mentalPointId': instance.mentalPointId,
      'createdDate': instance.createdDate,
      'point': instance.point,
      'reasonIdList': instance.reasonIdList,
    };
