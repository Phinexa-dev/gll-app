// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EducationDataModel {
  int get id => throw _privateConstructorUsedError;
  String get school => throw _privateConstructorUsedError;
  String get degree => throw _privateConstructorUsedError;
  DateTime get startdate => throw _privateConstructorUsedError;
  DateTime get enddate => throw _privateConstructorUsedError;

  /// Create a copy of EducationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EducationDataModelCopyWith<EducationDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationDataModelCopyWith<$Res> {
  factory $EducationDataModelCopyWith(
          EducationDataModel value, $Res Function(EducationDataModel) then) =
      _$EducationDataModelCopyWithImpl<$Res, EducationDataModel>;
  @useResult
  $Res call(
      {int id,
      String school,
      String degree,
      DateTime startdate,
      DateTime enddate});
}

/// @nodoc
class _$EducationDataModelCopyWithImpl<$Res, $Val extends EducationDataModel>
    implements $EducationDataModelCopyWith<$Res> {
  _$EducationDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EducationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? school = null,
    Object? degree = null,
    Object? startdate = null,
    Object? enddate = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      school: null == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String,
      degree: null == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String,
      startdate: null == startdate
          ? _value.startdate
          : startdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      enddate: null == enddate
          ? _value.enddate
          : enddate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EducationDataModelImplCopyWith<$Res>
    implements $EducationDataModelCopyWith<$Res> {
  factory _$$EducationDataModelImplCopyWith(_$EducationDataModelImpl value,
          $Res Function(_$EducationDataModelImpl) then) =
      __$$EducationDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String school,
      String degree,
      DateTime startdate,
      DateTime enddate});
}

/// @nodoc
class __$$EducationDataModelImplCopyWithImpl<$Res>
    extends _$EducationDataModelCopyWithImpl<$Res, _$EducationDataModelImpl>
    implements _$$EducationDataModelImplCopyWith<$Res> {
  __$$EducationDataModelImplCopyWithImpl(_$EducationDataModelImpl _value,
      $Res Function(_$EducationDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of EducationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? school = null,
    Object? degree = null,
    Object? startdate = null,
    Object? enddate = null,
  }) {
    return _then(_$EducationDataModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      school: null == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String,
      degree: null == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String,
      startdate: null == startdate
          ? _value.startdate
          : startdate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      enddate: null == enddate
          ? _value.enddate
          : enddate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$EducationDataModelImpl implements _EducationDataModel {
  const _$EducationDataModelImpl(
      {required this.id,
      required this.school,
      required this.degree,
      required this.startdate,
      required this.enddate});

  @override
  final int id;
  @override
  final String school;
  @override
  final String degree;
  @override
  final DateTime startdate;
  @override
  final DateTime enddate;

  @override
  String toString() {
    return 'EducationDataModel(id: $id, school: $school, degree: $degree, startdate: $startdate, enddate: $enddate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EducationDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.school, school) || other.school == school) &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.startdate, startdate) ||
                other.startdate == startdate) &&
            (identical(other.enddate, enddate) || other.enddate == enddate));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, school, degree, startdate, enddate);

  /// Create a copy of EducationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EducationDataModelImplCopyWith<_$EducationDataModelImpl> get copyWith =>
      __$$EducationDataModelImplCopyWithImpl<_$EducationDataModelImpl>(
          this, _$identity);
}

abstract class _EducationDataModel implements EducationDataModel {
  const factory _EducationDataModel(
      {required final int id,
      required final String school,
      required final String degree,
      required final DateTime startdate,
      required final DateTime enddate}) = _$EducationDataModelImpl;

  @override
  int get id;
  @override
  String get school;
  @override
  String get degree;
  @override
  DateTime get startdate;
  @override
  DateTime get enddate;

  /// Create a copy of EducationDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EducationDataModelImplCopyWith<_$EducationDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
