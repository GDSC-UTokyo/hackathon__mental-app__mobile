// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_detail_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportDetailEntity _$ReportDetailEntityFromJson(Map<String, dynamic> json) {
  return _ReportDetailEntity.fromJson(json);
}

/// @nodoc
mixin _$ReportDetailEntity {
  String get mentalPointId => throw _privateConstructorUsedError;
  String get createdDate => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  List<String> get reasonIdList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportDetailEntityCopyWith<ReportDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportDetailEntityCopyWith<$Res> {
  factory $ReportDetailEntityCopyWith(
          ReportDetailEntity value, $Res Function(ReportDetailEntity) then) =
      _$ReportDetailEntityCopyWithImpl<$Res, ReportDetailEntity>;
  @useResult
  $Res call(
      {String mentalPointId,
      String createdDate,
      int point,
      List<String> reasonIdList});
}

/// @nodoc
class _$ReportDetailEntityCopyWithImpl<$Res, $Val extends ReportDetailEntity>
    implements $ReportDetailEntityCopyWith<$Res> {
  _$ReportDetailEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mentalPointId = null,
    Object? createdDate = null,
    Object? point = null,
    Object? reasonIdList = null,
  }) {
    return _then(_value.copyWith(
      mentalPointId: null == mentalPointId
          ? _value.mentalPointId
          : mentalPointId // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      reasonIdList: null == reasonIdList
          ? _value.reasonIdList
          : reasonIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReportDetailEntityCopyWith<$Res>
    implements $ReportDetailEntityCopyWith<$Res> {
  factory _$$_ReportDetailEntityCopyWith(_$_ReportDetailEntity value,
          $Res Function(_$_ReportDetailEntity) then) =
      __$$_ReportDetailEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String mentalPointId,
      String createdDate,
      int point,
      List<String> reasonIdList});
}

/// @nodoc
class __$$_ReportDetailEntityCopyWithImpl<$Res>
    extends _$ReportDetailEntityCopyWithImpl<$Res, _$_ReportDetailEntity>
    implements _$$_ReportDetailEntityCopyWith<$Res> {
  __$$_ReportDetailEntityCopyWithImpl(
      _$_ReportDetailEntity _value, $Res Function(_$_ReportDetailEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mentalPointId = null,
    Object? createdDate = null,
    Object? point = null,
    Object? reasonIdList = null,
  }) {
    return _then(_$_ReportDetailEntity(
      mentalPointId: null == mentalPointId
          ? _value.mentalPointId
          : mentalPointId // ignore: cast_nullable_to_non_nullable
              as String,
      createdDate: null == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String,
      point: null == point
          ? _value.point
          : point // ignore: cast_nullable_to_non_nullable
              as int,
      reasonIdList: null == reasonIdList
          ? _value._reasonIdList
          : reasonIdList // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReportDetailEntity implements _ReportDetailEntity {
  const _$_ReportDetailEntity(
      {required this.mentalPointId,
      required this.createdDate,
      required this.point,
      required final List<String> reasonIdList})
      : _reasonIdList = reasonIdList;

  factory _$_ReportDetailEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ReportDetailEntityFromJson(json);

  @override
  final String mentalPointId;
  @override
  final String createdDate;
  @override
  final int point;
  final List<String> _reasonIdList;
  @override
  List<String> get reasonIdList {
    if (_reasonIdList is EqualUnmodifiableListView) return _reasonIdList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reasonIdList);
  }

  @override
  String toString() {
    return 'ReportDetailEntity(mentalPointId: $mentalPointId, createdDate: $createdDate, point: $point, reasonIdList: $reasonIdList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportDetailEntity &&
            (identical(other.mentalPointId, mentalPointId) ||
                other.mentalPointId == mentalPointId) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.point, point) || other.point == point) &&
            const DeepCollectionEquality()
                .equals(other._reasonIdList, _reasonIdList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mentalPointId, createdDate,
      point, const DeepCollectionEquality().hash(_reasonIdList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportDetailEntityCopyWith<_$_ReportDetailEntity> get copyWith =>
      __$$_ReportDetailEntityCopyWithImpl<_$_ReportDetailEntity>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportDetailEntityToJson(
      this,
    );
  }
}

abstract class _ReportDetailEntity implements ReportDetailEntity {
  const factory _ReportDetailEntity(
      {required final String mentalPointId,
      required final String createdDate,
      required final int point,
      required final List<String> reasonIdList}) = _$_ReportDetailEntity;

  factory _ReportDetailEntity.fromJson(Map<String, dynamic> json) =
      _$_ReportDetailEntity.fromJson;

  @override
  String get mentalPointId;
  @override
  String get createdDate;
  @override
  int get point;
  @override
  List<String> get reasonIdList;
  @override
  @JsonKey(ignore: true)
  _$$_ReportDetailEntityCopyWith<_$_ReportDetailEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
