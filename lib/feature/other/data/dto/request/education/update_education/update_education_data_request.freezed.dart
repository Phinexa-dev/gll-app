// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_education_data_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UpdateEducationDataRequest _$UpdateEducationDataRequestFromJson(
    Map<String, dynamic> json) {
  return _UpdateEducationDataRequest.fromJson(json);
}

/// @nodoc
mixin _$UpdateEducationDataRequest {
  @JsonKey(name: "school")
  String? get school => throw _privateConstructorUsedError;
  @JsonKey(name: "degree")
  String? get degree => throw _privateConstructorUsedError;
  @JsonKey(name: "startdate")
  DateTime? get startdate => throw _privateConstructorUsedError;
  @JsonKey(name: "enddate")
  DateTime? get enddate => throw _privateConstructorUsedError;

  /// Serializes this UpdateEducationDataRequest to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UpdateEducationDataRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UpdateEducationDataRequestCopyWith<UpdateEducationDataRequest>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateEducationDataRequestCopyWith<$Res> {
  factory $UpdateEducationDataRequestCopyWith(UpdateEducationDataRequest value,
          $Res Function(UpdateEducationDataRequest) then) =
      _$UpdateEducationDataRequestCopyWithImpl<$Res,
          UpdateEducationDataRequest>;
  @useResult
  $Res call(
      {@JsonKey(name: "school") String? school,
      @JsonKey(name: "degree") String? degree,
      @JsonKey(name: "startdate") DateTime? startdate,
      @JsonKey(name: "enddate") DateTime? enddate});
}

/// @nodoc
class _$UpdateEducationDataRequestCopyWithImpl<$Res,
        $Val extends UpdateEducationDataRequest>
    implements $UpdateEducationDataRequestCopyWith<$Res> {
  _$UpdateEducationDataRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UpdateEducationDataRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? school = freezed,
    Object? degree = freezed,
    Object? startdate = freezed,
    Object? enddate = freezed,
  }) {
    return _then(_value.copyWith(
      school: freezed == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String?,
      degree: freezed == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      startdate: freezed == startdate
          ? _value.startdate
          : startdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      enddate: freezed == enddate
          ? _value.enddate
          : enddate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UpdateEducationDataRequestImplCopyWith<$Res>
    implements $UpdateEducationDataRequestCopyWith<$Res> {
  factory _$$UpdateEducationDataRequestImplCopyWith(
          _$UpdateEducationDataRequestImpl value,
          $Res Function(_$UpdateEducationDataRequestImpl) then) =
      __$$UpdateEducationDataRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: "school") String? school,
      @JsonKey(name: "degree") String? degree,
      @JsonKey(name: "startdate") DateTime? startdate,
      @JsonKey(name: "enddate") DateTime? enddate});
}

/// @nodoc
class __$$UpdateEducationDataRequestImplCopyWithImpl<$Res>
    extends _$UpdateEducationDataRequestCopyWithImpl<$Res,
        _$UpdateEducationDataRequestImpl>
    implements _$$UpdateEducationDataRequestImplCopyWith<$Res> {
  __$$UpdateEducationDataRequestImplCopyWithImpl(
      _$UpdateEducationDataRequestImpl _value,
      $Res Function(_$UpdateEducationDataRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of UpdateEducationDataRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? school = freezed,
    Object? degree = freezed,
    Object? startdate = freezed,
    Object? enddate = freezed,
  }) {
    return _then(_$UpdateEducationDataRequestImpl(
      school: freezed == school
          ? _value.school
          : school // ignore: cast_nullable_to_non_nullable
              as String?,
      degree: freezed == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      startdate: freezed == startdate
          ? _value.startdate
          : startdate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      enddate: freezed == enddate
          ? _value.enddate
          : enddate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UpdateEducationDataRequestImpl implements _UpdateEducationDataRequest {
  const _$UpdateEducationDataRequestImpl(
      {@JsonKey(name: "school") this.school,
      @JsonKey(name: "degree") this.degree,
      @JsonKey(name: "startdate") this.startdate,
      @JsonKey(name: "enddate") this.enddate});

  factory _$UpdateEducationDataRequestImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$UpdateEducationDataRequestImplFromJson(json);

  @override
  @JsonKey(name: "school")
  final String? school;
  @override
  @JsonKey(name: "degree")
  final String? degree;
  @override
  @JsonKey(name: "startdate")
  final DateTime? startdate;
  @override
  @JsonKey(name: "enddate")
  final DateTime? enddate;

  @override
  String toString() {
    return 'UpdateEducationDataRequest(school: $school, degree: $degree, startdate: $startdate, enddate: $enddate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateEducationDataRequestImpl &&
            (identical(other.school, school) || other.school == school) &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.startdate, startdate) ||
                other.startdate == startdate) &&
            (identical(other.enddate, enddate) || other.enddate == enddate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, school, degree, startdate, enddate);

  /// Create a copy of UpdateEducationDataRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateEducationDataRequestImplCopyWith<_$UpdateEducationDataRequestImpl>
      get copyWith => __$$UpdateEducationDataRequestImplCopyWithImpl<
          _$UpdateEducationDataRequestImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UpdateEducationDataRequestImplToJson(
      this,
    );
  }
}

abstract class _UpdateEducationDataRequest
    implements UpdateEducationDataRequest {
  const factory _UpdateEducationDataRequest(
          {@JsonKey(name: "school") final String? school,
          @JsonKey(name: "degree") final String? degree,
          @JsonKey(name: "startdate") final DateTime? startdate,
          @JsonKey(name: "enddate") final DateTime? enddate}) =
      _$UpdateEducationDataRequestImpl;

  factory _UpdateEducationDataRequest.fromJson(Map<String, dynamic> json) =
      _$UpdateEducationDataRequestImpl.fromJson;

  @override
  @JsonKey(name: "school")
  String? get school;
  @override
  @JsonKey(name: "degree")
  String? get degree;
  @override
  @JsonKey(name: "startdate")
  DateTime? get startdate;
  @override
  @JsonKey(name: "enddate")
  DateTime? get enddate;

  /// Create a copy of UpdateEducationDataRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateEducationDataRequestImplCopyWith<_$UpdateEducationDataRequestImpl>
      get copyWith => throw _privateConstructorUsedError;
}
