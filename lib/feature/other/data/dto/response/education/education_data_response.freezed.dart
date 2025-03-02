// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'education_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EducationDataResponse _$EducationDataResponseFromJson(
    Map<String, dynamic> json) {
  return _EducationDataResponse.fromJson(json);
}

/// @nodoc
mixin _$EducationDataResponse {
  @JsonKey(name: "id")
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: "uid")
  int get uid => throw _privateConstructorUsedError;
  @JsonKey(name: "school")
  String get school => throw _privateConstructorUsedError;
  @JsonKey(name: "degree")
  String get degree => throw _privateConstructorUsedError;
  @JsonKey(name: "startdate")
  DateTime get startdate => throw _privateConstructorUsedError;
  @JsonKey(name: "enddate")
  DateTime get enddate => throw _privateConstructorUsedError;

  /// Serializes this EducationDataResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of EducationDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $EducationDataResponseCopyWith<EducationDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EducationDataResponseCopyWith<$Res> {
  factory $EducationDataResponseCopyWith(EducationDataResponse value,
          $Res Function(EducationDataResponse) then) =
      _$EducationDataResponseCopyWithImpl<$Res, EducationDataResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "uid") int uid,
      @JsonKey(name: "school") String school,
      @JsonKey(name: "degree") String degree,
      @JsonKey(name: "startdate") DateTime startdate,
      @JsonKey(name: "enddate") DateTime enddate});
}

/// @nodoc
class _$EducationDataResponseCopyWithImpl<$Res,
        $Val extends EducationDataResponse>
    implements $EducationDataResponseCopyWith<$Res> {
  _$EducationDataResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EducationDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
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
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
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
abstract class _$$EducationDataResponseImplCopyWith<$Res>
    implements $EducationDataResponseCopyWith<$Res> {
  factory _$$EducationDataResponseImplCopyWith(
          _$EducationDataResponseImpl value,
          $Res Function(_$EducationDataResponseImpl) then) =
      __$$EducationDataResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "id") int id,
      @JsonKey(name: "uid") int uid,
      @JsonKey(name: "school") String school,
      @JsonKey(name: "degree") String degree,
      @JsonKey(name: "startdate") DateTime startdate,
      @JsonKey(name: "enddate") DateTime enddate});
}

/// @nodoc
class __$$EducationDataResponseImplCopyWithImpl<$Res>
    extends _$EducationDataResponseCopyWithImpl<$Res,
        _$EducationDataResponseImpl>
    implements _$$EducationDataResponseImplCopyWith<$Res> {
  __$$EducationDataResponseImplCopyWithImpl(_$EducationDataResponseImpl _value,
      $Res Function(_$EducationDataResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of EducationDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uid = null,
    Object? school = null,
    Object? degree = null,
    Object? startdate = null,
    Object? enddate = null,
  }) {
    return _then(_$EducationDataResponseImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$EducationDataResponseImpl implements _EducationDataResponse {
  const _$EducationDataResponseImpl(
      {@JsonKey(name: "id") required this.id,
      @JsonKey(name: "uid") required this.uid,
      @JsonKey(name: "school") required this.school,
      @JsonKey(name: "degree") required this.degree,
      @JsonKey(name: "startdate") required this.startdate,
      @JsonKey(name: "enddate") required this.enddate});

  factory _$EducationDataResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$EducationDataResponseImplFromJson(json);

  @override
  @JsonKey(name: "id")
  final int id;
  @override
  @JsonKey(name: "uid")
  final int uid;
  @override
  @JsonKey(name: "school")
  final String school;
  @override
  @JsonKey(name: "degree")
  final String degree;
  @override
  @JsonKey(name: "startdate")
  final DateTime startdate;
  @override
  @JsonKey(name: "enddate")
  final DateTime enddate;

  @override
  String toString() {
    return 'EducationDataResponse(id: $id, uid: $uid, school: $school, degree: $degree, startdate: $startdate, enddate: $enddate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EducationDataResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.school, school) || other.school == school) &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.startdate, startdate) ||
                other.startdate == startdate) &&
            (identical(other.enddate, enddate) || other.enddate == enddate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, uid, school, degree, startdate, enddate);

  /// Create a copy of EducationDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EducationDataResponseImplCopyWith<_$EducationDataResponseImpl>
      get copyWith => __$$EducationDataResponseImplCopyWithImpl<
          _$EducationDataResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EducationDataResponseImplToJson(
      this,
    );
  }
}

abstract class _EducationDataResponse implements EducationDataResponse {
  const factory _EducationDataResponse(
          {@JsonKey(name: "id") required final int id,
          @JsonKey(name: "uid") required final int uid,
          @JsonKey(name: "school") required final String school,
          @JsonKey(name: "degree") required final String degree,
          @JsonKey(name: "startdate") required final DateTime startdate,
          @JsonKey(name: "enddate") required final DateTime enddate}) =
      _$EducationDataResponseImpl;

  factory _EducationDataResponse.fromJson(Map<String, dynamic> json) =
      _$EducationDataResponseImpl.fromJson;

  @override
  @JsonKey(name: "id")
  int get id;
  @override
  @JsonKey(name: "uid")
  int get uid;
  @override
  @JsonKey(name: "school")
  String get school;
  @override
  @JsonKey(name: "degree")
  String get degree;
  @override
  @JsonKey(name: "startdate")
  DateTime get startdate;
  @override
  @JsonKey(name: "enddate")
  DateTime get enddate;

  /// Create a copy of EducationDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EducationDataResponseImplCopyWith<_$EducationDataResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
