// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReportEntity _$ReportEntityFromJson(Map<String, dynamic> json) {
  return _ReportEntity.fromJson(json);
}

/// @nodoc
mixin _$ReportEntity {
  String get mentalPointId => throw _privateConstructorUsedError;
  int get point => throw _privateConstructorUsedError;
  List<String> get reasonIdList => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReportEntityCopyWith<ReportEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportEntityCopyWith<$Res> {
  factory $ReportEntityCopyWith(
          ReportEntity value, $Res Function(ReportEntity) then) =
      _$ReportEntityCopyWithImpl<$Res, ReportEntity>;
  @useResult
  $Res call({String mentalPointId, int point, List<String> reasonIdList});
}

/// @nodoc
class _$ReportEntityCopyWithImpl<$Res, $Val extends ReportEntity>
    implements $ReportEntityCopyWith<$Res> {
  _$ReportEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mentalPointId = null,
    Object? point = null,
    Object? reasonIdList = null,
  }) {
    return _then(_value.copyWith(
      mentalPointId: null == mentalPointId
          ? _value.mentalPointId
          : mentalPointId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_ReportEntityCopyWith<$Res>
    implements $ReportEntityCopyWith<$Res> {
  factory _$$_ReportEntityCopyWith(
          _$_ReportEntity value, $Res Function(_$_ReportEntity) then) =
      __$$_ReportEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String mentalPointId, int point, List<String> reasonIdList});
}

/// @nodoc
class __$$_ReportEntityCopyWithImpl<$Res>
    extends _$ReportEntityCopyWithImpl<$Res, _$_ReportEntity>
    implements _$$_ReportEntityCopyWith<$Res> {
  __$$_ReportEntityCopyWithImpl(
      _$_ReportEntity _value, $Res Function(_$_ReportEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? mentalPointId = null,
    Object? point = null,
    Object? reasonIdList = null,
  }) {
    return _then(_$_ReportEntity(
      mentalPointId: null == mentalPointId
          ? _value.mentalPointId
          : mentalPointId // ignore: cast_nullable_to_non_nullable
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
class _$_ReportEntity implements _ReportEntity {
  const _$_ReportEntity(
      {required this.mentalPointId,
      required this.point,
      required final List<String> reasonIdList})
      : _reasonIdList = reasonIdList;

  factory _$_ReportEntity.fromJson(Map<String, dynamic> json) =>
      _$$_ReportEntityFromJson(json);

  @override
  final String mentalPointId;
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
    return 'ReportEntity(mentalPointId: $mentalPointId, point: $point, reasonIdList: $reasonIdList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportEntity &&
            (identical(other.mentalPointId, mentalPointId) ||
                other.mentalPointId == mentalPointId) &&
            (identical(other.point, point) || other.point == point) &&
            const DeepCollectionEquality()
                .equals(other._reasonIdList, _reasonIdList));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, mentalPointId, point,
      const DeepCollectionEquality().hash(_reasonIdList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportEntityCopyWith<_$_ReportEntity> get copyWith =>
      __$$_ReportEntityCopyWithImpl<_$_ReportEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReportEntityToJson(
      this,
    );
  }
}

abstract class _ReportEntity implements ReportEntity {
  const factory _ReportEntity(
      {required final String mentalPointId,
      required final int point,
      required final List<String> reasonIdList}) = _$_ReportEntity;

  factory _ReportEntity.fromJson(Map<String, dynamic> json) =
      _$_ReportEntity.fromJson;

  @override
  String get mentalPointId;
  @override
  int get point;
  @override
  List<String> get reasonIdList;
  @override
  @JsonKey(ignore: true)
  _$$_ReportEntityCopyWith<_$_ReportEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
